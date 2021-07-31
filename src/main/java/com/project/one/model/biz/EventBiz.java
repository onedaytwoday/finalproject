package com.project.one.model.biz;

import java.util.List;

import com.project.one.model.dto.EventDto;
import com.project.one.model.dto.PagingDto;

public interface EventBiz {
	public List<EventDto> selectList();
	
	public List<EventDto> eventList(PagingDto dto);

	public EventDto eventClass(int class_no);
	
	public EventDto eventProduct(int product_no);

	public int insertEventClass(EventDto dto, String sale_rate);
	
	public int insertEventProduct(EventDto dto, String sale_rate);

	public int update(EventDto dto);
	
	public int updateNoti();

	public int delete(int event_no);
	
	public int eventCount();
}
