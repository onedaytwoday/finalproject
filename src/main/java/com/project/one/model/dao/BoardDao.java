package com.project.one.model.dao;

import java.util.List;

import com.project.one.model.dto.BoardDto;

public interface BoardDao {
	String NAMESPACE = "board.";
	
	public List<BoardDto> selectList();
	
	public BoardDto selectOne(int board_no);
	
	public int insert(BoardDto dto);
	
	public int update(BoardDto dto);
	
	public int delete(int board_no);
}