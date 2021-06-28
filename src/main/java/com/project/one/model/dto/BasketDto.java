package com.project.one.model.dto;

public class BasketDto {
	private int basket_no;
	private int basket_num;
	private double basket_price;
	private int product_no;
	private String member_id;
	
	public BasketDto() {
	}

	public BasketDto(int basket_no, int basket_num, double basket_price, int product_no, String member_id) {
		super();
		this.basket_no = basket_no;
		this.basket_num = basket_num;
		this.basket_price = basket_price;
		this.product_no = product_no;
		this.member_id = member_id;
	}

	public int getBasket_no() {
		return basket_no;
	}

	public void setBasket_no(int basket_no) {
		this.basket_no = basket_no;
	}

	public int getBasket_num() {
		return basket_num;
	}

	public void setBasket_num(int basket_num) {
		this.basket_num = basket_num;
	}

	public double getBasket_price() {
		return basket_price;
	}

	public void setBasket_price(double basket_price) {
		this.basket_price = basket_price;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
}
