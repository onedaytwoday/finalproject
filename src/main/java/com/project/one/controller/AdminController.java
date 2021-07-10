package com.project.one.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.one.model.biz.BoardBiz;
import com.project.one.model.biz.ClassBiz;
import com.project.one.model.biz.MemberBiz;
import com.project.one.model.biz.PaymentBiz;
import com.project.one.model.biz.ProductBiz;
import com.project.one.model.dto.BoardDto;
import com.project.one.model.dto.ClassDto;
import com.project.one.model.dto.MemberDto;
import com.project.one.model.dto.PaymentDto;
import com.project.one.model.dto.ProductDto;

@Controller
public class AdminController {
	
	@Autowired
	private MemberBiz mBiz;
	
	@Autowired
	private ProductBiz proBiz;
	
	@Autowired
	private ClassBiz cBiz;
	
	@Autowired
	private BoardBiz bBiz;
	
	@Autowired
	private PaymentBiz pBiz;

	@RequestMapping("/adminMain.do")
	public String admin_main() {
		return "adminMain";
	}
	
	@RequestMapping("/adminMember.do")
	public String admin_member(Model model) {
		List<MemberDto> mList = mBiz.selectList();
		model.addAttribute("mList", mList);
		
		return "adminMember";
	}
	
	@RequestMapping("/adminProClass.do")
	public String admin_product_Class(Model model) {
		List<ProductDto> proList = proBiz.selectList();
		List<ClassDto> cList = cBiz.selectList();
		
		model.addAttribute("proList", proList);
		model.addAttribute("cList", cList);
		
		return "adminProClass";
	}
	
	@RequestMapping("/adminBoard.do")
	public String admin_board(Model model) {
		
		return "adminBoard";
	}
	
	@RequestMapping("/adminPayment.do")
	public String admin_payment(Model model) {
		List<PaymentDto> pList = pBiz.selectList();
		model.addAttribute("pList", pList);
		
		return "adminPayment";
	}
	
	@ResponseBody
	@RequestMapping(value="/updateStatus.do", method=RequestMethod.POST)
	public Map<String, String> update_status(@RequestBody PaymentDto dto) {
		Map<String, String> map = new HashMap<>();
		
		System.out.println("status : " + dto.getPayment_del());
		
		if(pBiz.updateStatus(dto) > 0) {
			PaymentDto pDto = pBiz.selectOne(dto.getPayment_no());
			map.put("msg", "성공");
			map.put("status", pDto.getPayment_del());
			
		} else {
			map.put("msg", "실패");
		}
		
		return map;
	}
}
