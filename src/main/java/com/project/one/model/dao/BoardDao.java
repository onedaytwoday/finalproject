package com.project.one.model.dao;

import java.util.List;

import com.project.one.model.dto.BoardDto;
import com.project.one.model.dto.PagingDto;

public interface BoardDao {
	String NAMESPACE = "board.";
	
	public List<BoardDto> board_notice_list(PagingDto Pdto);
	
	public List<BoardDto> board_qna_list(PagingDto Pdto);
	
	public BoardDto selectOne(int board_no);
	
	public int insert(BoardDto dto);
	
	public int qna_insert(BoardDto dto);
	
	public int notice_insert(BoardDto dto);
	
	public int update(BoardDto dto);
	
	public int delete(int board_no);
	
	public int qna_count();
	
	public int notice_count();
}
