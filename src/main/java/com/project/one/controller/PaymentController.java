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

import com.project.one.model.biz.BasketBiz;
import com.project.one.model.biz.ClassBiz;
import com.project.one.model.biz.MemberBiz;
import com.project.one.model.biz.PaymentBiz;
import com.project.one.model.biz.ProductBiz;
import com.project.one.model.dto.ClassDto;
import com.project.one.model.dto.MemberDto;
import com.project.one.model.dto.PaymentDto;
import com.project.one.model.dto.ProductDto;

@Controller
public class PaymentController {

	private static String TYPE="";
	private static String TITLE="";
	
	@Autowired
	private PaymentBiz pBiz;
	
	@RequestMapping("/payment.do")
	public String payment(Model model, PaymentDto pDto, String name, String type, HttpSession session) {
		TYPE = type;
		TITLE = name;
		
		MemberDto mDto = (MemberDto)session.getAttribute("mDto");
		
		model.addAttribute("mDto", mDto);
		model.addAttribute("pDto", pDto);
		model.addAttribute("name", name);
	
		return "payment";
	}

	@ResponseBody
	@RequestMapping("/paymentComplete.do")
	public Map<String, String> payment_complete(@RequestBody PaymentDto dto) {
		Map<String, String> map = new HashMap<>();	

		
		if(pBiz.insert(dto, TYPE, TITLE) > 0) {
			map.put("msg", "성공");
		} else {
			map.put("msg", "실패");
		}
		
		return map;
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
