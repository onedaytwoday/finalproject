package com.project.one.controller;

import java.util.HashMap;
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
import com.project.one.model.dto.MemberDto;
import com.project.one.model.dto.PagingDto;
import com.project.one.model.dto.PaymentDto;

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
	public String admin_main(Model model) {
		model.addAttribute("mCount", mBiz.memberCount());
		model.addAttribute("proCount", proBiz.productCount());
		model.addAttribute("cCount", cBiz.classCount());
		
		return "admin_main";
	}

	@RequestMapping("/adminMember.do")
	public String admin_member(Model model, int nowPage) {
		int count = mBiz.memberCount();
		PagingDto pDto = new PagingDto(count, nowPage);
		model.addAttribute("mList", mBiz.memberList(pDto));
		model.addAttribute("pDto", pDto);
		
		return "admin_member";
	}

	@RequestMapping("/adminProduct.do")
	public String admin_product(Model model, int nowPage) {
		int count = proBiz.productCount();
		PagingDto pDto = new PagingDto(count, nowPage);
		model.addAttribute("proList", proBiz.productList(pDto));
		model.addAttribute("pDto", pDto);

		return "admin_product";
	}
	
	@RequestMapping("/adminClass.do")
	public String admin_class(Model model, int nowPage) {
		int count = cBiz.classCount();
		PagingDto pDto = new PagingDto(count, nowPage);
		model.addAttribute("cList", cBiz.classList(pDto));
		model.addAttribute("pDto", pDto);

		return "admin_class";
	}

	@RequestMapping("/adminBoard.do")
	public String admin_board(Model model, int nowPage) {
		int count = bBiz.qna_count();
		PagingDto pDto = new PagingDto(count, nowPage);
		model.addAttribute("qnaList", bBiz.board_qna_list(pDto));
		model.addAttribute("pDto", pDto);
		
		return "admin_board";
	}

	@RequestMapping("/adminPayment.do")
	public String admin_payment(Model model, int nowPage) {
		int count = pBiz.paymentCount();
		PagingDto pDto = new PagingDto(count, nowPage);
		model.addAttribute("pList", pBiz.paymentList(pDto));
		model.addAttribute("pDto", pDto);

		return "admin_payment";
	}

	@ResponseBody
	@RequestMapping(value = "/manageMember.do", method = RequestMethod.POST)
	public Map<String, String> manage_member(@RequestBody MemberDto dto) {
		Map<String, String> map = new HashMap<>();

		if (mBiz.manageMember(dto) > 0) {
			dto = mBiz.selectOne(dto.getMember_id());
			map.put("msg", dto.getMember_join().equals("N") ? "계정 풀기" : "계정 잠그기");
		} else {
			map.put("msg", "실패");
		}

		return map;
	}

	@ResponseBody
	@RequestMapping(value = "/deleteChecked.do", method = RequestMethod.POST)
	public Map<String, String> delete_checked(@RequestBody Map<String, String[]> checked_list) {
		Map<String, String> map = new HashMap<>();
		int res = 0;
		
		String[] types = checked_list.get("type");
		String type = "";
		
		String[] checked = checked_list.get("checked_list");
		
		for(String s : types) {
			type = s;
		}

		
		switch(type) {
		case "product":
			for(String i : checked) {
				res += proBiz.delete(Integer.parseInt(i));
			}
			break;
			
		case "class":
			for(String i : checked) {
				res += cBiz.delete(Integer.parseInt(i));
			}
			break;
			
		case "qna":
			for(String i : checked) {
				res += bBiz.delete(Integer.parseInt(i));
			}
			break;
		}

		map.put("msg", res > 0 ? "성공" : "실패");

		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/updateStatus.do", method = RequestMethod.POST)
	public Map<String, String> update_status(@RequestBody PaymentDto dto) {
		Map<String, String> map = new HashMap<>();

		dto = pBiz.selectOne(dto.getPayment_no());

		if (pBiz.updateStatus(dto) > 0) {
			PaymentDto pDto = pBiz.selectOne(dto.getPayment_no());
			map.put("msg", "성공");
			map.put("status", pDto.getPayment_del());

		} else {
			map.put("msg", "실패");
		}

		return map;
	}
}
