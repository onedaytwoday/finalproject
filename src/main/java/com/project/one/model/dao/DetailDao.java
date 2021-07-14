package com.project.one.model.dao;

import java.util.List;

import com.project.one.model.dto.DetailDto;

public interface DetailDao {
	String NAMESPACE = "detail.";
	
	public List<DetailDto> selectList(int class_no);
	
	public DetailDto selectOne(int class_no);
	
	public int insert(DetailDto dto);
	
	public int update(int class_no);
	
	public int delete(int class_no);
}
