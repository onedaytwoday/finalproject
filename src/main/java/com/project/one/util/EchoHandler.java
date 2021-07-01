package com.project.one.util;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler {
	//웹소켓 세션을 저장할 리스트
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	

}
