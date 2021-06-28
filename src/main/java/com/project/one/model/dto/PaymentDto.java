package com.project.one.model.dto;

import java.util.Date;

public class PaymentDto {
	private int payment_no;
	private int payment_num;
	private double payment_price;
	private Date payment_date;
	private String payment_del;
	private String member_id;
	private int product_no;
	private int basket_no;
	private int class_no;
	
	public PaymentDto() {
	}

	public PaymentDto(int payment_no, int payment_num, double payment_price, Date payment_date, String payment_del,
			String member_id, int product_no, int basket_no, int class_no) {
		super();
		this.payment_no = payment_no;
		this.payment_num = payment_num;
		this.payment_price = payment_price;
		this.payment_date = payment_date;
		this.payment_del = payment_del;
		this.member_id = member_id;
		this.product_no = product_no;
		this.basket_no = basket_no;
		this.class_no = class_no;
	}

	public int getPayment_no() {
		return payment_no;
	}

	public void setPayment_no(int payment_no) {
		this.payment_no = payment_no;
	}

	public int getPayment_num() {
		return payment_num;
	}

	public void setPayment_num(int payment_num) {
		this.payment_num = payment_num;
	}

	public double getPayment_price() {
		return payment_price;
	}

	public void setPayment_price(double payment_price) {
		this.payment_price = payment_price;
	}

	public Date getPayment_date() {
		return payment_date;
	}

	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}

	public String getPayment_del() {
		return payment_del;
	}

	public void setPayment_del(String payment_del) {
		this.payment_del = payment_del;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public int getBasket_no() {
		return basket_no;
	}

	public void setBasket_no(int basket_no) {
		this.basket_no = basket_no;
	}

	public int getClass_no() {
		return class_no;
	}

	public void setClass_no(int class_no) {
		this.class_no = class_no;
	}
	
}
