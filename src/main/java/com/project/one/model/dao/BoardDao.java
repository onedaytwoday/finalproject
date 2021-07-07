package com.project.one.model.dao;

import java.util.List;

import com.project.one.model.dto.BoardDto;

public interface BoardDao {
	String NAMESPACE = "board.";
	
	public List<BoardDto> selectList(String board_category);
	
	public BoardDto selectOne(int board_no);
	
	public int insert(BoardDto dto);
	
	public int qna_insert(BoardDto dto);
	
	public int notice_insert(BoardDto dto);
	
	public int update(BoardDto dto);
	
	public int delete(int board_no);
	
	public int qna_count();
	
	public int notice_count();
}
