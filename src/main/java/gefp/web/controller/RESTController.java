package gefp.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

	@RequestMapping(value = "/validate", method = RequestMethod.POST)
	@ResponseBody
	public User validateLogin(@RequestParam String username, @RequestParam String password) {
		User user = new User(username, password);
		return userDao.validateUser(user);
	}

}
