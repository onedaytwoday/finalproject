package com.project.one.model.biz;

import java.util.List;

import com.project.one.model.dto.DetailDto;

public interface DetailBiz {
	public List<DetailDto> selectList(int class_no);

	public DetailDto selectOne(int class_no);

	public int insert(DetailDto dto);

	public int update(DetailDto dto);

	public int delete(int class_no);
}
