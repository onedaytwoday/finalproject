package com.project.one.model.dao;

import java.util.List;

import com.project.one.model.dto.EventDto;
import com.project.one.model.dto.PagingDto;

public interface EventDao {
	String NAMESPACE = "event.";
	
	public List<EventDto> allList();
	
	public List<EventDto> selectList();
	
	public List<EventDto> eventList(PagingDto dto);
	
	public EventDto eventClass(int class_no);
	
	public EventDto eventProduct(int product_no);
		
	public int insertEventClass(EventDto dto);
	
	public int insertEventProduct(EventDto dto);
	
	public int update(EventDto dto);
	
	public int updateNotiY(int event_no);
	
	public int updateNotiN(int event_no);
	
	public int delete(int event_no);
	
	public int eventCount();
}
