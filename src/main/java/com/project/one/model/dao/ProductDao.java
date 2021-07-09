package com.project.one.model.dao;

import java.util.List;

import com.project.one.model.dto.ProductDto;

public interface ProductDao {
	String NAMESPACE = "product.";
	
	public List<ProductDto> selectList();
	
	public ProductDto selectOne(int product_no);
	
	public ProductDto selectOneByName(String product_name);
	
	public int insert(ProductDto dto);
	
	public int update(ProductDto dto);
	
	public int delete(int product_no);
}
