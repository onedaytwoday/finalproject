package com.project.one.model.dto;

import java.util.Date;

public class FileTableDto {
	private int file_num;
	private String file_path;
	private String file_ori_name;
	private String file_new_name;
	private String file_type;
	private Date file_date;
	private String file_size;
	private int product_no;
	private int class_no;
	private int review_no;
	private int event_no;

	public FileTableDto() {
	}
	public FileTableDto(int file_num, String file_path, String file_ori_name, String file_new_name, String file_type,
			Date file_date, String file_size, int product_no, int class_no, int review_no, int event_no) {
		super();
		this.file_num = file_num;
		this.file_path = file_path;
		this.file_ori_name = file_ori_name;
		this.file_new_name = file_new_name;
		this.file_type = file_type;
		this.file_date = file_date;
		this.file_size = file_size;
		this.product_no = product_no;
		this.class_no = class_no;
		this.review_no = review_no;
		this.event_no = event_no;
	}

	public int getFile_num() {
		return file_num;
	}

	public void setFile_num(int file_num) {
		this.file_num = file_num;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public String getFile_ori_name() {
		return file_ori_name;
	}

	public void setFile_ori_name(String file_ori_name) {
		this.file_ori_name = file_ori_name;
	}

	public String getFile_new_name() {
		return file_new_name;
	}

	public void setFile_new_name(String file_new_name) {
		this.file_new_name = file_new_name;
	}

	public String getFile_type() {
		return file_type;
	}

	public void setFile_type(String file_type) {
		this.file_type = file_type;
	}

	public Date getFile_date() {
		return file_date;
	}

	public void setFile_date(Date file_date) {
		this.file_date = file_date;
	}

	public String getFile_size() {
		return file_size;
	}

	public void setFile_size(String file_size) {
		this.file_size = file_size;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public int getClass_no() {
		return class_no;
	}

	public void setClass_no(int class_no) {
		this.class_no = class_no;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public int getEvent_no() {
		return event_no;
	}

	public void setEvent_no(int event_no) {
		this.event_no = event_no;
	}

	@Override
	public String toString() {
		return "FileTableDto [file_num=" + file_num + ", file_path=" + file_path + ", file_ori_name=" + file_ori_name
				+ ", file_new_name=" + file_new_name + ", file_type=" + file_type + ", file_date=" + file_date
				+ ", file_size=" + file_size + ", product_no=" + product_no + ", class_no="
				+ class_no + ", review_no=" + review_no + ", event_no=" + event_no + "]";
	}
	
}
