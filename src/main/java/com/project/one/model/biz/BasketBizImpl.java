package com.project.one.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.one.model.dao.BasketDao;
import com.project.one.model.dto.BasketDto;

@Service
public class BasketBizImpl implements BasketBiz {

	@Autowired
	private BasketDao dao;
	
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
	public int delete(int basket_no) {
		return dao.delete(basket_no);
	}

}
