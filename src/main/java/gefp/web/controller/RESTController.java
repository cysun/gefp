package gefp.web.controller;

import gefp.model.User;
import gefp.model.dao.UserDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RESTController {

    
    @Autowired
    UserDao userDao;

    @RequestMapping("/api/login")
    public String login( @RequestParam String username,
        @RequestParam String password, ModelMap models )
    {
        User user = userDao.validateUser( new User( username, password ) );
        models.put( "user", user );
        return "jsonView";
    }
    
    
    
//    @Autowired
//    UserDao userDao;
//
//    
//    /*
//     * Validate User Login
//     */
//    @RequestMapping(value = "/validate", method = RequestMethod.POST)
//    @ResponseBody
//    public User validateLogin( @RequestParam("username" ) String username,
//        @RequestParam("password") String password)
//    {
//        User user = new User( username, password );
//        return userDao.validateUser( user );
//    }
//
//    
//    /*
//     * Fetch a user by his username
//     */
//    @RequestMapping(value = "/fetchuser/{username}", method = RequestMethod.GET)
//    @ResponseBody
//    public User fetchUser( @PathVariable("username" ) String username)
//    {
//        return userDao.getUserByUsername( username );
//    }
//    
//    /*
//     * Update a user profile
//     */
//    @RequestMapping(value = "/updateuser/{username}", method = RequestMethod.PUT)
//    @ResponseBody
//    public User updateUser( @RequestBody User user)
//    {
//        return userDao.saveUser( user );
//    }
    
    
}
