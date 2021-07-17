package com.project.one.config;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.project.one.model.biz.ChattingBiz;
import com.project.one.model.biz.RoomBiz;
import com.project.one.model.dto.ChattingDto;
import com.project.one.model.dto.MemberDto;
import com.project.one.model.dto.RoomDto;
import com.project.one.util.Translate;

public class EchoHandler extends TextWebSocketHandler {

	// 전체 메세지
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	// 1:1 메세지
	private Map<String, WebSocketSession> map = new HashMap<String, WebSocketSession>();

	private Map<String, Integer> room = new HashMap<String, Integer>();
	
	private static int i;
	
	@Autowired
	private ChattingBiz chatBiz;
	@Autowired
	private RoomBiz roomBiz;
	
	private String chatting_content = null;
	/**
	 * websocket 연결 성공 시
	 */
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		i++;
		sessionList.add(session);

		MemberDto dto = getdto(session);
		String opponent = getOpponent(session);
		int room_no = getNo(session);
		RoomDto rdto = roomBiz.selectOne(room_no);
		if(rdto != null) {
			chatting_content = rdto.getRoom_content();
		}
		room.put(dto.getMember_id(), room_no);
		map.put(dto.getMember_id(), session);
		if(room.get(opponent)!=null) {
			if(room.get(opponent).equals(room.get(dto.getMember_id()))){
				System.out.println("둘다 들어옴");
			}
		}
		
		System.out.println(dto.getMember_id() + " 연결 성공 => 총 접속 인원 : " + i + "명");
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		MemberDto dto = getdto(session);
		String opponent = getOpponent(session);
		int room_no = getNo(session);
		String text = getTranslated(message.getPayload());

		if (dto.getMember_grade().equals("관리자")) {
			for (WebSocketSession sess : sessionList) {
				for (String key : room.keySet() ) {
					int room_number = room.get(key);
					ChattingDto cDto = new ChattingDto();
					cDto.setChatting_content(text);
					cDto.setMember_id(dto.getMember_id());
					cDto.setRoom_no(room_number);
					chatBiz.insert(cDto);
				}
				sess.sendMessage(new TextMessage(dto.getMember_id() + " : " + text));
			}
		} else {
			WebSocketSession sess = map.get(dto.getMember_id());
			sess.sendMessage(new TextMessage(dto.getMember_id() + " : " + text));
			
			//메세지 insert
			chatting_content = text;
			ChattingDto cDto = new ChattingDto();
			cDto.setChatting_content(text);
			cDto.setRoom_no(room_no);
			cDto.setMember_id(dto.getMember_id());
			if(chatBiz.insert(cDto) > 0) {
				System.out.println("chatting-insert 성공");
			}else {
				System.out.println("chatting-insert 실패");
			}
			
			if (room.get(dto.getMember_id()).equals(room.get(opponent))) {
				WebSocketSession sess_op = map.get(opponent);
				if (sess_op != null) {
					sess_op.sendMessage(new TextMessage(dto.getMember_id() + " : " + text));
				}
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
		if(chatting_content != null) {
			RoomDto rDto = new RoomDto();
			rDto.setRoom_content(chatting_content);
			rDto.setRoom_no(room_no);
			if(roomBiz.update(rDto) > 0) {
				System.out.println("room-update 성공");
			}else {
				System.out.println("room-update 실패");
			}
		}
		if (sessionList != null) {
			sessionList.remove(session);
		}
		if(map != null) {
			map.remove(dto.getMember_id());
		}
	}

	private MemberDto getdto(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		MemberDto mDto = (MemberDto) httpSession.get("mDto");
		return mDto;
	}

	private String getOpponent(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		String opponent = (String) httpSession.get("opponent");
		return opponent;
	}

	private int getNo(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		int room_no = (Integer) httpSession.get("room_no");
		return room_no;
	}
	
	private String getTranslated(String text) {
		String lang = Translate.detectLangs(text);
		
		if(!lang.equals("ko")) {
			text = Translate.translate(text, lang, true);
		}
		
		return text;
	}
}
