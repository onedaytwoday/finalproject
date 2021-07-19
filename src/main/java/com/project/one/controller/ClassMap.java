package com.project.one.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.one.model.biz.ClassBiz;
import com.project.one.model.dto.ClassDto;
@Controller
public class ClassMap {
	
	@RequestMapping("/mapselect.do")
	public String map() {
		return "class_map";
	}
	
	/*@Autowired
	private ClassBiz cBiz;
	
	@RequestMapping(value = "/classInsertRes.do", method = RequestMethod.POST)
	public String ClassAddress(ClassDto dto, HttpServletRequest request) {
		String class_loc = dto.getClass_loc();
		
		
		return null;
	}
	*/

}
