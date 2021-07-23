package com.project.one.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.one.model.dao.RankDao;
import com.project.one.model.dto.RankDto;
@Service
public class RankBizImpl implements RankBiz {

	@Autowired
	private RankDao dao;
	@Override
	public List<RankDto> selectList() {
		return dao.selectList();
	}

	@Override
	public RankDto selectOne(int rank_no) {
		return dao.selectOne(rank_no);
	}

	@Override
	public int insert(RankDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(RankDto dto) {
		return dao.update(dto);
	}

}
