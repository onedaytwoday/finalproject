package com.project.one.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.one.model.biz.BasketBiz;
import com.project.one.model.biz.ProductBiz;
import com.project.one.model.dto.BasketDto;
import com.project.one.model.dto.MemberDto;
import com.project.one.model.dto.ProductDto;

@Controller
public class BasketController {
	
	private static MemberDto mDto;
	
	@Autowired
	private BasketBiz bBiz;
	
	@Autowired
	private ProductBiz pBiz;
	
	@RequestMapping("/basket.do")
	public String basket(Model model, HttpSession session) {
		mDto = (MemberDto) session.getAttribute("mDto");
		List<BasketDto> bList = bBiz.selectList(mDto.getMember_id());
		List<ProductDto> pList = new ArrayList<>();
		int basket_group = 0;
		
		for(BasketDto bDto : bList) {
			basket_group = bDto.getBasket_group();
			
			ProductDto pDto = pBiz.selectOne(bDto.getProduct_no());
			pList.add(pDto);
		}
		
		model.addAttribute("basket_group", basket_group);
		model.addAttribute("bList", bList);
		model.addAttribute("pList", pList);
		
		return "basket";
	}
	
	@ResponseBody
	@RequestMapping(value="/addToBasket.do", method = RequestMethod.POST)
	public Map<String, String> addToBasket(@RequestBody ProductDto pDto, HttpSession session) {
		mDto = (MemberDto) session.getAttribute("mDto");
		int group_no = Integer.parseInt(mDto.getMember_phone().replace("-", ""));
		
		Map<String, String> map = new HashMap<String, String>();
		
		BasketDto bDto = new BasketDto();
		bDto.setProduct_no(pDto.getProduct_no());
		bDto.setMember_id(mDto.getMember_id());
		
		BasketDto inBDto = bBiz.selectOne(bDto);
		
		// 이미 장바구니에 있는 상품일 경우
		if(inBDto != null) {
			bDto = new BasketDto(inBDto.getBasket_no(), (inBDto.getBasket_num() + 1), (inBDto.getBasket_price() + pDto.getProduct_price()), group_no, pDto.getProduct_no(), mDto.getMember_id());
			
			if(bBiz.update(bDto) > 0) {
				map.put("result", "성공");
			} else {
				map.put("result", "실패");
			}
			
		} else {
			// 장바구니에 없는 상품일 경우			
			bDto = new BasketDto(0, 1, pDto.getProduct_price(), group_no, pDto.getProduct_no(), mDto.getMember_id());
			
			if(bBiz.insert(bDto) > 0) {
				map.put("result", "성공");		
			} else {
				map.put("result", "실패");
			}
		}
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/updateBasket.do", method=RequestMethod.POST)
	public Map<String, String> updateBasket(@RequestBody BasketDto dto, HttpSession session) {
		mDto = (MemberDto) session.getAttribute("mDto");
		dto.setMember_id(mDto.getMember_id());

		Map<String, String> map = new HashMap<String, String>();
		
		if(bBiz.update(dto) > 0) {
			map.put("result", "성공");
		} else {
			map.put("result", "실패");
		}
		
		return map;
	}
	
	@RequestMapping("/deleteBasket.do")
	public String deleteBasket(BasketDto dto, HttpSession session) {
		mDto = (MemberDto) session.getAttribute("mDto");
		dto.setMember_id(mDto.getMember_id());
		
		bBiz.delete(dto);
		
		return "redirect:basket.do";
	}
	
	@RequestMapping("/deleteAll.do")
	public String deleteAll(HttpSession session) {
		mDto = (MemberDto) session.getAttribute("mDto");
		bBiz.deleteAll(mDto.getMember_id());
		
		return "redirect:main.do";
	}
	
	@ResponseBody
	@RequestMapping("/getTotalBasket.do")
	public Map<String, Integer> getTotalBasket(HttpSession session) {
		int total_num = 0;
		int total_price = 0;
		mDto = (MemberDto) session.getAttribute("mDto");
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		List<BasketDto> bList = bBiz.selectList(mDto.getMember_id());
		for(BasketDto bDto : bList) {
			total_num += bDto.getBasket_num();
			total_price += bDto.getBasket_price();
		}
		
		map.put("total_num", total_num);
		map.put("total_price", total_price);
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/getBasketNum.do")
	public Map<String, String> get_basket_num(HttpSession session){
		Map<String, String> map = new HashMap<String, String>();
		
		MemberDto mDto = (MemberDto)session.getAttribute("mDto");
		
		if(mDto != null) {
			List<BasketDto> bList = bBiz.selectList(mDto.getMember_id());
			
			if(bList != null) {
				map.put("basket_num", String.valueOf(bList.size()));
			} else {
				map.put("basket_num", "0");
			}
		}
		
		return map;
	}
	
}
