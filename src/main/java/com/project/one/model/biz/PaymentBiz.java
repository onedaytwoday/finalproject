package com.project.one.model.biz;

import java.util.List;

import com.project.one.model.dto.PaymentDto;

public interface PaymentBiz {

	public List<PaymentDto> selectList();

	public PaymentDto selectOne(int payment_no);

	public int insert(PaymentDto dto, String type, String title, int basket_group);

	public int update(PaymentDto dto);

	public int delete(PaymentDto dto);
	
	public PaymentDto checkPaid(PaymentDto dto);
}
