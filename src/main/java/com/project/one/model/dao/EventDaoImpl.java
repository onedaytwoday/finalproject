package com.project.one.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.one.model.dto.EventDto;
import com.project.one.model.dto.PagingDto;

@Repository
public class EventDaoImpl implements EventDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<EventDto> allList() {
		List<EventDto> list = new ArrayList<EventDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "allList");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<EventDto> selectList() {
		List<EventDto> list = new ArrayList<EventDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "selectList");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public List<EventDto> eventList(PagingDto dto) {
		List<EventDto> list = new ArrayList<EventDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "eventList", dto);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public EventDto eventClass(int class_no) {
		EventDto dto = new EventDto();
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "eventClass", class_no);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public EventDto eventProduct(int product_no) {
		EventDto dto = new EventDto();
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "eventProduct", product_no);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	
	@Override
	public int insertEventClass(EventDto dto) {
		int res = 0;

		try {
			res = sqlSession.insert(NAMESPACE + "insertEventClass", dto);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int insertEventProduct(EventDto dto) {
		int res = 0;

		try {
			res = sqlSession.insert(NAMESPACE + "insertEventProduct", dto);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int update(EventDto dto) {
		int res = 0;

		try {
			res = sqlSession.update(NAMESPACE + "update", dto);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}
	
	@Override
	public int updateNotiY(int event_no) {
		int res = 0;

		try {
			res = sqlSession.update(NAMESPACE + "updateNotiY", event_no);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}
	
	@Override
	public int updateNotiN(int event_no) {
		int res = 0;

		try {
			res = sqlSession.update(NAMESPACE + "updateNotiN", event_no);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int delete(int event_no) {
		int res = 0;

		try {
			res = sqlSession.delete(NAMESPACE + "delete", event_no);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int eventCount() {
		int res = 0;

		try {
			res = sqlSession.selectOne(NAMESPACE + "eventCount");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

}
