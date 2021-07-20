package com.project.one.config;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.project.one.model.biz.ReviewBiz;

import com.project.one.model.biz.ClassBiz;
import com.project.one.model.dto.ClassDto;
import com.project.one.model.dto.PagingDto;

public class RankingHandler extends TextWebSocketHandler {
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private Map<String, Integer> ranking = new HashMap<>();
	private int i;
	private int COUNT = 1;
	
	@Autowired
	private ClassBiz cBiz;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		i++;
		sessionList.add(session);
		
		String[] res = getSearch(session);
		if(res!=null) {
			for(int i=0;i<res.length;i++) {
				ranking.put(res[i], 0);
			}
		}
		System.out.println(session.getId() + " 연결 성공 => 총 접속 인원 : " + i + "명");
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String text = message.getPayload();
				
		if(ranking.containsKey(text)) {
			int count = ranking.get(text);
			ranking.replace(text, ++count);
		} else {
			PagingDto pDto = new PagingDto();
			pDto.setSearch_category("title+desc+category");
			pDto.setSearch_keyword(text);
			
			if(cBiz.classListSearch(pDto) != null) {
				System.out.println("NOT NULL!!!!!!!!!!!");
				ranking.put(text, COUNT);
			} else {
				System.out.println("NULL!!!!!!!!!!!");
			}
		}
		
        List<String> listKeySet = new ArrayList<>(ranking.keySet());
        
        // 내림차순 정렬
        System.out.println("-------------- 내림차순 정렬 --------------"); 
        Collections.sort(listKeySet, (value1, value2) -> (ranking.get(value2).compareTo(ranking.get(value1)))); 
        for(String key : listKeySet) { 
        	System.out.println("key : " + key + " , " + "value : " + ranking.get(key)); 
        }
        
        
		for (WebSocketSession sess : sessionList) {
				sess.sendMessage(new TextMessage(listKeySet.get(0) +":"+ listKeySet.get(1) +":"+ listKeySet.get(2) 
												+":"+ listKeySet.get(3) +":"+ listKeySet.get(4)));
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		i--;
		if (sessionList != null) {
			sessionList.remove(session);
		}
		System.out.println("총 접속 인원 : " + i + "명");
	}
	private String[] getSearch(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		String[] res = (String[]) httpSession.get("res");
		return res;
	}
}
