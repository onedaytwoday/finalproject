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
	@Autowired
	private AES256 aes;
	
	@Override
	public int register(MemberDto dto) {
		
		//암호화
		try {
			dto.setMember_pw(aes.encrypt(dto.getMember_pw()));
			dto.setMember_name(aes.encrypt(dto.getMember_name()));
			dto.setMember_email(aes.encrypt(dto.getMember_email()));
			dto.setMember_addr(aes.encrypt(dto.getMember_addr()));
			dto.setMember_ip(aes.encrypt(dto.getMember_ip()));
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


		return dao.register(dto);
	}

	@Override
	public MemberDto checkId(String member_id) {
		try {
			member_id = aes.encrypt(member_id);
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
		}
		return dao.checkId(member_id);
	}

	@Override
	public MemberDto login(MemberDto dto) {
		//암호화
		try {
			dto.setMember_pw(aes.encrypt(dto.getMember_pw()));
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		MemberDto user = dao.login(dto);
		
			try {
				user.setMember_pw(aes.decrypt(user.getMember_pw()));
				user.setMember_name(aes.decrypt(user.getMember_name()));
				user.setMember_email(aes.decrypt(user.getMember_email()));
				user.setMember_addr(aes.decrypt(user.getMember_addr()));
				user.setMember_ip(aes.decrypt(user.getMember_ip()));
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (GeneralSecurityException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}


	
		
		return user;
	}

	@Override
	public MemberDto findIdPw(MemberDto dto) {
		System.out.println(dto.getMember_name());
		
		//암호화
		 try {
			dto.setMember_name(aes.encrypt(dto.getMember_name()));
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		MemberDto user = dao.findIdPw(dto);

		return user;
	}

	@Override
	public MemberDto selectOne(String member_id) {
		System.out.println(member_id);
		
		MemberDto user = dao.selectOne(member_id);
		
		try {
			user.setMember_pw(aes.decrypt(user.getMember_pw()));
			user.setMember_name(aes.decrypt(user.getMember_name()));
			user.setMember_email(aes.decrypt(user.getMember_email()));
			user.setMember_addr(aes.decrypt(user.getMember_addr()));
			user.setMember_ip(aes.decrypt(user.getMember_ip()));
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
		}
		

		return user;
	}

	@Override
	public List<MemberDto> selectList() {
		List<MemberDto> list =  dao.selectList();
		
		for(MemberDto dto : list) {
			//복호화
			try {
				dto.setMember_pw(aes.decrypt(dto.getMember_pw()));
				dto.setMember_name(aes.decrypt(dto.getMember_name()));
				dto.setMember_email(aes.decrypt(dto.getMember_email()));
				dto.setMember_addr(aes.decrypt(dto.getMember_addr()));
				dto.setMember_ip(aes.decrypt(dto.getMember_ip()));
			} catch (UnsupportedEncodingException | GeneralSecurityException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}

	@Override
	public int update(MemberDto dto) {
		//암호화
		try {
			dto.setMember_pw(aes.encrypt(dto.getMember_pw()));
			dto.setMember_name(aes.encrypt(dto.getMember_name()));
			dto.setMember_email(aes.encrypt(dto.getMember_email()));
			dto.setMember_addr(aes.encrypt(dto.getMember_addr()));
			dto.setMember_ip(aes.encrypt(dto.getMember_ip()));
			
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return dao.update(dto);
	}
	
	@Override
	public int updatePw(MemberDto dto) {
		//암호화
		try {
			dto.setMember_pw(aes.encrypt(dto.getMember_pw()));
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			// TODO Auto-generated catch block
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
		//암호화
		try {
			member_id = aes.encrypt(member_id);
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return dao.delete(member_id);
	}

	@Override
	public List<MemberDto> selectListConsult(String member_grade) {
		
		return dao.selectListConsult(member_grade);
	}

}
