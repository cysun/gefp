package gefp.web.service;

import gefp.model.User;
import gefp.model.dao.UserDao;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserRestService {

    @Autowired
    UserDao userDao;

    private static final Logger logger = LoggerFactory.getLogger( UserRestService.class );

    @RequestMapping("/api/login")
    public String login( @RequestParam String username,
        @RequestParam String password, ModelMap models )
    {
        logger.info( "Login API called.." );

        User user = userDao.validateUser( new User( username, password ) );
        
        HashMap<String, User> usermap = new HashMap<String, User>();
        usermap.put( "user", user );
        
        models.put( "user", usermap );
        return "jsonView";
    }

}
