package com.project.one.controller;



import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.project.one.model.dto.RoomDto;


import com.project.one.model.biz.RoomBiz;
import com.project.one.model.biz.ChattingBiz;
import com.project.one.model.biz.MemberBiz;




@Controller
public class ChatController {
	
	private Logger logger = LoggerFactory.getLogger(ChatController.class);

	@Autowired
	private RoomBiz rBiz;
	
	@Autowired
	private ChattingBiz cBiz;
	
	@RequestMapping("/chat.do")
	public String chat() {
		return "chat";
	}

	@RequestMapping("/tts.do")
	public String tts() {
		return "tts";
	}

	
}
