package com.project.one.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.one.model.biz.MemberBiz;
import com.project.one.model.dto.MemberDto;

@Controller
public class MemberController {

	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	private MemberBiz biz;
	
	@RequestMapping("/regist.do")
	public String registForm() {
		
		return "";
	}
	@RequestMapping("/signup.do")
	public String signUpres(MemberDto dto) {
		if(biz.register(dto) > 0) {
			return "redirect:login.do";
		}
		return "redirect:signup.do";
	}
	
}
