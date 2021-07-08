package com.project.one.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.one.model.dto.BasketDto;

@Repository
public class BasketDaoImpl implements BasketDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
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
	public int delete(int basket_no) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "delete", basket_no);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

}
