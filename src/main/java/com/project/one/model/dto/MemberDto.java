package com.project.one.model.dto;

public class MemberDto {
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_nicname;
	private String member_email;
	private String member_phone;
	private String member_addr;
	private String member_ip;
	private String member_grade;
	private String member_join;
	private String member_notify;
	private String member_face;
	private String member_auto;
	
	public MemberDto() {

	}

	public MemberDto(String member_id, String member_pw, String member_name, String member_nicname, String member_email,
			String member_phone, String member_addr, String member_ip, String member_grade, String member_join,
			String member_notify, String member_face, String member_auto) {
		super();
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.member_nicname = member_nicname;
		this.member_email = member_email;
		this.member_phone = member_phone;
		this.member_addr = member_addr;
		this.member_ip = member_ip;
		this.member_grade = member_grade;
		this.member_join = member_join;
		this.member_notify = member_notify;
		this.member_face = member_face;
		this.member_auto = member_auto;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_nicname() {
		return member_nicname;
	}

	public void setMember_nicname(String member_nicname) {
		this.member_nicname = member_nicname;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_addr() {
		return member_addr;
	}

	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}

	public String getMember_ip() {
		return member_ip;
	}

	public void setMember_ip(String member_ip) {
		this.member_ip = member_ip;
	}

	public String getMember_grade() {
		return member_grade;
	}

	public void setMember_grade(String member_grade) {
		this.member_grade = member_grade;
	}

	public String getMember_join() {
		return member_join;
	}

	public void setMember_join(String member_join) {
		this.member_join = member_join;
	}

	public String getMember_notify() {
		return member_notify;
	}

	public void setMember_notify(String member_notify) {
		this.member_notify = member_notify;
	}

	public String getMember_face() {
		return member_face;
	}

	public void setMember_face(String member_face) {
		this.member_face = member_face;
	}

	public String getMember_auto() {
		return member_auto;
	}

	public void setMember_auto(String member_auto) {
		this.member_auto = member_auto;
	}
	
}
