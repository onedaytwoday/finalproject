package com.project.one.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.one.model.biz.ClassBiz;
import com.project.one.model.biz.MemberBiz;
import com.project.one.model.biz.PaymentBiz;
import com.project.one.model.dto.ClassDto;
import com.project.one.model.dto.MemberDto;
import com.project.one.model.dto.PaymentDto;

@Controller
public class PaymentController {

	@Autowired
	private MemberBiz mBiz;

	@Autowired
	private PaymentBiz pBiz;

	@Autowired
	private ClassBiz cBiz;

	@RequestMapping("/payment.do")
	public String payment(Model model, ClassDto dto) {
		MemberDto mDto = mBiz.selectOne(dto.getMember_id());

		model.addAttribute("member", mDto);
		model.addAttribute("dto", dto);

		return "payment";
	}

	@RequestMapping("/paymentComplete.do")
	public String payment_complete(PaymentDto dto, String class_title) {
		ClassDto cDto = cBiz.selectOneByTitle(class_title);

		dto.setPayment_del("결제완료");
		dto.setClass_no(cDto.getClass_no());

		if(pBiz.insert(dto) > 0){
			return "redirect:main.do";
		}
		
		return "redirect:classDetail.do?class_no"+dto.getClass_no();
	}

	@RequestMapping("paymentCancel.do")
	public String payment_cancel(PaymentDto dto) {
		PaymentDto pDto = pBiz.checkPaid(dto);

		if (pBiz.delete(pDto) > 0) {
			return "redirect:classList.do";
		}

		return "redirect:classDetail.do?class_no="+dto.getClass_no();
	}

}
