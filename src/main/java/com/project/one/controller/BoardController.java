package com.project.one.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.one.model.biz.BoardBiz;
import com.project.one.model.dto.BoardDto;
import com.project.one.model.dto.PagingDto;

@Controller
public class BoardController {

	private Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardBiz biz;
	
	@RequestMapping("/board_notice_list.do")
	public String board_notice_list(Model model, int nowPage) {
		
		int count = biz.notice_count();
		PagingDto Pdto = new PagingDto(count, nowPage);
		model.addAttribute("list", biz.board_notice_list(Pdto));
		model.addAttribute("Pdto", Pdto);
		return "board_notice";
	}
	@RequestMapping("/board_qna_list.do")
	public String board_qna_list(Model model, int nowPage) {
		int count = biz.qna_count();
		PagingDto Pdto = new PagingDto(count, nowPage);
		model.addAttribute("list", biz.board_qna_list(Pdto));
		model.addAttribute("Pdto", Pdto);
		return "board_qna";
	}
	
	@RequestMapping("/board_insertform.do")
	public String board_insertForm(Model model, String board_category) {
		model.addAttribute("board_category",board_category);
		return "board_insertform";
	}
	
	@RequestMapping("/board_insertRes.do")
	public String board_insertRes(BoardDto dto) {
		if(dto.getBoard_category().equals("N")) {
			if(biz.notice_insert(dto)>0) {
				return "redirect:board_notice_list.do?nowPage=1";
			}else {
				return "redirect:board_insertform.do?board_category="+dto.getBoard_category();
			}
		}else {
			if(biz.qna_insert(dto)>0) {
				return "redirect:board_qna_list.do?nowPage=1";
			}else {
				return "redirect:board_insertform.do?board_category="+dto.getBoard_category();
			}
		}
	}
	
	@RequestMapping("/board_detail.do")
	public String board_detail(Model model, int board_no) {
		model.addAttribute("dto", biz.selectOne(board_no));
		return "board_detail";
	}
	
	@RequestMapping("/board_updateform.do")
	public String board_updateForm(Model model, int board_no) {
		model.addAttribute("dto", biz.selectOne(board_no));
		return "board_updateform";
	}
	
	@RequestMapping("/board_updateRes.do")
	public String board_updateRes(BoardDto dto) {
		if(biz.update(dto) > 0) {
			return "redirect:board_detail.do?board_no="+dto.getBoard_no();
		}
		return "redirect:board_updateform.do?board_no="+dto.getBoard_no();
	}
	
	@RequestMapping("/board_delete.do")
	public String board_delete(int board_no, String board_category) {
		String category = board_category;
		biz.delete(board_no);
			if(category.equals("N")) {
				return "redirect:board_notice_list.do?nowPage=1";
			}
			return "redirect:board_qna_list.do?nowPage=1";
	}
	
	//마이페이지
	@RequestMapping("mypage_board.do")
	public String mypage_list(Model model,String member_id) {
		model.addAttribute("list",biz.mypage_list(member_id));
		model.addAttribute("member_id",member_id);
		
		return "mypage_board";
	}
}
