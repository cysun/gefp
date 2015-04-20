package gefp.web.controller;

import gefp.model.ADUser;
import gefp.model.dao.UserDao;
import gefp.security.ActiveDirectory;

import java.io.IOException;
import java.io.PrintWriter;

import javax.naming.NamingException;
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

        String username = request.getParameter( "username" );
        String password = request.getParameter( "password" );
        String domain = "AD.calstatela.edu";
        
        try
        {
            PrintWriter out = response.getWriter();
            out.println( "Username is " + username );
            out.println( "Password is " + password );
            out.println( "Domain is " + domain );
            
//            LdapContext connection = ActiveDirectory.getConnection( "hgadhia",
//                "CHrs@257", domain, null );
            
            LdapContext connection = ActiveDirectory.getConnection( username,
                password, domain, null );

            out.println( "Successfully Authenticated" );

            /*
             * User[] users = ActiveDirectory.getUsers( connection ); for( User
             * user : users ) System.out.println( user.toString() );
             */

            //ADUser user = ActiveDirectory.getUser( "hgadhia", connection );
            //System.out.println( user.toString() );
            connection.close();

        }
        catch( NamingException e )
        {
            System.out.println( "Exception" );
            e.printStackTrace();
        }
        catch( IOException e )
        {
            e.printStackTrace();
        }
        

    }
}
