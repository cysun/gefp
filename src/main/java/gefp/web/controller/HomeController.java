package gefp.web.controller;

import gefp.model.dao.UserDao;
import gefp.security.ActiveDirectory;
import gefp.security.ActiveDirectory2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.naming.directory.Attributes;
import javax.naming.directory.SearchResult;
import javax.naming.ldap.LdapContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

    @Autowired
    private UserDao userDao;

    @RequestMapping("/home.html")
    public String index( ModelMap models )
    {
        models.put( "users", userDao.getUsers() );
        return "users";
    }

    @RequestMapping("/403")
    public String accessDenied()
    {
        return "403";
    }

    public void loadProperties()
    {

        try
        {
            ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext(
                new String[] { "config.config" } );
            ctx.close();
        }
        catch( Throwable e )
        {
            System.out.println( e );
        }
        System.out.println( "CRUNCHIFY_URL: " );
    }

    @RequestMapping("/ActiveDirectoryLogin.html")
    public String activeDirectoryLogin( HttpServletRequest request,
        HttpServletResponse response )
    {
        System.out.println( "AD Login" );
        return "ADLogin";
    }

    @RequestMapping(value = "/ActiveDirectoryLogin.html",
        method = RequestMethod.POST)
    public void activeDirectoryLoginCheck( HttpServletRequest request,
        HttpServletResponse response )
    {

        PrintWriter out = null;

        String username = request.getParameter( "username" );
        String password = request.getParameter( "password" );
        String domain = "ad.calstatela.edu";
        String choice = "username"; // username | email
        System.out.println( "Authenticating user : " + username );

        try
        {
            out = response.getWriter();
            // out.println( "Username is " + username );
            // out.println( "Password is " + password );
            // out.println( "Domain is " + domain );

            ActiveDirectory activeDirectory = new ActiveDirectory( username,
                password, domain );

            // ActiveDirectory activeDirectory = new ActiveDirectory( "hgadhia",
            // "CHrs@257", domain );

            // Searching
            if( activeDirectory != null )
            {

                NamingEnumeration<SearchResult> result = activeDirectory.searchUser(
                    username, choice, null );

                if( result.hasMore() )
                {
                    SearchResult rs = (SearchResult) result.next();
                    Attributes attrs = rs.getAttributes();

                    String temp = attrs.get( "sAMAccountName" ).toString();
                    out.println( "Username : "
                        + temp.substring( temp.indexOf( ":" ) + 1 ) );
                    temp = attrs.get( "uid" ).toString();
                    out.println( "uid : "
                        + temp.substring( temp.indexOf( ":" ) + 1 ) );
                    temp = attrs.get( "givenName" ).toString();
                    out.println( "Name : "
                        + temp.substring( temp.indexOf( ":" ) + 1 ) );
                    temp = attrs.get( "mail" ).toString();
                    out.println( "Email ID    : "
                        + temp.substring( temp.indexOf( ":" ) + 1 ) );
                    temp = attrs.get( "cn" ).toString();
                    out.println( "Display Name : "
                        + temp.substring( temp.indexOf( ":" ) + 1 ) );
                    temp = attrs.get( "distinguishedName" ).toString();
                    out.println( "distinguishedName : "
                        + temp.substring( temp.indexOf( ":" ) + 1 ) );
                    temp = attrs.get( "userPrincipalName" ).toString();
                    out.println( "userPrincipalName : "
                        + temp.substring( temp.indexOf( ":" ) + 1 ) );
                }
                else
                {
                    out.println( "No result found!" );
                }
                // Closing LDAP Connection
                activeDirectory.closeLdapConnection();

            }

            else
            {
                out.println( "Invalid Username/Password" );
            }

        }
        catch( NamingException e )
        {
            out.println( "Invalid Username/Password" );
            System.out.println( "Invalid Username/Password" + e.getMessage() );
            // e.printStackTrace();
        }
        catch( IOException e )
        {
            System.out.println( "Exception : " + e.getMessage() );
            e.printStackTrace();
        }
    }

    /** OLD Script */

    @RequestMapping(value = "/ActiveDirectoryLoginOld.html",
        method = RequestMethod.POST)
    public void activeDirectoryLoginCheckActiveDirectory2(
        HttpServletRequest request, HttpServletResponse response )
    {

        String username = request.getParameter( "username" );
        String password = request.getParameter( "password" );
        String domain = "AD.calstatela.edu";

        System.out.println( "Authenticating user : " + username );

        try
        {
            PrintWriter out = response.getWriter();
            out.println( "Username is " + username );
            out.println( "Password is " + password );
            out.println( "Domain is " + domain );

            LdapContext connection = ActiveDirectory2.getConnection( username,
                password, domain, null );

            out.println( "Successfully Authenticated" );

            out.close();

            /*
             * User[] users = ActiveDirectory.getUsers( connection ); for( User
             * user : users ) System.out.println( user.toString() );
             */

            // ADUser user = ActiveDirectory.getUser( "hgadhia", connection );
            // System.out.println( user.toString() );
            connection.close();

        }
        catch( NamingException e )
        {
            System.out.println( "Invalid Username/password" );
            e.printStackTrace();
        }
        catch( IOException e )
        {
            System.out.println( "Exception : " + e.getMessage() );
            e.printStackTrace();
        }

    }
}
