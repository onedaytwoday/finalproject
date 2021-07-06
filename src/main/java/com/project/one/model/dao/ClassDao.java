package com.project.one.model.dao;

import java.util.List;

import com.project.one.model.dto.ClassDto;

public interface ClassDao {

	String NAMESPACE = "class.";
	
	public List<ClassDto> selectList();
	
	public ClassDto selectOne(int class_no);
	
	public ClassDto selectOneByTitle(String class_title);
	
	public int insert(ClassDto dto);
	
	public int update(ClassDto dto);
	
	public int delete(int class_no);
}
