package gefp.security;

import gefp.model.Role;
import gefp.model.User;
import gefp.model.dao.RoleDao;
import gefp.model.dao.UserDao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.naming.directory.Attributes;
import javax.naming.directory.SearchResult;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;

@Component
public class LdapAuthenticationHandler implements AuthenticationProvider {

    private static final Logger logger = LoggerFactory.getLogger( LdapAuthenticationHandler.class );

    @Autowired
    private UserDao userDao;

    @Autowired
    private RoleDao roleDao;

    @Override
    public Authentication authenticate( Authentication authentication )
        throws AuthenticationException
    {
        String username = authentication.getName();
        String password = authentication.getCredentials().toString();

        String domain = "ad.calstatela.edu";
        String choice = "username"; // username | email
        Authentication auth = null;

        try
        {

            if( isSystemAccount( username, password ) )
            {
                User user = userDao.getUserByUsername( username );

                List<GrantedAuthority> grantedAuths = new ArrayList<>();
                for( Role r : user.getRoles() )
                {
                    grantedAuths.add( new SimpleGrantedAuthority( r.getName() ) );
                }

                auth = new UsernamePasswordAuthenticationToken( user, password,
                    grantedAuths );

                return auth;
            }

            ActiveDirectory activeDirectory = new ActiveDirectory();
            activeDirectory.connect( domain, username, password );

            NamingEnumeration<SearchResult> result = activeDirectory.searchUser(
                username, choice, null );

            if( result.hasMore() )
            {
                SearchResult rs = (SearchResult) result.next();
                Attributes attrs = rs.getAttributes();
                User user = userDao.getUserByUsername( username );
                logger.info( "Username ( " + username
                    + " ) is authenticated from AD" );

                if( user == null )
                {
                    String temp = attrs.get( "givenName" ).toString();
                    String firstName = temp.substring( temp.indexOf( ":" ) + 1 );
                    temp = attrs.get( "mail" ).toString();
                    String emailId = temp.substring( temp.indexOf( ":" ) + 1 );
                    temp = attrs.get( "distinguishedName" ).toString();
                    String distinguishedName = temp.substring( temp.indexOf( ":" ) + 1 );
                    int facultyIndex = distinguishedName.indexOf( "OU=Employees" );

                    user = new User();
                    Set<Role> roles = new HashSet<Role>();
                    roles.add( roleDao.getRole( "STUDENT" ) );
                    if( facultyIndex > 0 )
                    {
                        roles.add( roleDao.getRole( "ADVISOR" ) );
                    }

                    user.setUsername( username );
                    user.setPassword( "" );
                    user.setFirstName( firstName );
                    user.setEmail( emailId );
                    user.setRoles( roles );
                    user.setEnabled( true );
                    user.setDepartment( null );
                    user.setMajor( null );
                    user.setFlightPlan( null );
                    user.setNewAccount( true );
                    user.setDeleted( false );
                    user = userDao.saveUser( user );
                }

                List<GrantedAuthority> grantedAuths = new ArrayList<>();
                for( Role r : user.getRoles() )
                {
                    grantedAuths.add( new SimpleGrantedAuthority( r.getName() ) );
                }

                auth = new UsernamePasswordAuthenticationToken( user, password,
                    grantedAuths );
            }
            else
            {
                logger.info( "No match found in AD for username :" + username );
            }
            activeDirectory.closeLdapConnection();
        }
        catch( NamingException e )
        {
            logger.info( "Invalid Username/Password" + e.getMessage() );
            e.printStackTrace();
        }
        catch( IOException e )
        {
            logger.debug( "Exception : " + e.getMessage() );
            e.printStackTrace();
        }
        catch( Exception e )
        {
            logger.debug( "Exception : " + e.getMessage() );
            e.printStackTrace();
        }
        return auth;
    }

    @Override
    public boolean supports( Class<?> authentication )
    {
        return authentication.equals( UsernamePasswordAuthenticationToken.class );
    }

    public boolean isSystemAccount( String username, String password )
    {
        User u = new User( username, password );
        if( userDao.validateUser( u ) != null ) return true;
        return false;
    }

}
