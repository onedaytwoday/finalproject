package com.project.one.model.dto;

import java.util.Date;

public class PaymentDto {
	private int payment_no;
	private int payment_num;
	private int payment_price;
	private Date payment_date;
	private String payment_del;
	private String payment_uid;
	private String member_id;
	private int product_no;
	private int basket_group;
	private int class_no;
	
	public PaymentDto() {
	}

	public PaymentDto(int payment_no, int payment_num, int payment_price, Date payment_date, String payment_del,
			String payment_uid, String member_id, int product_no, int basket_group, int class_no) {
		super();
		this.payment_no = payment_no;
		this.payment_num = payment_num;
		this.payment_price = payment_price;
		this.payment_date = payment_date;
		this.payment_del = payment_del;
		this.payment_uid = payment_uid;
		this.member_id = member_id;
		this.product_no = product_no;
		this.basket_group = basket_group;
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

	public int getPayment_price() {
		return payment_price;
	}

	public void setPayment_price(int payment_price) {
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

	public String getPayment_uid() {
		return payment_uid;
	}

	public void setPayment_uid(String payment_uid) {
		this.payment_uid = payment_uid;
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

	public int getBasket_group() {
		return basket_group;
	}

	public void setBasket_group(int basket_group) {
		this.basket_group = basket_group;
	}

	public int getClass_no() {
		return class_no;
	}

	public void setClass_no(int class_no) {
		this.class_no = class_no;
	}

	@Override
	public String toString() {
		return "PaymentDto [payment_no=" + payment_no + ", payment_num=" + payment_num + ", payment_price="
				+ payment_price + ", payment_date=" + payment_date + ", payment_del=" + payment_del + ", payment_uid="
				+ payment_uid + ", member_id=" + member_id + ", product_no=" + product_no + ", basket_group="
				+ basket_group + ", class_no=" + class_no + "]";
	}
	
}
