package com.project.one.model.biz;

import java.util.List;

import com.project.one.model.dto.RankDto;

public interface RankBiz {
	
	public List<RankDto> selectList();
	
	public RankDto selectOne(int rank_no);
	
	public int insert(RankDto dto);
	
	public int update(RankDto dto);
}
