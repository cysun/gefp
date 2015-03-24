package gefp.util;

// import gefp.model.Users;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class GefpInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {

		return true;

		// Security is being handled by Spring Security, so The interceptors are not required.
		
		/*
		String uri = request.getRequestURI();

		if (!uri.endsWith("login.html") && !uri.endsWith("logout.html")) {
			Users userData = (Users) request.getSession().getAttribute(
					"loggedInUser");
			if (userData == null) {
				//response.sendRedirect("/gefp/user/login.html");
				return false;
			}
		}
		return true;
		*/
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
			
		// To do post handle
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

		// To do post handle
	}
}