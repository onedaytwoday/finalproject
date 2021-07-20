package com.project.one.model.dto;

public class SearchDto {

	private int product_no;
	private int class_no;
	
	public SearchDto() {
	}

	public SearchDto(int product_no, int class_no) {
		super();
		this.product_no = product_no;
		this.class_no = class_no;
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

	@Override
	public String toString() {
		return "SearchDto [product_no=" + product_no + ", class_no=" + class_no + "]";
	}
	
}
