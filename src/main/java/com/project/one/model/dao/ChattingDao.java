package com.project.one.model.dao;

import java.util.List;

import com.project.one.model.dto.ChattingDto;

public interface ChattingDao {
	String NAMESPACE = "chatting.";
	
	public List<ChattingDto> selectList();
	
	public ChattingDto selectOne(int chatting_no);
	
	public int insert(ChattingDto dto);
	
	public int update(ChattingDto dto);
	
	public int delete(int chatting_no);

	
}
