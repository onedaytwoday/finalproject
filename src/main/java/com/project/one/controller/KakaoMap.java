package com.project.one.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.one.model.biz.ClassBiz;
import com.project.one.model.dto.PagingDto;


@Controller
public class KakaoMap {
	
	@Autowired
	private ClassBiz biz;
	
	//메인에서 지도 클릭시
	@RequestMapping("/map.do")
	public String map(Model model ,int nowPage) {
		int count = biz.classListCount();
		System.out.println(count);
		PagingDto pDto = new PagingDto(count, nowPage);
		
		model.addAttribute("list", biz.classListPaging(pDto));
		model.addAttribute("pDto", pDto);
		model.addAttribute("total",biz.totalList());
		return "map";
	}
}
