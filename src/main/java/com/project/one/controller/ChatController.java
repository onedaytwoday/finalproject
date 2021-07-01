package com.project.one.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class ChatController {
	
	@RequestMapping(value="/chat.do", method = RequestMethod.GET)
	public String chat(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		//로그인된 사용자?
		return "chat";
	}

}
