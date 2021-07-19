package com.project.one.model.dto;

public class ChatreadDto {

	private int room_no;
	private int cnt;
	
	public ChatreadDto() {
	}

	public ChatreadDto(int room_no, int cnt) {
		super();
		this.room_no = room_no;
		this.cnt = cnt;
	}

	public int getRoom_no() {
		return room_no;
	}

	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
}
