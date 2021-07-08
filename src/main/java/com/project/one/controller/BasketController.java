package com.project.one.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.one.model.biz.BasketBiz;
import com.project.one.model.dto.BasketDto;
import com.project.one.model.dto.MemberDto;
import com.project.one.model.dto.ProductDto;

@Controller
public class BasketController {
	
	private static MemberDto mDto;
	
	@Autowired
	private BasketBiz biz;
	
	@RequestMapping("/basket.do")
	public String cart() {
		
		return "basket";
	}
	
	@ResponseBody
	@RequestMapping(value="/addToBasket.do", method = RequestMethod.POST)
	public Map<String, String> addToBasket(@RequestBody ProductDto pDto, HttpSession session) {
		mDto = (MemberDto) session.getAttribute("mDto");
		Map<String, String> map = new HashMap<String, String>();
		
		BasketDto bDto = new BasketDto();
		bDto.setProduct_no(pDto.getProduct_no());
		bDto.setMember_id(mDto.getMember_id());
		
		BasketDto inBDto = biz.selectOne(bDto);
		
		// 이미 장바구니에 있는 상품일 경우
		if(inBDto != null) {
			bDto = new BasketDto(inBDto.getBasket_no(), (inBDto.getBasket_num() + 1), (inBDto.getBasket_price() + pDto.getProduct_price()), pDto.getProduct_no(), mDto.getMember_id());
			
			if(biz.update(bDto) > 0) {
				map.put("result", "성공");
			} else {
				map.put("result", "실패");
			}
			
		} else {
			// 장바구니에 없는 상품일 경우			
			bDto = new BasketDto(0, 1, pDto.getProduct_price(), pDto.getProduct_no(), mDto.getMember_id());
			
			if(biz.insert(bDto) > 0) {
				map.put("result", "성공");		
			} else {
				map.put("result", "실패");
			}
		}
		
		return map;
	}
	
}
