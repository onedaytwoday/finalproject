package com.project.one.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.one.model.biz.ClassBiz;
import com.project.one.model.biz.EventBiz;
import com.project.one.model.biz.ProductBiz;
import com.project.one.model.dto.EventDto;

@Controller
public class EventController {

	@Autowired
	private ClassBiz cBiz;

	@Autowired
	private ProductBiz pBiz;

	@Autowired
	private EventBiz eBiz;

	@RequestMapping("/eventInsert.do")
	public String event_form(Model model) {
		model.addAttribute("cList", cBiz.selectList());
		model.addAttribute("pList", pBiz.selectList());

		return "event_insertform";
	}

	@RequestMapping("/eventInsertRes.do")
	public String event_insert_res(EventDto dto, String start, String end, String sale_rate)
			throws ParseException {
		int res = 0;
		dto.setEvent_noti("N");

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

		Date start_date = format.parse(start);
		Date end_date = format.parse(end);

		dto.setEvent_start(start_date);
		dto.setEvent_end(end_date);
		
		if(dto.getClass_no() == 0 && dto.getProduct_no() >= 0) {
			res = eBiz.insertEventProduct(dto);
		} else if(dto.getClass_no() >= 0 && dto.getProduct_no() == 0) {
			res = eBiz.insertEventClass(dto);
		}

		return res > 0 ? "redirect:main.do" : "redirect:eventInsert.do";
	}
}
