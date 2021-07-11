package com.project.one.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.one.model.dao.BasketDao;
import com.project.one.model.dto.BasketDto;

@Service
public class BasketBizImpl implements BasketBiz {

	@Autowired
	private BasketDao dao;
	
	@Override
	public List<BasketDto> selectList(String member_id) {
		return dao.selectList(member_id);
	}
	
	@Override
	public BasketDto selectOne(BasketDto dto) {
		return dao.selectOne(dto);
	}

	@Override
	public int insert(BasketDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(BasketDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(BasketDto dto) {
		return dao.delete(dto);
	}

	@Override
	public int deleteAll(String member_id) {
		return dao.deleteAll(member_id);
	}
}
