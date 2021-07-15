package com.project.one.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.one.model.biz.PaymentBiz;
import com.project.one.model.dto.MemberDto;
import com.project.one.model.dto.PagingDto;
import com.project.one.model.dto.PaymentDto;

@Controller
public class PaymentController {

	private static String TYPE="";
	
	@Autowired
	private PaymentBiz pBiz;
	
	@RequestMapping("/payment.do")
	public String payment(Model model, PaymentDto pDto,String type, HttpSession session) {
		TYPE = type;
		
		MemberDto mDto = (MemberDto)session.getAttribute("mDto");
		
		model.addAttribute("mDto", mDto);
		model.addAttribute("pDto", pDto);
			
		return "payment";
	}

	@ResponseBody
	@RequestMapping("/paymentComplete.do")
	public Map<String, String> payment_complete(@RequestBody PaymentDto dto) {
		Map<String, String> map = new HashMap<>();

		if(pBiz.insert(dto, TYPE) > 0) {
			map.put("msg", "성공");
			
			if(TYPE.equals("basket")) {
				map.put("basket", "basket");
			}
		} else {
			map.put("msg", "실패");
		}
		
		return map;
	}

	@RequestMapping("paymentCancel.do")
	public String payment_cancel(PaymentDto dto) {
		PaymentDto pDto = pBiz.checkPaid(dto);

		if (pDto != null && pBiz.delete(pDto) > 0) {
			return "redirect:mypage_update.do";
		}

		return "redirect:mypage_payment.do?nowPage=1";
	}
	
	@RequestMapping("mypage_payment.do")
	public String mypage_list(Model model, int nowPage, HttpSession session) {		
		MemberDto mDto = (MemberDto)session.getAttribute("mDto");		
		
		int count = pBiz.paymentMYCount(mDto.getMember_id());
		PagingDto pDto = new PagingDto(count, nowPage);
		
		model.addAttribute("pList", pBiz.mypage_list(pDto, mDto.getMember_id()));
		model.addAttribute("pDto", pDto);
		
		return "mypage/mypage_payment";
	}

}
