package com.project.one.model.dto;

import java.util.Date;

public class ChatDto {
	private int chat_no;
	private String member_id;
	private String consult_id;
	private String chat_content;
	private Date chat_date;
	
	public ChatDto() {
	}

	public ChatDto(int chat_no, String member_id, String consult_id, String chat_content, Date chat_date) {
		super();
		this.chat_no = chat_no;
		this.member_id = member_id;
		this.consult_id = consult_id;
		this.chat_content = chat_content;
		this.chat_date = chat_date;
	}

	public int getChat_no() {
		return chat_no;
	}

	public void setChat_no(int chat_no) {
		this.chat_no = chat_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getConsult_id() {
		return consult_id;
	}

	public void setConsult_id(String consult_id) {
		this.consult_id = consult_id;
	}

	public String getChat_content() {
		return chat_content;
	}

	public void setChat_content(String chat_content) {
		this.chat_content = chat_content;
	}

	public Date getChat_date() {
		return chat_date;
	}

	public void setChat_date(Date chat_date) {
		this.chat_date = chat_date;
	}
}
