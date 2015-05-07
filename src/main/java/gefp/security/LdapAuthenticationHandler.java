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
            logger.warn( "Authenticating:" + username );
            
            ActiveDirectory activeDirectory = new ActiveDirectory();
            activeDirectory.connect( domain, username, password );

            NamingEnumeration<SearchResult> result = activeDirectory.searchUser(
                username, choice, null );

            if( result.hasMore() )
            {
                SearchResult rs = (SearchResult) result.next();
                Attributes attrs = rs.getAttributes();

                // fetch the user's information.
                User user = userDao.getUserByUsername( username );
                logger.info( "username ( "+username+" ) is authenticated from AD" );
                
                if( user == null )
                {
                    logger.info( "Inside new User IF Loop" );
                    user = new User();
                    Set<Role> roles = new HashSet<Role>();
                    roles.add( roleDao.getRole( "STUDENT" ) );
                    user.setUsername( username );
                    user.setPassword( password );
                    user.setFirstName( attrs.get( "givenName" ).toString() );
                    user.setEmail( attrs.get( "mail" ).toString() );
                    user.setRoles( roles );
                    user.setEnabled( true );
                    user.setDepartment( null );
                    user = userDao.saveUser( user );
                    logger.info( "new user id is " + user.getId() );
                }

                List<GrantedAuthority> grantedAuths = new ArrayList<>();
                for( Role r : user.getRoles() )
                {
                    grantedAuths.add( new SimpleGrantedAuthority( r.getName() ) );
                }

                auth = new UsernamePasswordAuthenticationToken( user,
                    password, grantedAuths );

                // String temp = attrs.get( "sAMAccountName" ).toString();
                // System.out.println( "Username : "
                // + temp.substring( temp.indexOf( ":" ) + 1 ) );
                // temp = attrs.get( "uid" ).toString();
                // System.out.println( "uid : "
                // + temp.substring( temp.indexOf( ":" ) + 1 ) );
                // temp = attrs.get( "givenName" ).toString();
                // System.out.println( "Name : "
                // + temp.substring( temp.indexOf( ":" ) + 1 ) );
                // temp = attrs.get( "mail" ).toString();
                // System.out.println( "Email ID    : "
                // + temp.substring( temp.indexOf( ":" ) + 1 ) );
                // temp = attrs.get( "cn" ).toString();
                // System.out.println( "Display Name : "
                // + temp.substring( temp.indexOf( ":" ) + 1 ) );
                // temp = attrs.get( "distinguishedName" ).toString();
                // System.out.println( "distinguishedName : "
                // + temp.substring( temp.indexOf( ":" ) + 1 ) );
                // temp = attrs.get( "userPrincipalName" ).toString();
                // System.out.println( "userPrincipalName : "
                // + temp.substring( temp.indexOf( ":" ) + 1 ) );
            }
            else
            {
                logger.info( "No result found!" );
            }
            // Closing LDAP Connection
            activeDirectory.closeLdapConnection();
        }
        catch( NamingException e )
        {
            logger.info( "Invalid Username/Password" + e.getMessage() );
            e.printStackTrace();
        }
        catch( IOException e )
        {
            logger.info( "Exception : " + e.getMessage() );
            e.printStackTrace();
        }
        catch( Exception e )
        {
            logger.info( "Exception : " + e.getMessage() );
            e.printStackTrace();
        }
        return auth;
    }

    @Override
    public boolean supports( Class<?> authentication )
    {
        return authentication.equals( UsernamePasswordAuthenticationToken.class );
    }
}
