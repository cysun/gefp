package gefp.web.controller;

import gefp.model.dao.UserDao;
import gefp.security.LdapAuthenticationHandler;
import gefp.web.validator.UserValidator;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
//import org.springframework.validation.BindingResult;
//import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes({ "loginuser" })
public class LoginController {
    
    private static final Logger logger = LoggerFactory.getLogger( LdapAuthenticationHandler.class );
    
    @Autowired
    private UserDao userDao;

    @Autowired
    UserValidator userValidator;

    @RequestMapping(value = "/login.html", method = RequestMethod.GET)
    public String login( ModelMap models, HttpServletRequest request )
    {
        logger.warn( "Login Page called" );
        
        String errMsg = request.getParameter( "error" );
        if( errMsg != null && errMsg.equals( "true" ) )
            errMsg = "Invalid Username/Password";
        models.put( "errorLogin", errMsg );
        return "login";
    }

    @RequestMapping(value = "/logout.html", method = RequestMethod.GET)
    public String logout( ModelMap models, HttpSession session )
    {
        session.removeAttribute( "loggedInUser" );
        session.invalidate();
        return "redirect:/j_spring_security_logout";
    }

    
    /* Following method is not being used */
//    @RequestMapping(value = "/welcome.html", method = RequestMethod.GET)
//    public String welcome( Principal principal, HttpSession session )
//    {
//        session.setAttribute( "principal", principal );
//
//        User user = userDao.getUserByUsername( principal.getName() );
//        session.setAttribute( "loggedInUser", user );
//        user.setUserTypesInSession( session );
//
//        if( user.isAdmin() )
//        {
//            return "redirect:/admin/dashboard.html";
//        }
//        else if( user.isAdvisor() )
//        {
//            return "redirect:/advisor/dashboard.html";
//        }
//        else
//        {
//            return "redirect:/student/view-plan/" + user.getId() + ".html";
//        }
//    }

}
