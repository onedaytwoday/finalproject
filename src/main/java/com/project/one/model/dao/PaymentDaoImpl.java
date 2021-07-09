package com.project.one.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.one.model.dto.PaymentDto;

@Repository
public class PaymentDaoImpl implements PaymentDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<PaymentDto> selectList() {
		List<PaymentDto> list = new ArrayList<PaymentDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "selectList");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public PaymentDto selectOne(int payment_no) {
		PaymentDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", payment_no);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int insert(PaymentDto dto, String type) {
		int res = 0;
		
		switch(type) {
		case "product":
			res = sqlSession.insert(NAMESPACE + "insertProduct", dto);
			break;
			
		case "class":
			res = sqlSession.insert(NAMESPACE + "insertClass", dto);
			break;
			
		case "basket":
			res = sqlSession.insert(NAMESPACE + "insertBasket", dto);
			break;
		}
		
		return res;
	}

	@Override
	public int update(PaymentDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "update", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int delete(PaymentDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "delete", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public PaymentDto checkPaid(PaymentDto dto) {
		PaymentDto paid = null;
		
		try {
			paid = sqlSession.selectOne(NAMESPACE + "checkPaid", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return paid;
	}
	
	

}
