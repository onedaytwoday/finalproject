package com.project.one.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.one.model.dao.BoardDao;
import com.project.one.model.dto.BoardDto;

@Service
public class BoardBizImpl implements BoardBiz {

	@Autowired
	private BoardDao dao;
	
	@Override
	public List<BoardDto> selectList(String board_category) {
		return dao.selectList(board_category);
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



}
