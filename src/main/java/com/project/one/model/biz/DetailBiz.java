package com.project.one.model.biz;

import java.util.List;

import com.project.one.model.dto.DetailDto;

public interface DetailBiz {
	public List<DetailDto> selectList(int class_no);

	public DetailDto selectOne(int detail_no);

	public int insert(DetailDto dto);

	public int update(int detail_no);

	public int delete(int detail_no);
}
