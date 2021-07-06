package com.project.one.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.one.model.dao.ClassDao;
import com.project.one.model.dto.ClassDto;

@Service
public class ClassBizImpl implements ClassBiz {

	@Autowired
	private ClassDao dao;
	
	@Override
	public List<ClassDto> selectList() {
		return dao.selectList();
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
	public int delete(int class_no) {
		return dao.delete(class_no);
	}

}
