package com.project.one.model.dto;

import java.util.Date;

public class EventDto {
	private int event_no;
	private String event_title;
	private String event_desc;
	private Date event_start;
	private Date event_end;
	private boolean event_noti;
	private String member_id;
	private int class_no;
	private int product_no;
	
	public EventDto() {
	}

	public EventDto(int event_no, String event_title, String event_desc, Date event_start, Date event_end,
			boolean event_noti, String member_id, int class_no, int product_no) {
		super();
		this.event_no = event_no;
		this.event_title = event_title;
		this.event_desc = event_desc;
		this.event_start = event_start;
		this.event_end = event_end;
		this.event_noti = event_noti;
		this.member_id = member_id;
		this.class_no = class_no;
		this.product_no = product_no;
	}

	public int getEvent_no() {
		return event_no;
	}

	public void setEvent_no(int event_no) {
		this.event_no = event_no;
	}

	public String getEvent_title() {
		return event_title;
	}

	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}

	public String getEvent_desc() {
		return event_desc;
	}

	public void setEvent_desc(String event_desc) {
		this.event_desc = event_desc;
	}

	public Date getEvent_start() {
		return event_start;
	}

	public void setEvent_start(Date event_start) {
		this.event_start = event_start;
	}

	public Date getEvent_end() {
		return event_end;
	}

	public void setEvent_end(Date event_end) {
		this.event_end = event_end;
	}

	public boolean isEvent_noti() {
		return event_noti;
	}

	public void setEvent_noti(boolean event_noti) {
		this.event_noti = event_noti;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getClass_no() {
		return class_no;
	}

	public void setClass_no(int class_no) {
		this.class_no = class_no;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
}
