package com.project.one.model.dto;

import java.util.Date;

public class ReviewDto {
	private int review_no;
	private String review_title;
	private double review_rate;
	private Date review_date;
	private String review_content;
	private int product_no;
	private int class_no;
	private String member_id;
	private String product_name;
	private String class_title;
	
	public ReviewDto() {
	}

	public ReviewDto(int review_no, String review_title, double review_rate, Date review_date, String review_content,
			int product_no, int class_no, String member_id) {
		super();
		this.review_no = review_no;
		this.review_title = review_title;
		this.review_rate = review_rate;
		this.review_date = review_date;
		this.review_content = review_content;
		this.product_no = product_no;
		this.class_no = class_no;
		this.member_id = member_id;
	}

	public ReviewDto(int review_no, String review_title, double review_rate, Date review_date, String review_content,
			int product_no, int class_no, String member_id, String product_name, String class_title) {
		super();
		this.review_no = review_no;
		this.review_title = review_title;
		this.review_rate = review_rate;
		this.review_date = review_date;
		this.review_content = review_content;
		this.product_no = product_no;
		this.class_no = class_no;
		this.member_id = member_id;
		this.product_name = product_name;
		this.class_title = class_title;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public double getReview_rate() {
		return review_rate;
	}

	public void setReview_rate(double review_rate) {
		this.review_rate = review_rate;
	}

	public Date getReview_date() {
		return review_date;
	}

	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
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

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getClass_title() {
		return class_title;
	}

	public void setClass_title(String class_title) {
		this.class_title = class_title;
	}

	@Override
	public String toString() {
		return "ReviewDto [review_no=" + review_no + ", review_title=" + review_title + ", review_rate=" + review_rate
				+ ", review_date=" + review_date + ", review_content=" + review_content + ", product_no=" + product_no
				+ ", class_no=" + class_no + ", member_id=" + member_id + "]";
	}
		
}
