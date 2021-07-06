package com.project.one.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.WebSocketSession;

import com.project.one.model.dto.MemberDto;

import com.project.one.model.biz.MemberBiz;



@Controller
public class ChatController {
	
	@Autowired
	private MemberBiz biz;	

	
	@RequestMapping(value="/chat.do", method = RequestMethod.GET)
	public String chat(Model model,String member_id, HttpServletRequest request, HttpServletResponse response,HttpSession session) {
		
		return "view_chat";
	
	}

	
}
