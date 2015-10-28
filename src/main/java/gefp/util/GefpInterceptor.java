package gefp.util;

import java.util.Date;

// import gefp.model.Users;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import gefp.model.RequestLog;
import gefp.model.User;
import gefp.model.dao.RequestLogDao;

@Component
public class GefpInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	RequestLogDao requestLogDao;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		RequestLog log = new RequestLog();
		log.setTimestamp(new Date());
		log.setClientIp(request.getRemoteAddr());
		log.setRequestMethod(request.getMethod());
		log.setRequetsUri(request.getRequestURI());

		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.setUserId(user.getUsername());

		if (user.isAdmin()) {
			log.setRole("ADMIN");
		} else if (user.isAdvisor()) {
			log.setRole("ADVISOR");
		} else if (user.isStudent()) {
			log.setRole("STUDENT");
		} else {
			log.setRole("ANONYMOUS");
		}
		requestLogDao.saveRequestLog(log);

		return true;

		// Security is being handled by Spring Security, so The interceptors are
		// not required.

		/*
		 * String uri = request.getRequestURI();
		 * 
		 * if (!uri.endsWith("login.html") && !uri.endsWith("logout.html")) {
		 * Users userData = (Users) request.getSession().getAttribute(
		 * "loggedInUser"); if (userData == null) {
		 * //response.sendRedirect("/gefp/user/login.html"); return false; } }
		 * return true;
		 */
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		// To do post handle
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

		// To do post handle
	}
}
