package com.project.one.model.biz;

import java.util.List;

import com.project.one.model.dto.EventDto;

public interface EventBiz {
	public List<EventDto> selectList();

	public EventDto selectOne(int event_no);

	public int insertEventClass(EventDto dto);
	
	public int insertEventProduct(EventDto dto);

	public int update(EventDto dto);

	public int delete(int event_no);
}
