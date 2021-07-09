package com.project.one.controller;




import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;





@Controller
public class ChatController {
	

	
	@RequestMapping("/chat.do")
	public String chat() {
		
		return "chat_list";
	}

	@RequestMapping("/tts.do")
	public String tts() {
		return "tts";
	}

	
}
