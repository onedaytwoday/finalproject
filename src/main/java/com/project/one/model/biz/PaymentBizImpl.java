package com.project.one.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.one.model.dao.PaymentDao;
import com.project.one.model.dto.BasketDto;
import com.project.one.model.dto.ClassDto;
import com.project.one.model.dto.PaymentDto;
import com.project.one.model.dto.ProductDto;
import com.project.one.util.Payment;

@Service
public class PaymentBizImpl implements PaymentBiz {

	@Autowired
	private PaymentDao dao;
	
	@Autowired
	private ProductBiz proBiz;
	
	@Autowired
	private ClassBiz cBiz;
	
	@Autowired
	private BasketBiz bBiz;
	
	@Override
	public List<PaymentDto> selectList() {
		return dao.selectList();
	}
	
	@Override
	public PaymentDto selectOne(int payment_no) {
		return dao.selectOne(payment_no);
	}


	@Override
	public int insert(PaymentDto dto, String type, String title, int basket_group) {
		
		switch(type) {
		case "product" :
			ProductDto proDto = proBiz.selectOneByName(title);
			dto.setProduct_no(proDto.getProduct_no());
			dto.setPayment_num(1);
			break;
			
		case "class" :
			ClassDto cDto = cBiz.selectOneByTitle(title);
			dto.setClass_no(cDto.getClass_no());
			dto.setPayment_num(1);
			break;
			
		case "basket" :
			if(basket_group != 0) {
				dto.setBasket_group(basket_group);			
			}
			
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

}
