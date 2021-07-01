package com.project.one.model.dto;

import java.util.Date;

public class BoardDto {
	private int board_no;
	private int board_notice_no;
	private int board_qna_no;
	private String board_title;
	private String board_content;
	private Date board_date;
	private int board_readcount;
	private int board_groupNo;
	private int board_groupSeq;
	private int board_titleTab;
	private String board_delFlag;
	private String board_category;
	private String board_pw;
	private String member_id;
	
	public BoardDto() {
	}

	public BoardDto(int board_no, int board_notice_no, int board_qna_no, String board_title, String board_content,
			Date board_date, int board_readcount, int board_groupNo, int board_groupSeq, int board_titleTab,
			String board_delFlag, String board_category, String board_pw, String member_id) {
		super();
		this.board_no = board_no;
		this.board_notice_no = board_notice_no;
		this.board_qna_no = board_qna_no;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_date = board_date;
		this.board_readcount = board_readcount;
		this.board_groupNo = board_groupNo;
		this.board_groupSeq = board_groupSeq;
		this.board_titleTab = board_titleTab;
		this.board_delFlag = board_delFlag;
		this.board_category = board_category;
		this.board_pw = board_pw;
		this.member_id = member_id;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public int getBoard_notice_no() {
		return board_notice_no;
	}

	public void setBoard_notice_no(int board_notice_no) {
		this.board_notice_no = board_notice_no;
	}

	public int getBoard_qna_no() {
		return board_qna_no;
	}

	public void setBoard_qna_no(int board_qna_no) {
		this.board_qna_no = board_qna_no;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public Date getBoard_date() {
		return board_date;
	}

	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}

	public int getBoard_readcount() {
		return board_readcount;
	}

	public void setBoard_readCount(int board_readcount) {
		this.board_readcount = board_readcount;
	}

	public int getBoard_groupNo() {
		return board_groupNo;
	}

	public void setBoard_groupNo(int board_groupNo) {
		this.board_groupNo = board_groupNo;
	}

	public int getBoard_groupSeq() {
		return board_groupSeq;
	}

	public void setBoard_groupSeq(int board_groupSeq) {
		this.board_groupSeq = board_groupSeq;
	}

	public int getBoard_titleTab() {
		return board_titleTab;
	}

	public void setBoard_titleTab(int board_titleTab) {
		this.board_titleTab = board_titleTab;
	}

	public String getBoard_delFlag() {
		return board_delFlag;
	}

	public void setBoard_delFlag(String board_delFlag) {
		this.board_delFlag = board_delFlag;
	}

	public String getBoard_category() {
		return board_category;
	}

	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}

	public String getBoard_pw() {
		return board_pw;
	}

	public void setBoard_pw(String board_pw) {
		this.board_pw = board_pw;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

}
