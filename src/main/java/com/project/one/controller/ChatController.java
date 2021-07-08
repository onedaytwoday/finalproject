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


import com.project.one.model.dto.ChatDto;

import com.project.one.model.biz.ChatBiz;




@Controller
public class ChatController {
	
	private Logger logger = LoggerFactory.getLogger(ChatController.class);

	@Autowired
	private ChatBiz cBiz;
	
	//채팅창(회원번호, 채팅방번호)
	@RequestMapping("/chat.do")
    public String enterChat(@RequestParam int chat_no,ModelAndView model,HttpSession session) {
		String member_id = (String)session.getAttribute("member_id");
		ChatDto cDto = cBiz.selectOne(chat_no);
		model.addObject("chat_no",chat_no);
		model.addObject("member_id",member_id);
		model.addObject("cDto",cDto);
    	return "chatting";
    }

	//회원별 채팅방목록
	@RequestMapping("/chatList.do")
	@ResponseBody
	public String selectChatList(ModelAndView model, HttpSession session) {
		String member_id = (String)session.getAttribute("member_id");
		List<ChatDto> list = cBiz.selectListByUser(member_id);
		model.addObject("list",list);
		
		return "chatlist";
	}
	// 채팅 메세지 전달
    @MessageMapping("/hello/{chat_no}")
    @SendTo("/subscribe/chat/{chat_no}")
    public ChatDto broadcasting(ChatDto cDto) {

    	logger.debug("받아온 data={}",cDto);
    	Map<String,Object> map = new HashMap<>();
    	map.put("cDto", cDto);
    	
        cDto.setChat_date(new Date());
        int result = cBiz.insert(cDto);
        logger.info("selectkey 사용 = {}",cDto);
        return cDto;
    }
	
	@RequestMapping("/tts.do")
	public String tts() {
		return "tts";
	}

	
}
