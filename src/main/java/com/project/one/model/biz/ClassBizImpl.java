package com.project.one.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.one.model.dao.ClassDao;
import com.project.one.model.dto.ClassDto;
import com.project.one.model.dto.PagingDto;

@Service
public class ClassBizImpl implements ClassBiz {

	@Autowired
	private ClassDao dao;
	
	@Override
	public List<ClassDto> selectList() {
		return dao.selectList();
	}

	@Override
	public List<ClassDto> classList(PagingDto pDto) {
		return dao.classList(pDto);
	}
	
	@Override
	public List<ClassDto> main_selectList() {
		return dao.main_selectList();
	}

	
	@Override
	public ClassDto selectOne(int class_no) {
		return dao.selectOne(class_no);
	}
	
	@Override
	public ClassDto selectOneByTitle(String class_title) {
		return dao.selectOneByTitle(class_title);
	}

	@Override
	public int insert(ClassDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(ClassDto dto) {
		return dao.update(dto);
	}
	
	@Override
	public int updateSale(ClassDto dto) {
		return dao.updateSale(dto);
	}

	@Override
	public int delete(int class_no) {
		return dao.delete(class_no);
	}
	
	@Override
	public List<ClassDto> userClass(String member_id) {
		return dao.userClass(member_id);
	}

	@Override
	public int classCount() {
		return dao.classCount();
	}

	@Override
	public List<ClassDto> classListPaging(PagingDto pDto) {
		
		return dao.classListPaging(pDto);
	}

	@Override
	public int classListCount() {
		
		return dao.classListCount();
	}

	@Override
	public List<ClassDto> classListSearch(PagingDto pDto) {
		
		return dao.classListSearch(pDto);
	}

	@Override
	public int classSearchCount(PagingDto pDto) {
		
		return dao.classSearchCount(pDto);
	}

	@Override
	public List<ClassDto> searchedList(String search_keyword) {
		return dao.searchedList(search_keyword);
	}
	
}
