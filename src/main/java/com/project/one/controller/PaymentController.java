package com.project.one.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.one.model.biz.MemberBiz;
import com.project.one.model.biz.PaymentBiz;
import com.project.one.model.dto.ClassDto;
import com.project.one.model.dto.MemberDto;
import com.project.one.model.dto.PaymentDto;
import com.project.one.util.Payment;

@Controller
public class PaymentController {
	
	@Autowired
	private MemberBiz mBiz;
	
	@Autowired
	private PaymentBiz pBiz;
		
	private static ClassDto cDto;
	
	@RequestMapping("/payment.do")
    public String payment(Model model, ClassDto dto){
		MemberDto mDto = mBiz.selectOne(dto.getMember_id());
		cDto = dto;
		
		model.addAttribute("member", mDto);
		model.addAttribute("dto", dto);
		
        return "payment";
    }
	
	@RequestMapping("/paymentSuccess.do")
	public String payment_success() {
		PaymentDto pDto = new PaymentDto();
		pDto.setPayment_num(1);
		pDto.setPayment_price(cDto.getClass_price());
		pDto.setPayment_del("결제완료");
		pDto.setMember_id(cDto.getMember_id());
		pDto.setClass_no(cDto.getClass_no());
		
		if(pBiz.insert(pDto) > 0) {
			return "redirect:classList.do";
		}
		
		return "redirect:main.do";
	}
	
	@RequestMapping("/paymentCancel.do")
	public void payment_cancel() {
		Payment p = new Payment();
		p.post();
	}
	
}
