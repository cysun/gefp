package gefp.web.controller;

import gefp.model.dao.UserDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@Autowired
	private UserDao userDao;

	@RequestMapping("/home.html")
	public String index(ModelMap models) {
		models.put("users", userDao.getUsers());
		return "users";
	}
	
	@RequestMapping("/403")
	public String accessDenied(){
		return "403";
	}

	public void loadProperties() {

		try {
			ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext(
					new String[] { "config.config" });
		} catch (Throwable e) {
			System.out.println(e);
		}
		System.out.println("CRUNCHIFY_URL: ");
	}
}