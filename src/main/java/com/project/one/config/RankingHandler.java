package com.project.one.config;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.project.one.model.biz.ClassBiz;
import com.project.one.model.biz.ProductBiz;
import com.project.one.model.dto.ClassDto;
import com.project.one.model.dto.PagingDto;
import com.project.one.model.dto.ProductDto;

public class RankingHandler extends TextWebSocketHandler {
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private Map<String, Integer> ranking = new HashMap<>();
	private int i;
	
	@Autowired
	private ClassBiz cBiz;
	
	@Autowired
	private ProductBiz pBiz;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		i++;
		sessionList.add(session);
		System.out.println(session.getId() + " 연결 성공 => 총 접속 인원 : " + i + "명");
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String[] messages = message.getPayload().split(",");		
		String text = messages[1];
		
		List<ClassDto> cList = new ArrayList<>();
		List<ProductDto> pList = new ArrayList<>();
		
		if(messages[0].equals("class")) {
			cList = cBiz.searchedList(text);
		} else {
			pList = pBiz.searchedList(text);		
		}
		
		if(cList.size() > 0 || pList.size() > 0) {
			if (ranking.containsKey(text)) {
				int count = ranking.get(text);
				ranking.replace(text, ++count);
			} else {
				ranking.put(text, 1);
			}
		}
		
        List<String> listKeySet = new ArrayList<>(ranking.keySet());
         
        Collections.sort(listKeySet, (value1, value2) -> (ranking.get(value2).compareTo(ranking.get(value1)))); 
        for(String key : listKeySet) { System.out.println("key : " + key + " , " + "value : " + ranking.get(key)); }

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
