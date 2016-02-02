package gefp.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import gefp.model.User;
import gefp.model.dao.UserDao;

@Controller
public class UserRestController {
    
    @Autowired
    private UserDao userDao;
    
    
    @RequestMapping("/api/login")
    public String login( @RequestParam String username,
        @RequestParam String password, ModelMap models )
    {
        User user = userDao.validateUser( new User(username, password) );
        models.put( "user", user );
        return "jsonView";
    }
    
}
