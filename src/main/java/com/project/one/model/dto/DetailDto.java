package com.project.one.model.dto;

import java.util.Date;

public class DetailDto {
	private int detail_no;
	private Date detail_date;
	private int detail_member_num;
	private int class_no;
	
	public DetailDto() {
	}

	public DetailDto(int detail_no, Date detail_date, int detail_member_num, int class_no) {
		super();
		this.detail_no = detail_no;
		this.detail_date = detail_date;
		this.detail_member_num = detail_member_num;
		this.class_no = class_no;
	}

	public int getDetail_no() {
		return detail_no;
	}

	public void setDetail_no(int detail_no) {
		this.detail_no = detail_no;
	}

	public Date getDetail_date() {
		return detail_date;
	}

	public void setDetail_date(Date detail_date) {
		this.detail_date = detail_date;
	}

	public int getDetail_member_num() {
		return detail_member_num;
	}

	public void setDetail_member_num(int detail_member_num) {
		this.detail_member_num = detail_member_num;
	}

	public int getClass_no() {
		return class_no;
	}

	public void setClass_no(int class_no) {
		this.class_no = class_no;
	}
	
}
