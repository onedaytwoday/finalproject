package com.project.one.model.dao;

import java.util.List;

import com.project.one.model.dto.MemberDto;

public interface MemberDao {
	String NAMESPACE = "member.";
	
	// 회원 가입	
	public int register(MemberDto dto);
	
	// 아이디 유효성 검사
	public MemberDto checkId(String member_id);
	
	// 로그인
	public MemberDto login(MemberDto dto);
	
	// 아이디, 비밀번호 찾기
	public MemberDto findIdPw(MemberDto dto);
	
	// 회원 정보 조회
	public MemberDto selectOne(String member_id);
	
	// 모든 회원 정보 조회
	public List<MemberDto> selectList();
	
	// 회원 정보 수정
	public int update(MemberDto dto);
	
	// 비밀번호 변경
	public int updatePw(MemberDto dto);
	
	// 회원 관리
	public int manageMember(MemberDto dto);
	
	// 회원 탈퇴
	public int delete(String member_id);
	
	//강사회원목록
	public List<MemberDto> selectListConsult(String member_grade);
	
}
