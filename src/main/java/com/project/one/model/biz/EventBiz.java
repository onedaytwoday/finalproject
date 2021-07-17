package com.project.one.model.biz;

import java.util.List;

import com.project.one.model.dto.EventDto;
import com.project.one.model.dto.PagingDto;

public interface EventBiz {
	public List<EventDto> selectList();
	
	public List<EventDto> eventList(PagingDto dto);

	public EventDto selectOne(int event_no);

	public int insertEventClass(EventDto dto, String sale_rate);
	
	public int insertEventProduct(EventDto dto, String sale_rate);

	public int update(EventDto dto);
	
	public int updateNoti(int event_no);

	public int delete(int event_no);
	
	public int eventCount();
}
