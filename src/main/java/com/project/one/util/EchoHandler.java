package com.project.one.util;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;



public class EchoHandler extends TextWebSocketHandler {
	private Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	//웹소켓 세션을 저장할 리스트
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		logger.info("{} 연결", session.getId());
		//세션 값을 가지고 디비 작업하면 채팅 참여 사용자 정보 리스트 구현 가능
		System.out.println("채팅 입장자 : "+session.getPrincipal().getName());
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("{}로부터 {}받음",session.getId(),message.getPayload());
		//연결된 모든 클라이언트에게 메세지 전송
		for(WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(session.getPrincipal().getName()+"|"+message.getPayload()));
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//연결끊어지면
		sessionList.remove(session);
		logger.info("{} 연결끊김 : ",session.getId());
		System.out.println("채팅방 퇴장자: "+session.getPrincipal().getName());
	}
	
	
	

}
