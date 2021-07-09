package com.project.one.util;

import java.util.ArrayList;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

import com.project.one.model.dao.RoomDao;
import com.project.one.model.dao.ChattingDao;
import com.project.one.model.dto.RoomDto;
import com.project.one.model.dto.ChattingDto;
import com.project.one.model.dto.MemberDto;

public class HandlerChat extends TextWebSocketHandler {

	private Logger logger = LoggerFactory.getLogger(HandlerChat.class);
	
	@Autowired
	private RoomDao cDao;
	@Autowired
	private ChattingDao roomDao;

	private List<WebSocketSession> connectedUsers;

	public HandlerChat() {
	      connectedUsers = new ArrayList<WebSocketSession>();
	   }

	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();


	//연결 후
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
	
		logger.info("{} 연결됨 :",session.getId());
	 
		users.put(session.getId(), session);
		connectedUsers.add(session);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		logger.info("{} 연결종료 :",session.getId());
		connectedUsers.remove(session);
		users.remove(session.getId());
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(message.getPayload());

		  Map<String, Object> map = null;
		  //채팅
	      RoomDto cDto = RoomDto.convertMessage(message.getPayload());
	      //채팅방
	      ChattingDto roomDto  = new ChattingDto();
	      roomDto.setRoom_no(cDto.getRoom_no()); //방번호
	      
	      if( !cDto.getMember_id().equals(cDto.getConsult_id())) {

	    	  //채팅방 존재하는지(member_id, consult_id받아서)
	    	 if(cDao.isRoom(cDto.getMember_id(), cDto.getConsult_id())==null ) {
	    		 
	    		 //방만들기
	    		  cDao.insert(cDto);
	    		 
	    	  }
	      }
	      for (WebSocketSession websocketSession : connectedUsers) {
	         map = websocketSession.getAttributes();
	         MemberDto mDto = (MemberDto) map.get("mDto");

	         //받는사람
	         if (mDto.getMember_id().equals(cDto.getMember_id())) {

	            Gson gson = new Gson();
	            String msgJson = gson.toJson(cDto);
	            websocketSession.sendMessage(new TextMessage(msgJson));
	         }


	      }
	      
	}




}
