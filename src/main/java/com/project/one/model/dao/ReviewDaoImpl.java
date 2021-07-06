package com.project.one.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.one.model.dto.ReviewDto;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<ReviewDto> selectList() {
		List<ReviewDto> list = new ArrayList<ReviewDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "selectList");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public List<ReviewDto> avgList(int product_no) {
		List<ReviewDto> list = new ArrayList<ReviewDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "avgList",product_no);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	

	@Override
	public List<ReviewDto> selectListByUser(String member_id) {
		List<ReviewDto> list = new ArrayList<ReviewDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "selectListByUser", member_id);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public ReviewDto selectOne(int review_no) {
		ReviewDto dto = null;

		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", review_no);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public int insert(ReviewDto dto) {
		int res = 0;

		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int update(ReviewDto dto) {
		int res = 0;

		try {
			res = sqlSession.update(NAMESPACE + "update", dto);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int delete(int review_no) {
		int res = 0;

		try {
			res = sqlSession.delete(NAMESPACE + "delete", review_no);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

}
