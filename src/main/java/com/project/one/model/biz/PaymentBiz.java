package com.project.one.model.biz;

import java.util.List;

import com.project.one.model.dto.PagingDto;
import com.project.one.model.dto.PaymentDto;

public interface PaymentBiz {

	public List<PaymentDto> selectList();
	
	public List<PaymentDto> paymentList(PagingDto pDto);
	
	public List<PaymentDto> montlyPayment();

	public PaymentDto selectOne(int payment_no);

	public int insert(PaymentDto dto, String type);

	public int updateStatus(PaymentDto dto);

	public int delete(PaymentDto dto);
	
	public PaymentDto checkPaid(PaymentDto dto);
	
	public List<PaymentDto> mypage_list(PagingDto dto, String member_id);
	
	public int paymentCount();
	
	public int paymentMYCount(String member_id);
}
