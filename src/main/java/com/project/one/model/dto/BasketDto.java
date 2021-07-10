package com.project.one.model.dto;

public class BasketDto {
	private int basket_no;
	private int basket_num;
	private int basket_price;
	private int basket_group;
	private int product_no;
	private String member_id;
	
	public BasketDto() {
	}

	public BasketDto(int basket_no, int basket_num, int basket_price, int basket_group, int product_no, String member_id) {
		super();
		this.basket_no = basket_no;
		this.basket_num = basket_num;
		this.basket_price = basket_price;
		this.basket_group = basket_group;
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

	public int getBasket_price() {
		return basket_price;
	}

	public void setBasket_price(int basket_price) {
		this.basket_price = basket_price;
	}

	public int getBasket_group() {
		return basket_group;
	}

	public void setBasket_group(int basket_group) {
		this.basket_group = basket_group;
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

	@Override
	public String toString() {
		return "BasketDto [basket_no=" + basket_no + ", basket_num=" + basket_num + ", basket_price=" + basket_price
				+ ", basket_group=" + basket_group + ", product_no=" + product_no + ", member_id=" + member_id + "]";
	}
	
}
