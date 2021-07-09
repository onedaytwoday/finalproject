package com.project.one.model.dto;


import java.util.Date;

import com.google.gson.Gson;

public class RoomDto {
	private int room_no;
	private String member_id;
	private String consult_id;
	private String room_content;
	private Date room_date;
	
	public RoomDto() {
	}
	
	public RoomDto(int room_no, String member_id, String consult_id, String room_content, Date room_date) {
		super();
		this.room_no = room_no;
		this.member_id = member_id;
		this.consult_id = consult_id;
		this.room_content = room_content;
		this.room_date = room_date;
	}

	public int getRoom_no() {
		return room_no;
	}


	public void setRoom_no(int room_no) {
		this.room_no = room_no;
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


	public String getRoom_content() {
		return room_content;
	}


	public void setRoom_content(String room_content) {
		this.room_content = room_content;
	}


	public Date getRoom_date() {
		return room_date;
	}


	public void setRoom_date(Date room_date) {
		this.room_date = room_date;
	}

	public static RoomDto convertMessage(String source) {
		RoomDto message = new RoomDto();
		Gson gson = new Gson();
		message = gson.fromJson(source,  RoomDto.class);
		return message;
	}
	
}
