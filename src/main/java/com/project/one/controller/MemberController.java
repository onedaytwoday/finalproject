package com.project.one.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
		if(biz.insert(dto)) {
			return "redirect:login.do";
		}
		return "redirect:signup.do";
	}
	
}
