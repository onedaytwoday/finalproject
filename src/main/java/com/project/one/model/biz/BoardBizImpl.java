package com.project.one.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.one.model.dao.BoardDao;
import com.project.one.model.dto.BoardDto;
import com.project.one.model.dto.PagingDto;

@Service
public class BoardBizImpl implements BoardBiz {

	@Autowired
	private BoardDao dao;
	
	@Override
	public List<BoardDto> board_notice_list(PagingDto Pdto) {
		return dao.board_notice_list(Pdto);
	}

	@Override
	public List<BoardDto> board_qna_list(PagingDto Pdto) {
		return dao.board_qna_list(Pdto);
	}

	@Override
	public BoardDto selectOne(int board_no) {
		return dao.selectOne(board_no);
	}

	@Override
	public int insert(BoardDto dto) {
		return dao.insert(dto);
	}
	
	@Override
	public int qna_insert(BoardDto dto) {
		return dao.qna_insert(dto);
	}

	@Override
	public int notice_insert(BoardDto dto) {
		return dao.notice_insert(dto);
	}
	@Override
	public int update(BoardDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int board_no) {
		return dao.delete(board_no);
	}

	@Override
	public int qna_count() {
		return dao.qna_count();
	}

	@Override
	public int notice_count() {
		return dao.notice_count();
	}

	



}
