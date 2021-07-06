package com.project.one.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.one.model.dao.MemberDao;
import com.project.one.model.dto.MemberDto;

@Service
public class MemberBizImpl implements MemberBiz {

	@Autowired
	private MemberDao dao;
	
	@Override
	public int register(MemberDto dto) {
		return dao.register(dto);
	}

	@Override
	public MemberDto checkId(String member_id) {
		return dao.checkId(member_id);
	}

	@Override
	public MemberDto login(MemberDto dto) {
		return dao.login(dto);
	}

	@Override
	public MemberDto findIdPw(MemberDto dto) {
		return dao.findIdPw(dto);
	}

	@Override
	public MemberDto selectOne(String member_id) {
		return dao.selectOne(member_id);
	}

	@Override
	public List<MemberDto> selectList() {
		return dao.selectList();
	}

	@Override
	public int update(MemberDto dto) {
		return dao.update(dto);
	}
	
	@Override
	public int updatePw(MemberDto dto) {
		return dao.updatePw(dto);
	}

	@Override
	public int delete(String member_id) {
		return dao.delete(member_id);
	}

}
