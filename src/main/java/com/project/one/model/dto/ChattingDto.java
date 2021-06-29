package com.project.one.model.dto;

import java.util.Date;

public class ChattingDto {
	private int chatting_no;
	private String chatting_content;
	private Date chatting_date;
	private int chat_no;
	
	public ChattingDto() {
	}

	public ChattingDto(int chatting_no, String chatting_content, Date chatting_date, int chat_no) {
		super();
		this.chatting_no = chatting_no;
		this.chatting_content = chatting_content;
		this.chatting_date = chatting_date;
		this.chat_no = chat_no;
	}

	public int getChatting_no() {
		return chatting_no;
	}

	public void setChatting_no(int chatting_no) {
		this.chatting_no = chatting_no;
	}

	public String getChatting_content() {
		return chatting_content;
	}

	public void setChatting_content(String chatting_content) {
		this.chatting_content = chatting_content;
	}

	public Date getChatting_date() {
		return chatting_date;
	}

	public void setChatting_date(Date chatting_date) {
		this.chatting_date = chatting_date;
	}

	public int getChat_no() {
		return chat_no;
	}

	public void setChat_no(int chat_no) {
		this.chat_no = chat_no;
	}
	
}
