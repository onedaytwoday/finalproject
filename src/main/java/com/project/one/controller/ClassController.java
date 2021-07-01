package com.project.one.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.one.model.biz.ClassBiz;
import com.project.one.model.biz.PaymentBiz;
import com.project.one.model.dto.ClassDto;
import com.project.one.model.dto.MemberDto;
import com.project.one.model.dto.PaymentDto;

@Controller
public class ClassController {
	
	@Autowired
	private ClassBiz cBiz;
	
	@Autowired
	private PaymentBiz pBiz;
	
	@RequestMapping("/classList.do")
	public String class_list(Model model) {
		model.addAttribute("list", cBiz.selectList());
		
		return "class_list";
	}
	
	@RequestMapping("/classDetail.do")
	public String class_detail(Model model, int class_no, HttpSession session) {
		
		MemberDto mDto = (MemberDto) session.getAttribute("mDto");
		if(mDto != null) {
			PaymentDto pDto = new PaymentDto();
			pDto.setMember_id(mDto.getMember_id());
			pDto.setClass_no(class_no);
			
			PaymentDto paid = pBiz.checkPaid(pDto);
			boolean checkPaid = false;
			
			if(paid != null) {
				checkPaid = true;
			}
			
			model.addAttribute("checkPaid", checkPaid);
		}
		
		
		model.addAttribute("dto", cBiz.selectOne(class_no));
		
				
		return "class_detail";
	}
	
	@RequestMapping("/classInsert.do")
	public String class_insertForm() {
		return "class_insertform";
	}
	
	@RequestMapping("/classInsertRes.do")
	public String class_insert_res(ClassDto dto) {		
		if(cBiz.insert(dto) > 0) {
			return "redirect:classList.do";
		}
		
		return "redirect:classInsert.do";
	}
	
	@RequestMapping("/classUpdate.do")
	public String class_updateForm(Model model, int class_no) {
		model.addAttribute("dto", cBiz.selectOne(class_no));
		
		return "class_updateform";
	}
	
	@RequestMapping("/classUpdateRes.do")
	public String class_update_res(ClassDto dto) {
		if(cBiz.update(dto) > 0) {
			return "redirect:classDetail.do?class_no="+dto.getClass_no();
		}
		
		return "redirect:classUpdate.do?class_no="+dto.getClass_no();
	}
	
	@RequestMapping("/classDelete.do")
	public String class_delete(int class_no) {
		
		if(cBiz.delete(class_no) > 0) {
			return "redirect:classList.do";
		}
		
		return "redirect:classList.do";
	}
}
