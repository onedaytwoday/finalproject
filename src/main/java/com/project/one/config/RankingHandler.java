package com.project.one.config;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class RankingHandler extends TextWebSocketHandler {
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private Map<String, Integer> ranking = new HashMap<>();
	private int i;
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		i++;
		sessionList.add(session);
		System.out.println(session.getId() + " 연결 성공 => 총 접속 인원 : " + i + "명");
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		int count = 1;
		String text = message.getPayload();
		
		ranking.put(text, count);
		
		Set<String> search = ranking.keySet();
		for(String s : search) {
			if(s.equals(text)) {
				count = ranking.get(s);
				ranking.replace(s, count++);
			}
		}
		
		
		for (WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(session.getId() + " : " + message.getPayload()));
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		i--;
		if (sessionList != null) {
			sessionList.remove(session);
		}
	}
}
