package com.project.one.model.dao;

import java.util.List;

import com.project.one.model.dto.BasketDto;

public interface BasketDao {
	String NAMESPACE = "basket.";
	
	public List<BasketDto> selectList(String member_id);
	
	public BasketDto selectOne(BasketDto dto);
	
	public int insert(BasketDto dto);
	
	public int update(BasketDto dto);
	
	public int delete(BasketDto dto);
}
