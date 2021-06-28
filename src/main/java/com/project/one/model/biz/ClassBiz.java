package com.project.one.model.biz;

import java.util.List;

import com.project.one.model.dto.ClassDto;

public interface ClassBiz {
	public List<ClassDto> selectList();

	public ClassDto selectOne(int class_no);

	public int insert(ClassDto dto);

	public int update(ClassDto dto);

	public int delete(int class_no);
}