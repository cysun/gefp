package gefp.web.service;

import gefp.model.User;
import gefp.model.dao.UserDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserRestController {
    
    @Autowired
    UserDao userDao;
    
    @RequestMapping("/api/login")
    public User greeting(@RequestParam(value="username") String username, @RequestParam(value="password") String password) {
        return userDao.validateUser( new User(username, password) );
    }
    
}
