package com.project.one.model.biz;

import java.util.List;

import com.project.one.model.dto.PaymentDto;

public interface PaymentBiz {

	public List<PaymentDto> selectList();

	public PaymentDto selectOne(int payment_no);

	public int insert(PaymentDto dto);

	public int update(PaymentDto dto);

	public int delete(int payment_no);
}