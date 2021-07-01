package com.project.one.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.one.model.biz.ProductBiz;
import com.project.one.model.dto.ProductDto;

@Controller
public class ProductController {
	private Logger logger = LoggerFactory.getLogger(ProductController.class);

	@Autowired
	private ProductBiz biz;

	@RequestMapping("/store.do")
	public String Product_list(Model model) {
		model.addAttribute("list", biz.selectList());

		return "store";

	}

	@RequestMapping("/store_select.do")
	public String Product_selectOne(Model model, int product_no) {
		model.addAttribute("dto", biz.selectOne(product_no));

		return "store_select";
	}
	
	@RequestMapping("/store_insertform.do")
	public String Product_insertForm() {

		return "store_insertform";
	}

	@RequestMapping("/store_insertres.do")
	public String Product_insertRes(ProductDto dto) {
		
		if(biz.insert(dto)>0) {
			return "redirect:store.do";
		}
		
		return "redirect:store_insertform.do";
	}
	
	@RequestMapping("/store_updateform.do")
	public String Product_updateForm(Model model,int product_no) {
		model.addAttribute("dto",biz.selectOne(product_no));

		return "store_updateform";
	}
	
	@RequestMapping("/store_updateres.do")
	public String Product_updateRes(ProductDto dto) {
		
		if(biz.update(dto)>0) {
			return "redirect:store_select.do?product_no="+dto.getProduct_no();
		}
		
		return "redirect:store_updateform.do?product_no="+dto.getProduct_no();
	}
	
	@RequestMapping("/store_delete.do")
	public String Product_delete(int product_no) {
		
		if(biz.delete(product_no)>0) {
			return "redirect:store.do";
		}

		return "redirect:store_select.do?product_no="+product_no;
	}
}
