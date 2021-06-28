package com.project.one.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.one.model.dao.PaymentDao;
import com.project.one.model.dto.PaymentDto;

@Service
public class PaymentBizImpl implements PaymentBiz {

	@Autowired
	private PaymentDao dao;
	
	@Override
	public List<PaymentDto> selectList() {
		return dao.selectList();
	}

	@Override
	public PaymentDto selectOne(int payment_no) {
		return dao.selectOne(payment_no);
	}

	@Override
	public int insert(PaymentDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(PaymentDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int payment_no) {
		return dao.delete(payment_no);
	}

}
