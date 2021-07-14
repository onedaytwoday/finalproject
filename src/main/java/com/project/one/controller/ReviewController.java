package com.project.one.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.one.model.biz.ReviewBiz;
import com.project.one.model.dto.ClassDto;
import com.project.one.model.dto.MemberDto;
import com.project.one.model.dto.ReviewDto;

@Controller
public class ReviewController {

	@Autowired
	private ReviewBiz rBiz;
	
	//클래스리뷰 리스트
	@RequestMapping("/reviewlist.do")
	public String reviewList(Model model) {
		
		model.addAttribute("list", rBiz.selectClass());
		
		return "review_list_class";
	}
	
	//클래스리뷰 디테일
	@RequestMapping("/reviewDetail.do")
	public String reviewDetail(Model model,int review_no) {
		
		model.addAttribute("dto", rBiz.selectOne(review_no));
		return "review_detail_class";
	}
	
	//인서트폼(class_no, member_id)
	@RequestMapping("/insertClassReview.do")
	public String insertClassReview(Model model, int class_no,String class_title, HttpSession session) {
		
		MemberDto mDto = (MemberDto)session.getAttribute("mDto");
		if(mDto != null) {
			ClassDto cDto = new ClassDto();
			cDto.setClass_no(class_no);
			cDto.setClass_title(class_title);
			model.addAttribute("cDto", cDto);
			model.addAttribute("mDto", mDto);
			System.out.println(class_no);
		}
		
		return "review_insert_class";
	}
	
	//인서트 결과(클래스리뷰)
	@RequestMapping("/review_insertres.do")
	public String reviewInsertRes(ReviewDto rDto, String class_no_str) {
		System.out.println(rDto);
		int class_no = Integer.parseInt(class_no_str);
		rDto.setClass_no(class_no);
		if(rBiz.insert(rDto)>0) {
			return "redirect:reviewlist.do";
		}
		return "redirect:insertClassReview.do";
	}
	
	@RequestMapping("/reviewDelete.do")
	public String reviewDelete(int review_no) {
		if(rBiz.delete(review_no)>0) {
			return "redirect:reviewlist.do";
		}
		return "redirect:reviewlist.do";
	}
}
