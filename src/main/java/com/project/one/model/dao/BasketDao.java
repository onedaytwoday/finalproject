package com.project.one.model.dao;

import com.project.one.model.dto.BasketDto;

public interface BasketDao {
	String NAMESPACE = "basket.";
	
	public BasketDto selectOne(int basket_no);
	
	public int insert(BasketDto dto);
	
	public int update(BasketDto dto);
	
	public int delete(int basket_no);
}
