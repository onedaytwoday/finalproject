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

	private Map<Integer,WebSocketSession> sessionList = new HashMap<Integer, WebSocketSession>();

	private static int i;

	/**
	 * websocket 연결 성공 시
	 */

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		i++;
		MemberDto dto = getdto(session);
		int room_no = getNo(session);
		sessionList.put(room_no,session);
		System.out.println("room_no : " + room_no +"\t" + dto.getMember_id() + " 연결 성공 => 총 접속 인원 : " + i + "명");
		System.out.println(sessionList.toString());
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		MemberDto dto = getdto(session);
		int room_no = getNo(session);
		for (Map.Entry<Integer, WebSocketSession> entry : sessionList.entrySet()) {
			if(entry.getKey()== room_no) {
				System.out.println("entry.getKey: " + entry.getKey()+" id:"+ dto.getMember_id() + "entry.getvalue: "+ entry.getValue());
			entry.getValue().sendMessage(new TextMessage(dto.getMember_id() + " : " + message.getPayload()));
			System.out.println(message.getPayload().toString());
			}
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		i--;
		MemberDto dto = getdto(session);
		int room_no = getNo(session);
		System.out.println(dto.getMember_id() + " 연결 종료 => 총 접속 인원 : " + i + "명");
		// sessionList에 session이 있다면
		if (sessionList != null) {
			sessionList.remove(room_no);
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
