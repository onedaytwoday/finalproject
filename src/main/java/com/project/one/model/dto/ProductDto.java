package com.project.one.model.dto;

public class ProductDto {
	private int product_no;
	private String product_name;
	private String product_category;
	private int product_price;
	private String product_desc;
	private String product_loc;
	private String product_del;
	private int product_sale;

	public ProductDto() {
	}

	public ProductDto(int product_no, String product_name, String product_category, int product_price,
			String product_desc, String product_loc, String product_del, int product_sale) {
		super();
		this.product_no = product_no;
		this.product_name = product_name;
		this.product_category = product_category;
		this.product_price = product_price;
		this.product_desc = product_desc;
		this.product_loc = product_loc;
		this.product_del = product_del;
		this.product_sale = product_sale;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_category() {
		return product_category;
	}

	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public String getProduct_desc() {
		return product_desc;
	}

	public void setProduct_desc(String product_desc) {
		this.product_desc = product_desc;
	}

	public String getProduct_loc() {
		return product_loc;
	}

	public void setProduct_loc(String product_loc) {
		this.product_loc = product_loc;
	}

	public String getProduct_del() {
		return product_del;
	}

	public void setProduct_del(String product_del) {
		this.product_del = product_del;
	}

	public int getProduct_sale() {
		return product_sale;
	}

	public void setProduct_sale(int product_sale) {
		this.product_sale = product_sale;
	}

	@Override
	public String toString() {
		return "ProductDto [product_no=" + product_no + ", product_name=" + product_name + ", product_category="
				+ product_category + ", product_price=" + product_price + ", product_desc=" + product_desc
				+ ", product_loc=" + product_loc + ", product_del=" + product_del + ", product_sale=" + product_sale
				+ "]";
	}
	
}
