package com.project.one.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {

	private Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("[Interceptor] : preHandle");
		
		if(request.getRequestURI().contains("/loginform.do") ||
		   request.getRequestURI().contains("/ajaxlogin.do") ||
		   request.getSession().getAttribute("login") != null ||
		   request.getRequestURI().contains("/test.do") ||
		   request.getRequestURI().contains("/registerform.do") ||
		   request.getRequestURI().contains("/register.do")
		   ) {
			return true;
		}
		
		if(request.getSession().getAttribute("login") == null) {
			response.sendRedirect("loginform.do");
		}
		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.info("[Interceptor] : postHandle");
		
		if(modelAndView != null) {
			logger.info("target View : " + modelAndView.getViewName());
		}
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		logger.info("[Interceptor] : afterCompletion");
	}

}
