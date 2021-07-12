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
		return "admin_main";
	}

	@RequestMapping("/adminMember.do")
	public String admin_member(Model model) {
		model.addAttribute("mList", mBiz.selectList());

		return "admin_member";
	}

	@RequestMapping("/adminProClass.do")
	public String admin_product_Class(Model model) {
		model.addAttribute("proList", proBiz.selectList());
		model.addAttribute("cList", cBiz.selectList());

		return "admin_proclass";
	}

	@RequestMapping("/adminBoard.do")
	public String admin_board(Model model) {

		return "admin_board";
	}

	@RequestMapping("/adminPayment.do")
	public String admin_payment(Model model) {
		model.addAttribute("pList", pBiz.selectList());

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
	public Map<String, String> delete_checked(@RequestBody Map<String, Integer[]> lists) {
		Map<String, String> map = new HashMap<>();
		Integer[] class_list = lists.get("class_list");
		Integer[] product_list = lists.get("product_list");

		int res = 0;

		System.out.println(class_list.length);
		
		if (class_list.length == 0) {
			for (int i : product_list) {
				res += proBiz.delete(i);
			}
		} else if (product_list.length == 0) {
			for (int i : class_list) {
				res += cBiz.delete(i);
			}
		} else {
			for (int i : product_list) {
				res += proBiz.delete(i);
			}

			for (int i : class_list) {
				res += cBiz.delete(i);
			}
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
