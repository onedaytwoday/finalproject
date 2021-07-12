package com.project.one.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.one.model.dto.ChattingDto;

@Repository
public class ChattingDaoImpl implements ChattingDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<ChattingDto> selectList() {
		List<ChattingDto> list = new ArrayList<ChattingDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "selectList");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public ChattingDto selectOne(int chatting_no) {
		ChattingDto dto = null;

		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", chatting_no);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public int insert(ChattingDto dto) {
		int res = 0;

		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int update(ChattingDto dto) {
		int res = 0;

		try {
			res = sqlSession.update(NAMESPACE + "update", dto);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int delete(int chatting_no) {
		int res = 0;

		try {
			res = sqlSession.delete(NAMESPACE + "delete", chatting_no);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public List<ChattingDto> selectListByRoom(int room_no) {
		List<ChattingDto> chatList = new ArrayList<ChattingDto>();
		try {
			chatList = sqlSession.selectList(NAMESPACE+"selectListByRoom", room_no);
		} catch (Exception e) {
			
		}
		return chatList;
	}




}
