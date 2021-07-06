package com.project.one.model.dto;

public class ClassDto {
	private int class_no;
	private String class_title;
	private String class_desc;
	private String class_loc;
	private String class_category;
	private int class_member_num;
	private int class_price;
	private int class_sale;
	private String member_id;

	public ClassDto() {
	}

	public ClassDto(int class_no, String class_title, String class_desc, String class_loc, String class_category,
			int class_member_num, int class_price, int class_sale, String member_id) {
		this.class_no = class_no;
		this.class_title = class_title;
		this.class_desc = class_desc;
		this.class_loc = class_loc;
		this.class_category = class_category;
		this.class_member_num = class_member_num;
		this.class_price = class_price;
		this.class_sale = class_sale;
		this.member_id = member_id;
	}

	public int getClass_no() {
		return class_no;
	}

	public void setClass_no(int class_no) {
		this.class_no = class_no;
	}

	public String getClass_title() {
		return class_title;
	}

	public void setClass_title(String class_title) {
		this.class_title = class_title;
	}

	public String getClass_desc() {
		return class_desc;
	}

	public void setClass_desc(String class_desc) {
		this.class_desc = class_desc;
	}

	public String getClass_loc() {
		return class_loc;
	}

	public void setClass_loc(String class_loc) {
		this.class_loc = class_loc;
	}

	public String getClass_category() {
		return class_category;
	}

	public void setClass_category(String class_category) {
		this.class_category = class_category;
	}

	public int getClass_member_num() {
		return class_member_num;
	}

	public void setClass_member_num(int class_member_num) {
		this.class_member_num = class_member_num;
	}

	public int getClass_price() {
		return class_price;
	}

	public void setClass_price(int class_price) {
		this.class_price = class_price;
	}

	public int getClass_sale() {
		return class_sale;
	}

	public void setClass_sale(int class_sale) {
		this.class_sale = class_sale;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	@Override
	public String toString() {
		return "ClassDto [class_no=" + class_no + ", class_title=" + class_title + ", class_desc=" + class_desc
				+ ", class_loc=" + class_loc + ", class_category=" + class_category + ", class_member_num="
				+ class_member_num + ", class_price=" + class_price + ", class_sale=" + class_sale + ", member_id="
				+ member_id + "]";
	}

}
