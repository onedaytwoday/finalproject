package com.project.one.model.biz;

import java.util.List;

import com.project.one.model.dto.ChattingDto;

public interface ChattingBiz {
	public List<ChattingDto> selectList(int room_no);

	public ChattingDto selectOne(int chatting_no);

	public int insert(ChattingDto dto);

	public int update(ChattingDto dto);

	public int delete(int chatting_no);
	
	public List<ChattingDto> selectListByRoom(int room_no);
	
	
}
