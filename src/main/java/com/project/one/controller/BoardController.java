package com.project.one.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.one.model.biz.BoardBiz;

@Controller
public class BoardController {

	private Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardBiz biz;
	
	@RequestMapping("/board_notice.do")
	public String board_notice_list(Model model, String board_category) {
		model.addAttribute("list", biz.selectList(board_category));
		return "board_notice";
	}
	@RequestMapping("/board_qna.do")
	public String board_qna_list(Model model, String board_category) {
		model.addAttribute("board_category",board_category);
		return "board_qna";
	}
	@RequestMapping("/board_insertform")
	public String board_insertForm(Model model, String board_category) {
		model.addAttribute("board_category",board_category);
		return "board_insertform";
	}
}
