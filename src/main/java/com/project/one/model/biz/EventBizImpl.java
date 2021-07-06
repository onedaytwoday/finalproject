package com.project.one.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.one.model.dao.EventDao;
import com.project.one.model.dto.EventDto;

@Service
public class EventBizImpl implements EventBiz {

	@Autowired
	private EventDao dao;
	
	@Override
	public List<EventDto> selectList() {
		return dao.selectList();
	}

	@Override
	public EventDto selectOne(int event_no) {
		return dao.selectOne(event_no);
	}

	@Override
	public int insertEventClass(EventDto dto) {
		return dao.insertEventClass(dto);
	}
	
	@Override
	public int insertEventProduct(EventDto dto) {
		return dao.insertEventProduct(dto);
	}

	@Override
	public int update(EventDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int event_no) {
		return dao.delete(event_no);
	}


}
