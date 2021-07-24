package com.project.one.model.biz;

import java.util.List;

import com.project.one.model.dto.ClassDto;
import com.project.one.model.dto.PagingDto;

public interface ClassBiz {
	public List<ClassDto> selectList();
	
	public List<ClassDto> classList(PagingDto pDto);
	
	public List<ClassDto> classListPaging(PagingDto pDto);
	
	public List<ClassDto> classListSearch(PagingDto pDto);

	public List<ClassDto> main_selectList();
	
	public ClassDto selectOne(int class_no);
	
	public ClassDto selectOneByTitle(String class_title);

	public int insert(ClassDto dto);

	public int update(ClassDto dto);
	
	public int updateSale(ClassDto dto);

	public int delete(int class_no);

	public List<ClassDto> myClass(PagingDto dto, String member_id);
	
	public int classListCount();
	
	public int myClassCount(String member_id);
	
	public int classSearchCount(PagingDto pDto);
	
	public List<ClassDto> searchedList(String search_keyword);
}
