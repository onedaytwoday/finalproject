package com.project.one.model.biz;

import java.util.List;
import java.util.Map;

import com.project.one.model.dto.ChatreadDto;
import com.project.one.model.dto.RoomDto;

public interface RoomBiz {
	public List<RoomDto> selectList(Map<String, Object> map);

	// 회원별 채팅방 목록 조회
	public List<RoomDto> selectListByUser(String member_id);

	// 상담자별 채팅방 목록 조회
	public List<RoomDto> selectListByConsult(String consult_id);

	public List<ChatreadDto> member_read(String member_id);
	
	public List<ChatreadDto> consult_read(String member_id);
	
	public RoomDto selectOne(int room_no);

	public int insert(RoomDto dto);

	public int update(RoomDto dto);

	public int delete(int room_no);
	
	public RoomDto isRoom(RoomDto roomDto);

}
