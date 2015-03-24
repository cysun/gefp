package gefp.web.controller;

import gefp.model.User;
import gefp.model.dao.UserDao;
import gefp.web.validator.UserValidator;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
//import org.springframework.validation.BindingResult;
//import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes({ "loginuser"})
public class LoginController {

	@Autowired
	private UserDao userDao;

	@Autowired
	UserValidator userValidator;

	@RequestMapping(value = "/login.html", method = RequestMethod.GET)
	public String login(ModelMap models, HttpServletRequest request) {
		String errMsg = request.getParameter("error");
		if(errMsg!=null && errMsg.equals("true")) errMsg = "Invalid Username/Password";
		models.put("errorLogin", errMsg);
		return "login";
	}

	@RequestMapping(value = "/logout.html", method = RequestMethod.GET)
	public String logout(ModelMap models, HttpSession session) {
		session.removeAttribute("loggedInUser");
		session.removeAttribute("principal");
		session.invalidate();
		return "redirect:/j_spring_security_logout";
	}

	@RequestMapping(value = "/welcome.html", method = RequestMethod.GET)
	public String welcome(Principal principal, HttpSession session) {
		session.setAttribute("principal", principal);
		
		User user = userDao.getUserByUsername(principal.getName());
		session.setAttribute("loggedInUser", user);
		user.setUserTypesInSession(session);

		if (user.isAdmin()) {
			return "redirect:/admin/dashboard.html";
		} else if (user.isAdvisor()) {
			return "redirect:/advisor/dashboard.html";
		} else {
			return "redirect:/student/view-plan/" + user.getId()
					+ ".html";
		}		
	}	
	

/* Unused methods after using Spring Security */

/*	
	@RequestMapping(value = "/login.html", method = RequestMethod.POST)
	public String login( ModelMap models, @ModelAttribute("loginuser") Users loginuser,
			BindingResult bindingResult, HttpSession session) {
		userValidator.validate(loginuser, bindingResult);
		
		if (bindingResult.hasErrors())
			return "login";

		Users user = userDao.getUserByName(loginuser.getUsername());
		if (loginuser.isValidUser(user)) {

			session.setAttribute("loggedInUser", user);
			user.setUserTypesInSession(session);
			String superRole = (String) session.getAttribute("LoginUserRole");

			if (superRole.equals("Admin")) {
				return "redirect:/user/dashboard.html";
			} else if (superRole.equals("Advisor")) {
				return "redirect:/user/dashboard.html";
			} else {
				return "redirect:/student/view-plan/" + user.getFlightplan().getId()
						+ ".html";
			}
		} else {
			models.put("errorLogin","Invalid Username / Password");
			models.put("loginuser", new Users());
			return "login";
		}
	}
*/

}
