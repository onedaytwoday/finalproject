package com.project.one.model.dao;

import java.util.List;

import com.project.one.model.dto.BoardDto;
import com.project.one.model.dto.PagingDto;

public interface BoardDao {
	String NAMESPACE = "board.";
	
	public List<BoardDto> board_notice_list(PagingDto Pdto);
	
	public List<BoardDto> board_qna_list(PagingDto Pdto);
	
	public List<BoardDto> board_notice_search(PagingDto Pdto);
	
	public List<BoardDto> board_qna_search(PagingDto Pdto);
	
	public List<BoardDto> my_qna_list(PagingDto dto);
	
	public BoardDto selectOne(int board_no);
	
	public int insert(BoardDto dto);
	
	public int qna_insert(BoardDto dto);
	
	public int notice_insert(BoardDto dto);
	
	public int update(BoardDto dto);
	
	public int board_read(BoardDto dto);
	
	public int delete(int board_no);
	
	public int qna_count();
	
	public int notice_count();
	
	public int my_qna_count(String member_id);
	
	public int search_notice_count(PagingDto Pdto);
	
	public int search_qna_count(PagingDto Pdto);
	
}
