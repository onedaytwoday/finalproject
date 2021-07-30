package com.project.one.model.biz;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.one.model.dao.ClassDao;
import com.project.one.model.dto.ClassDto;
import com.project.one.model.dto.EventDto;
import com.project.one.model.dto.PagingDto;
import com.project.one.model.dto.StorePagingDto;

@Service
public class ClassBizImpl implements ClassBiz {

	@Autowired
	private ClassDao dao;
	
	@Autowired
	private EventBiz eBiz;
	
	@Override
	public List<ClassDto> selectList() {
		List<ClassDto> list = dao.selectList();
		List<ClassDto> cList = new ArrayList<ClassDto>();
		EventDto eDto;
		
		for(ClassDto c : list) {
			eDto = eBiz.eventClass(c.getClass_no());
			if(eDto == null) {
				cList.add(c);
			}
		}
		
		return cList;
	}

	@Override
	public List<ClassDto> classList(PagingDto pDto) {
		List<ClassDto> list = dao.classList(pDto);
		EventDto eDto;
		
		for(ClassDto c : list) {
			eDto = eBiz.eventClass(c.getClass_no());
			if(eDto == null || eDto.getEvent_noti().equals("N")) {
				c.setClass_sale(0);
			}
		}
		
		
		return list;
	}
	
	@Override
	public List<ClassDto> totalList() {
		return dao.totalList();
	}
	
	@Override
	public List<ClassDto> main_selectList() {
		return dao.main_selectList();
	}
	
	@Override
	public List<ClassDto> selectfile(int class_no) {
		return dao.selectfile(class_no);
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
	public int class_location(ClassDto dto) {
		return dao.class_location(dto);
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
	public List<ClassDto> classListPaging(PagingDto pDto) {
		
		return dao.classListPaging(pDto);
	}

	@Override
	public int classListCount() {
		
		return dao.classListCount();
	}
	
	@Override
	public int myClassCount(String member_id) {
		
		return dao.myClassCount(member_id);
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

	@Override
	public List<ClassDto> categoryListPaging(PagingDto pDto) {
		return dao.categoryListPaging(pDto);
	}

	@Override
	public int classcategoryCount(String class_category) {
		return dao.classcategoryCount(class_category);
	}

	@Override
	public List<ClassDto> myClassList(PagingDto pDto) {
		return dao.myClassList(pDto);
	}

}
