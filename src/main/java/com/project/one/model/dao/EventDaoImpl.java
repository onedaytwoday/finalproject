package com.project.one.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.one.model.dto.EventDto;

@Repository
public class EventDaoImpl implements EventDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

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
	public EventDto selectOne(int event_no) {
		EventDto dto = null;

		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", event_no);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public int insert(EventDto dto) {
		int res = 0;

		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);

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
	public int delete(int event_no) {
		int res = 0;

		try {
			res = sqlSession.delete(NAMESPACE + "delete", event_no);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

}
