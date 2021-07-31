package com.project.one.controller;
<<<<<<< HEAD
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
//import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import org.json.JSONArray;
import org.json.JSONObject;

//import javax.servlet.http.HttpSession;

=======
>>>>>>> 8aed2efd405f2a335ea2287fa6c5081c61e8a5a9
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.one.model.biz.ClassBiz;
import com.project.one.model.dto.ClassDto;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;

import com.project.one.model.biz.ClassBiz;
import com.project.one.model.dto.PagingDto;


@Controller
public class KakaoMap {
//	private static Logger logger = LoggerFactory.getLogger(KakaoMap.class);//테스트중...
	
	@Autowired
	private ClassBiz cBiz;
	private ClassDto cDto;

	private static int CLASS_NO;
	
	@Autowired
	private ClassBiz biz;
	
	//메인에서 지도 클릭시
	@RequestMapping("/map.do")
<<<<<<< HEAD
	public String map(Model model) {
//		logger.info("KakaoMap map" + new Date());
//		---------------------
		List<ClassDto> list = cBiz.selectList();
		model.addAttribute("list", list);

		return "map7";
	}
	
	
	//-----------------------------ajax---------------
	@RequestMapping(value = "get.do")
	@ResponseBody
	public String ajax(HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		List<ClassDto> list = cBiz.selectList();
		JSONObject obj = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		for(int i = 0; i<list.size(); i++) {
			
			
			obj.put("business_addr",list.get(i).getClass_loc());
		    obj.put("class_loc", list.get(i).getClass_title());
			
			jsonArray.put(obj);
		
		}
		out.print(jsonArray);
		out.flush();
		
		return null;
	}
//-----------------------------ajax	-----------------------------------
	
	
//	/* 2 controller -> controller */
//	@RequestMapping(value="move.do", method = RequestMethod.GET)
//	public String move() {
//		logger.info("KakaoMap move " + new Date());
//		
//		//sendRedirect(컨트롤러에서 컨트롤러로 보낸다)
////		return "redirect:/map.do"; 
//		return "forward:/hello.do"; //데이터를 가져갈때는 forward
//	}
//	
////	3번
////	Ajax 용 return값은 ajax에서 가져오는 데이터 (넘겨줘야할 데이터)
//	//Ajax사용시 @ResponseBody를 사용해야한다
//	@ResponseBody
//	@RequestMapping(value="idCheck.do", produces = "application/String; charset=utf-8")
//	//적어주기만 하면 무조건 session에 넘어간다 (의존성)
//	public String idCheck(String id, HttpSession session) {
//		logger.info("HelloController idCheck " + new Date());
//		logger.info("id:" + id);
//		
//		String str = "오케이";
//		return str;	
//	}
//	
=======
	public String map(Model model ,int nowPage) {
		int count = biz.classListCount();
		System.out.println(count);
		PagingDto pDto = new PagingDto(count, nowPage);
		
		model.addAttribute("list", biz.classListPaging(pDto));
		model.addAttribute("pDto", pDto);
		model.addAttribute("total",biz.totalList());
		return "map";
	}
>>>>>>> 8aed2efd405f2a335ea2287fa6c5081c61e8a5a9
}
