package com.project.one.model.biz;

import com.project.one.model.dto.BasketDto;

public interface BasketBiz {
	public BasketDto selectOne(int basket_no);

	public int insert(BasketDto dto);

	public int update(BasketDto dto);

	public int delete(int basket_no);
}
