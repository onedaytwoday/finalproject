package com.project.one.config;

import java.util.ArrayList;
import java.util.HashMap;
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
	
	private int getNo(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		int room_no = (Integer) httpSession.get("room_no");
		return room_no;
	}
}
