package com.project.one.model.biz;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.one.model.dao.MemberDao;
import com.project.one.model.dto.MemberDto;
import com.project.one.util.AES256;

@Service
public class MemberBizImpl implements MemberBiz {

	@Autowired
	private MemberDao dao;

	@Override
	public int register(MemberDto dto) {

		try {
			dto.setMember_pw(AES256.encrypt(dto.getMember_pw()));
			dto.setMember_name(AES256.encrypt(dto.getMember_name()));
			dto.setMember_email(AES256.encrypt(dto.getMember_email()));
			dto.setMember_addr(AES256.encrypt(dto.getMember_addr()));
			dto.setMember_ip(AES256.encrypt(dto.getMember_ip()));
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
		}

		return dao.register(dto);
	}

	@Override
	public MemberDto checkId(String member_id) {
		try {
			member_id = AES256.encrypt(member_id);
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
		}
		return dao.checkId(member_id);
	}

	@Override
	public MemberDto login(MemberDto dto) {
		
		try {
			dto.setMember_pw(AES256.encrypt(dto.getMember_pw()));
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
		}

		MemberDto user = dao.login(dto);

		try {
			user.setMember_pw(AES256.decrypt(user.getMember_pw()));
			user.setMember_name(AES256.decrypt(user.getMember_name()));
			user.setMember_email(AES256.decrypt(user.getMember_email()));
			user.setMember_addr(AES256.decrypt(user.getMember_addr()));
			user.setMember_ip(AES256.decrypt(user.getMember_ip()));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (GeneralSecurityException e) {
			e.printStackTrace();
		}

		return user;
	}

	@Override
	public MemberDto findIdPw(MemberDto dto) {
		// 암호화
		try {
			dto.setMember_name(AES256.encrypt(dto.getMember_name()));
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
		}

		MemberDto user = dao.findIdPw(dto);

		return user;
	}

	@Override
	public MemberDto selectOne(String member_id) {

		MemberDto user = dao.selectOne(member_id);
		if (user != null) {
			try {
				user.setMember_pw(AES256.decrypt(user.getMember_pw()));
				user.setMember_name(AES256.decrypt(user.getMember_name()));
				user.setMember_email(AES256.decrypt(user.getMember_email()));
				user.setMember_addr(AES256.decrypt(user.getMember_addr()));
				user.setMember_ip(AES256.decrypt(user.getMember_ip()));
			} catch (UnsupportedEncodingException | GeneralSecurityException e) {
				e.printStackTrace();
			}
		}
		return user;
	}

	@Override
	public List<MemberDto> selectList() {
		List<MemberDto> list = dao.selectList();

		for (MemberDto dto : list) {
			// 복호화
			try {
				dto.setMember_pw(AES256.decrypt(dto.getMember_pw()));
				dto.setMember_name(AES256.decrypt(dto.getMember_name()));
				dto.setMember_email(AES256.decrypt(dto.getMember_email()));
				dto.setMember_addr(AES256.decrypt(dto.getMember_addr()));
				dto.setMember_ip(AES256.decrypt(dto.getMember_ip()));
			} catch (UnsupportedEncodingException | GeneralSecurityException e) {
				e.printStackTrace();
			}
		}

		return list;
	}

	@Override
	public int update(MemberDto dto) {

		try {
			dto.setMember_pw(AES256.encrypt(dto.getMember_pw()));
			dto.setMember_name(AES256.encrypt(dto.getMember_name()));
			dto.setMember_email(AES256.encrypt(dto.getMember_email()));
			dto.setMember_addr(AES256.encrypt(dto.getMember_addr()));
			dto.setMember_ip(AES256.encrypt(dto.getMember_ip()));

		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
		}
		return dao.update(dto);
	}

	@Override
	public int updatePw(MemberDto dto) {

		try {
			dto.setMember_pw(AES256.encrypt(dto.getMember_pw()));
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
		}

		return dao.updatePw(dto);
	}
	
	@Override
	public int manageMember(MemberDto dto) {
		dto = dao.selectOne(dto.getMember_id());
		dto.setMember_join((dto.getMember_join().equals("Y") ? "N" : "Y"));

		return dao.manageMember(dto);
	}

	@Override
	public int delete(String member_id) {
		try {
			member_id = AES256.encrypt(member_id);
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
		}

		return dao.delete(member_id);
	}

	@Override
	public List<MemberDto> selectListConsult(String member_grade) {

		return dao.selectListConsult(member_grade);
	}

}
