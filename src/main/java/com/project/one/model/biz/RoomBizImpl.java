package com.project.one.model.biz;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.one.model.dao.RoomDao;
import com.project.one.model.dto.RoomDto;

@Service
public class RoomBizImpl implements RoomBiz {

	@Autowired
	private RoomDao dao;
	
	@Override
	public List<RoomDto> selectList(Map<String, Object> map) {
		List<RoomDto> list = dao.selectList(map);
		return list;
	}

	@Override
	public List<RoomDto> selectListByUser(String member_id) {
		return dao.selectListByUser(member_id);
	}
	
	@Override
	public List<RoomDto> selectListByConsult(String consult_id) {
		return dao.selectListByConsult(consult_id);
	}

	@Override
	public RoomDto selectOne(int chat_no) {
		return dao.selectOne(chat_no);
	}

	@Override
	public int insert(RoomDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(RoomDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int chat_no) {
		return dao.delete(chat_no);
	}

}
