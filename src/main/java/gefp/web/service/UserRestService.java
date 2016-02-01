package gefp.web.service;

import gefp.model.User;
import gefp.model.dao.UserDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserRestService {

    @Autowired
    UserDao userDao;

    @RequestMapping(method = RequestMethod.GET)
    public String login( @RequestParam String username,
        @RequestParam String password, ModelMap models )
    {
        User user = userDao.validateUser( new User( username, password ) );
        models.put( "user", user );
        return "jsonView";
    }

}
