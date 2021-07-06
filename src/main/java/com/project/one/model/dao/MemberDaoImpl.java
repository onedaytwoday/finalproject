package com.project.one.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.one.model.dto.MemberDto;
import com.project.one.util.AES256;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private AES256 aes;
	
	@Override
	public int register(MemberDto dto) {
		int res = 0;
		
		try {
			
			//암호화
			dto.setMember_pw(aes.encrypt(dto.getMember_pw()));
			dto.setMember_name(aes.encrypt(dto.getMember_name()));
			dto.setMember_email(aes.encrypt(dto.getMember_email()));
			dto.setMember_addr(aes.encrypt(dto.getMember_addr()));
			dto.setMember_ip(aes.encrypt(dto.getMember_ip()));
			
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
			member_id = aes.encrypt(member_id);
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
			
			//암호화
			dto.setMember_pw(aes.encrypt(dto.getMember_pw()));
			
			user = sqlSession.selectOne(NAMESPACE + "login", dto);
			
			//복호화
			user.setMember_pw(aes.decrypt(user.getMember_pw()));
			user.setMember_name(aes.decrypt(user.getMember_name()));
			user.setMember_email(aes.decrypt(user.getMember_email()));
			user.setMember_addr(aes.decrypt(user.getMember_addr()));
			user.setMember_ip(aes.decrypt(user.getMember_ip()));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}

	@Override
	public MemberDto findIdPw(MemberDto dto) {
		MemberDto user = null;
		
		try {
			
			//암호화
			dto.setMember_pw(aes.encrypt(dto.getMember_pw()));
			
			user = sqlSession.selectOne(NAMESPACE + "findIdPw", dto);
			
			
			//복호화
			user.setMember_pw(aes.decrypt(user.getMember_pw()));
			user.setMember_name(aes.decrypt(user.getMember_name()));
			user.setMember_email(aes.decrypt(user.getMember_email()));
			user.setMember_addr(aes.decrypt(user.getMember_addr()));
			user.setMember_ip(aes.decrypt(user.getMember_ip()));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return user;
	}

	@Override
	public MemberDto selectOne(String member_id) {
		MemberDto dto = null;
		
		try {
			//암호화
			member_id = aes.encrypt(member_id);
			
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", member_id);
			
			//복호화
			dto.setMember_pw(aes.decrypt(dto.getMember_pw()));
			dto.setMember_name(aes.decrypt(dto.getMember_name()));
			dto.setMember_email(aes.decrypt(dto.getMember_email()));
			dto.setMember_addr(aes.decrypt(dto.getMember_addr()));
			dto.setMember_ip(aes.decrypt(dto.getMember_ip()));
			
			
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
			//암호화
			dto.setMember_pw(aes.encrypt(dto.getMember_pw()));
			dto.setMember_name(aes.encrypt(dto.getMember_name()));
			dto.setMember_email(aes.encrypt(dto.getMember_email()));
			dto.setMember_addr(aes.encrypt(dto.getMember_addr()));
			dto.setMember_ip(aes.encrypt(dto.getMember_ip()));
			
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
	public int delete(String member_id) {
		int res = 0;
		
		try {
			//암호화
			member_id = aes.encrypt(member_id);
			
			res = sqlSession.delete(NAMESPACE + "delete", member_id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

}
