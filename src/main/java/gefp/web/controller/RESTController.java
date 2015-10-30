package gefp.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import gefp.model.User;
import gefp.model.dao.UserDao;

@Controller
@RequestMapping("/webapi")
public class RESTController {

    @Autowired
    UserDao userDao;

    
    /*
     * Validate User Login
     */
    @RequestMapping(value = "/validate", method = RequestMethod.POST)
    @ResponseBody
    public User validateLogin( @RequestParam("username" ) String username,
        @RequestParam("password") String password)
    {
        User user = new User( username, password );
        return userDao.validateUser( user );
    }

    
    /*
     * Fetch a user by his username
     */
    @RequestMapping(value = "/fetchuser/{username}", method = RequestMethod.GET)
    @ResponseBody
    public User fetchUser( @PathVariable("username" ) String username)
    {
        return userDao.getUserByUsername( username );
    }
    
    /*
     * Update a user profile
     */
    @RequestMapping(value = "/updateuser/{username}", method = RequestMethod.PUT)
    @ResponseBody
    public User updateUser( @RequestBody User user)
    {
        return userDao.saveUser( user );
    }
    
    
}
