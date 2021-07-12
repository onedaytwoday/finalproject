package com.project.one.config;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.project.one.model.dto.MemberDto;

public class EchoHandler extends TextWebSocketHandler {

	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	private static int i;

	/**
	 * websocket 연결 성공 시
	 */

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		i++;
		sessionList.add(session);
		MemberDto dto = getdto(session);
		System.out.println(dto.getMember_id() + " 연결 성공 => 총 접속 인원 : " + i + "명");
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		MemberDto dto = getdto(session);
		for (WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(dto.getMember_id() + " : " + message.getPayload()));
			System.out.println(message.getPayload().toString());
		}
		/*
		 * DB에 저장한다. int insertRes = chatBiz.insert(chatMessage);
		 * 
		 * if(insertRes == 1) { System.out.println("메세지 전송 및 DB 저장 성공"); }else {
		 * System.out.println("메세지 전송 실패!!! & DB 저장 실패!!"); }
		 */
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		i--;
		MemberDto dto = getdto(session);
		System.out.println(dto.getMember_id() + " 연결 종료 => 총 접속 인원 : " + i + "명");
		// sessionList에 session이 있다면
		if (sessionList != null) {
			sessionList.remove(session);
		}
	}

	private MemberDto getdto(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		MemberDto mDto = (MemberDto) httpSession.get("mDto");
		return mDto;
	}
}
