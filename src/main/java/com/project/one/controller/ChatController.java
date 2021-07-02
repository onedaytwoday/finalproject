package com.project.one.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.WebSocketSession;

import com.project.one.model.dto.MemberDto;


@Controller
public class ChatController {
	
	@RequestMapping(value="/chat.do", method = RequestMethod.GET)
	public ModelAndView chat(ModelAndView mv , WebSocketSession session) {
		mv.addObject("userid",session.getPrincipal().getName()); 
		//로그인된 사용자?
		return mv;
	}

}
