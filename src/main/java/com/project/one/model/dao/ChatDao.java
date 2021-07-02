package com.project.one.model.dao;

import java.util.List;

import com.project.one.model.dto.ChatDto;

public interface ChatDao {
	String NAMESPACE = "chat.";
	
	public List<ChatDto> selectList();
	
	// 회원별 채팅방 목록 조회
	public List<ChatDto> selectListByUser(String member_id);
	
	// 상담자별 채팅방 목록 조회
	public List<ChatDto> selectListByConsult(String consult_id);
	
	public ChatDto selectOne(int chat_no);
	
	public int insert(ChatDto dto);
	
	public int update(ChatDto dto);
	
	public int delete(int chat_no);
	
	public ChatDto isRoom(String member_id, String consult_id);
}
