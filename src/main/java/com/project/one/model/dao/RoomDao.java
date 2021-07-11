package com.project.one.model.dao;

import java.util.List;
import java.util.Map;

import com.project.one.model.dto.RoomDto;

public interface RoomDao {
	String NAMESPACE = "room.";
	
	public List<RoomDto> selectList(Map<String, Object> map);
	
	// 회원별 채팅방 목록 조회
	public List<RoomDto> selectListByUser(String member_id);
	
	// 상담자별 채팅방 목록 조회
	public List<RoomDto> selectListByConsult(String consult_id);
	
	public RoomDto selectOne(int room_no);
	
	public int insert(RoomDto dto);
	
	public int update(RoomDto dto);
	
	public int delete(int chat_no);
	//두 멤버 들어간 방 있는지
	public RoomDto isRoom(RoomDto roomDto);
	

}
