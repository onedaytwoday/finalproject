package com.project.one.model.biz;

import java.util.List;

import com.project.one.model.dto.BasketDto;

public interface BasketBiz {
	public List<BasketDto> selectList(String member_id);
	
	public BasketDto selectOne(BasketDto dto);

	public int insert(BasketDto dto);

	public int update(BasketDto dto);

	public int delete(BasketDto dto);
	
	public int deleteAll(String member_id);
}
