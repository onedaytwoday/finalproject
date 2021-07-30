package com.project.one.model.biz;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.one.model.dao.PaymentDao;
import com.project.one.model.dto.PagingDto;
import com.project.one.model.dto.PaymentDto;
import com.project.one.util.Payment;

@Service
public class PaymentBizImpl implements PaymentBiz {

	@Autowired
	private PaymentDao dao;
	
	@Autowired
	private ProductBiz proBiz;
	
	@Autowired
	private DetailBiz dBiz;
	
	@Override
	public List<PaymentDto> selectList() {
		return dao.selectList();
	}
	
	@Override
	public List<PaymentDto> paymentList(PagingDto pDto) {
		return dao.paymentList(pDto);
	}
	
	@Override
	public List<PaymentDto> montlyPayment() {
		return dao.montlyPayment();
	}
	
	@Override
	public PaymentDto selectOne(int payment_no) {
		return dao.selectOne(payment_no);
	}


	@Override
	public int insert(PaymentDto dto, String type) {
		switch(type) {
		case "product" :
			dto.setPayment_num(1);
			break;
			
		case "class" :			
			dto.setPayment_num(1);
			dBiz.update(dto.getDetail_no());
			break;
		}
		
		
		return dao.insert(dto, type);
	}
	
	@Override
	public int updateStatus(PaymentDto dto) {
		return dao.updateStatus(dto);
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

	@Override
	public List<PaymentDto> mypage_list(PagingDto dto, String member_id) {
		List<PaymentDto> list = dao.paymentList(dto);
		List<PaymentDto> pList = new ArrayList<>();
		
		for(PaymentDto p : list) {
			if(p.getMember_id().equals(member_id)) {
				pList.add(p);
			}
		}
		return pList;
				
	}
	public int paymentCount() {
		return dao.paymentCount();
	}

	@Override
	public int paymentMYCount(String member_id) {
		return dao.paymentMYCount(member_id);
	}

}
