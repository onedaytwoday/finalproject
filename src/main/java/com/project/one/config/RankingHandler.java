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
import com.project.one.model.biz.RankBiz;
import com.project.one.model.dto.ClassDto;
import com.project.one.model.dto.ProductDto;
import com.project.one.model.dto.RankDto;

public class RankingHandler extends TextWebSocketHandler {
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private List<RankDto> rList = null;
	private Map<String, Integer> ranking = new HashMap<>();
	private int i;
	
	@Autowired
	private ClassBiz cBiz;
	
	@Autowired
	private ProductBiz pBiz;
	
	@Autowired
	private RankBiz rBiz;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		i++;
		sessionList.add(session);
		
		System.out.println(session.getId() + " 연결 성공 => 총 접속 인원 : " + i + "명");
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		if(rList == null) {
			rList = rBiz.selectList();
			for(RankDto r : rList) {
				ranking.put(r.getRank_name(), 0);
			}
		}
		
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

        for(int i=0; i < 5; i++) {
        	RankDto dto = new RankDto(i+1, listKeySet.get(i));
        	if(rBiz.update(dto)>0) {
        		System.out.println("working!!!!!!");
        	} else {
        		System.out.println("no!!!!!!!!!!!!!");
        	}
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
}
