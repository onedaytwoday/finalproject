package com.project.one.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.WebSocketSession;

import com.project.one.model.dto.ChatDto;
import com.project.one.model.dto.MemberDto;
import com.project.one.model.biz.ChatBiz;
import com.project.one.model.biz.MemberBiz;



@Controller
public class ChatController {
	
	@Autowired
	private MemberBiz biz;	

	@Autowired
	private ChatBiz cBiz;
	
	
	@RequestMapping("/chat.do")
    public ModelAndView enterChat(@RequestParam int chat_no,ModelAndView mav,HttpSession session) {
		String member_id = (String)session.getAttribute("member_id");
		ChatDto cDto = cBiz.selectOne(chat_no);
		mav.addObject("chat_no",chat_no);
		mav.addObject("member_id",member_id);
		mav.addObject("cDto",cDto);
		mav.setViewName("view_chat");
    	return mav;
    }
	
	
	@RequestMapping("/tts.do")
	public String tts() {
		return "tts";
	}

	
}
