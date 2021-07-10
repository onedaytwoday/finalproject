package com.project.one.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.one.model.dto.RoomDto;

@Repository
public class RoomDaoImpl implements RoomDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<RoomDto> selectList(Map<String, Object> map) {
	
		return sqlSession.selectList(NAMESPACE+"selectList", map);
	}

	@Override
	public List<RoomDto> selectListByUser(String member_id) {
		List<RoomDto> list = new ArrayList<RoomDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "selectListByUser", member_id);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<RoomDto> selectListByConsult(String consult_id) {
		List<RoomDto> list = new ArrayList<RoomDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "selectListByConsult", consult_id);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public RoomDto selectOne(int chat_no) {
		RoomDto dto = null;

		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", chat_no);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public int insert(RoomDto dto) {
		int res = 0;

		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int update(RoomDto dto) {
		int res = 0;

		try {
			res = sqlSession.update(NAMESPACE + "update", dto);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int delete(int chat_no) {
		int res = 0;

		try {
			res = sqlSession.delete(NAMESPACE + "delete", chat_no);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public RoomDto isRoom(String member_id, String consult_id) {
		RoomDto dto = null;
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id", member_id);
		map.put("consult_id", consult_id);
		try {
			dto = sqlSession.selectOne(NAMESPACE + "isRoom",map );
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

}