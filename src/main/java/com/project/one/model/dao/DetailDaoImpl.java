package com.project.one.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.one.model.dto.DetailDto;

@Repository
public class DetailDaoImpl implements DetailDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<DetailDto> selectList(int class_no) {
		List<DetailDto> list = new ArrayList<DetailDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "selectList", class_no);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public DetailDto selectOne(int class_no) {
		DetailDto dto = null;

		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", class_no);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public int insert(DetailDto dto) {
		int res = 0;

		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int update(int class_no) {
		int res = 0;

		try {
			res = sqlSession.update(NAMESPACE + "update", class_no);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int delete(int class_no) {
		int res = 0;

		try {
			res = sqlSession.delete(NAMESPACE + "delete", class_no);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

}
