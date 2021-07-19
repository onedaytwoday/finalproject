package com.project.one.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.one.model.biz.ClassBiz;
import com.project.one.model.biz.ProductBiz;
import com.project.one.model.biz.ReviewBiz;
import com.project.one.model.dto.ClassDto;
import com.project.one.model.dto.ProductDto;
import com.project.one.model.dto.SearchDto;

@Controller
public class SearchController {

	@Autowired
	private ReviewBiz biz;
	
	@Autowired
	private ClassBiz cbiz;
	
	@Autowired
	private ProductBiz pbiz;
	
	@RequestMapping("/real.do")
	public String real(Model model) {
		List<SearchDto> list = biz.search();
		String[] res = new String[list.size()];
		for(int i=0;i<list.size();i++) {
			if(list.get(i).getProduct_no() == 0) {
				  ClassDto dto = cbiz.selectOne(list.get(i).getClass_no());
				  res[i] = dto.getClass_title();
			}else {
				ProductDto dto = pbiz.selectOne(list.get(i).getProduct_no());
				res[i] = dto.getProduct_name();
			}
		}
		for(int i=0;i<res.length;i++) {
			System.out.println(res[i]);
		}
		return "real";
	}
}
