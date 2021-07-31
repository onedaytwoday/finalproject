package com.project.one.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.one.model.dao.DetailDao;
import com.project.one.model.dto.DetailDto;

@Service
public class DetailBizImpl implements DetailBiz {

	@Autowired
	private DetailDao dao;
	
	@Override
	public List<DetailDto> selectList(int class_no) {
		return dao.selectList(class_no);
	}

	@Override
	public DetailDto selectOne(int detail_no) {
		return dao.selectOne(detail_no);
	}

	@Override
	public int insert(DetailDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(int detail_no) {
		return dao.update(detail_no);
	}

	@Override
	public int delete(int detail_no) {
		return dao.delete(detail_no);
	}

}
