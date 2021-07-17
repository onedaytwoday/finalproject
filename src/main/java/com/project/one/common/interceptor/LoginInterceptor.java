package com.project.one.common.interceptor;


import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.project.one.model.dto.MemberDto;

public class LoginInterceptor implements HandlerInterceptor {

	private Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	private Set<String> member_history = new HashSet<String>();
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		if(request.getRequestURI().contains("/logout.do")){
			if(request.getSession().getAttribute("mDto") !=null) {
				MemberDto dto = (MemberDto)request.getSession().getAttribute("mDto");
				member_history.remove(dto.getMember_id());
				for(String s : member_history) {
					System.out.println("[Interceptor preHandle] 로그인된 아이디 : " + s);
				}
			}
			return true;
		}else if(request.getRequestURI().contains("/main.do")) {
			if(request.getSession().getAttribute("mDto") !=null) {
				MemberDto dto = (MemberDto)request.getSession().getAttribute("mDto");
				member_history.add(dto.getMember_id());
				for(String s : member_history) {
					System.out.println("[Interceptor preHandle] 로그인된 아이디 : " + s);
				}
			}
			return true;
		}else if(request.getRequestURI().contains("/chat_main.do")) {
			request.setAttribute("member_history", member_history);
		}
		
		return true;
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
