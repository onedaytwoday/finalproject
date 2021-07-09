package com.project.one.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.one.model.dto.BasketDto;

@Repository
public class BasketDaoImpl implements BasketDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<BasketDto> selectList(String member_id) {
		List<BasketDto> list = new ArrayList<>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "selectList", member_id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	
	@Override
	public BasketDto selectOne(BasketDto dto) {
		BasketDto bDto = null;
		
		try {
			bDto = sqlSession.selectOne(NAMESPACE + "selectOne", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bDto;
	}

	@Override
	public int insert(BasketDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int update(BasketDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "update", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int delete(BasketDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "delete", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

}
