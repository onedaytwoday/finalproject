package com.project.one.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.one.model.dao.ChattingDao;
import com.project.one.model.dto.ChattingDto;

@Service
public class ChattingBizImpl implements ChattingBiz {

	@Autowired
	private ChattingDao dao;
	
	@Override
	public List<ChattingDto> selectList(int room_no) {
		return dao.selectList(room_no);
	}

	@Override
	public ChattingDto selectOne(int chatting_no) {
		return dao.selectOne(chatting_no);
	}

	@Override
	public int insert(ChattingDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(ChattingDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int chatting_no) {
		return dao.delete(chatting_no);
	}

	@Override
	public List<ChattingDto> selectListByRoom(int room_no) {

		return dao.selectListByRoom(room_no);
	}

	@Override
	public int deleteByRoom(int room_no) {
		
		return dao.deleteByRoom(room_no);
	}



}
