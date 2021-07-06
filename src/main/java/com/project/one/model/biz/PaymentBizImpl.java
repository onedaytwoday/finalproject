package com.project.one.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.one.model.dao.PaymentDao;
import com.project.one.model.dto.PaymentDto;
import com.project.one.util.Payment;

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

	@Transactional
	@Override
	public int delete(PaymentDto dto) {
		int res = 0;
		
		if(Payment.cancelPayment(dto.getPayment_uid())) {
			res = dao.delete(dto);			
		}
		
		return res;
	}

	@Override
	public PaymentDto checkPaid(PaymentDto dto) {
		return dao.checkPaid(dto);
	}

}
