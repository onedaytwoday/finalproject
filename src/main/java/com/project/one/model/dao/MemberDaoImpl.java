package com.project.one.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.one.model.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	@Override
	public int register(MemberDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public MemberDto checkId(String member_id) {
		MemberDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "checkId", member_id); 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return dto;
	}

	@Override
	public MemberDto login(MemberDto dto) {
		MemberDto user = null;
		try {		
			
			user = sqlSession.selectOne(NAMESPACE + "login", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}

	@Override
	public MemberDto findIdPw(MemberDto dto) {
		MemberDto user = null;
		
		try {
			
			user = sqlSession.selectOne(NAMESPACE + "findIdPw", dto);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return user;
	}

	@Override
	public MemberDto selectOne(String member_id) {
		MemberDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", member_id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return dto;
	}

	@Override
	public List<MemberDto> selectList() {
		List<MemberDto> list = new ArrayList<MemberDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "selectList");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int update(MemberDto dto) {
		int res = 0;
		
		try {			
			res = sqlSession.update(NAMESPACE + "update", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public int updatePw(MemberDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "updatePw", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public int manageMember(MemberDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "manageMember", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int delete(String member_id) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "delete", member_id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public List<MemberDto> selectListConsult(String member_grade) {
		List<MemberDto> list = new ArrayList<MemberDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectListConsult", member_grade);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
