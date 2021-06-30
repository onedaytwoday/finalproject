<%@page import="com.project.one.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script type="text/javascript">
		function idCheckConfirm() {
			var chk = document.getElementsByName("member_id")[0].title;
			if (chk == "n") {
				alert("id 중복체크를 먼저 해주세요.");
				document.getElementsByName("memberid")[0].focus();
			}
		}
		
		function idCheck() {
			var doc = document.getElementsByName("member_id")[0];
			if (doc.value.trim() == "" || doc.value == null) {
				alert("id를 입력해 주세요");
			} else {
				open("idcheck.do?member_id="+doc.value, "", "width=200, height=200");
			}
		}
	</script>

</head>
<body>
	<h1>회원가입</h1>
	
	<form action="signupRes.do" method="post">
		<input type="radio" name="member_grade" value="일반회원" onclick="" checked>일반회원
		<input type="radio" name="member_grade" value="강사회원" onclick="" >강사회원
		<input type="hidden" name="member_ip" value="192.108.10.1" />
		<input type="hidden" name="member_join" value="Y" />
		<input type="hidden" name="member_notify" value="Y" />
		<input type="hidden" name="member_face" value="N" />
		<input type="hidden" name="member_auto" value="Y" />
	<%
		if(request.getAttribute("mDto")==null){
	%>
	
		
		
		<table border="1">
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="member_id" required="required">
					<input type="button" value="중복체크" onclick="idCheck();" />
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" name="member_pw" required="required" onclick="idCheckConfirm();"></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="text" name="member_pw_chk" required="required" onclick="idCheckConfirm();"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="member_name" required="required" onclick="idCheckConfirm();"></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input type="text" name="member_nicname" required="required" onclick="idCheckConfirm();"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="member_email" required="required" onclick="idCheckConfirm();"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="member_phone" required="required" onclick="idCheckConfirm();"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="member_addr" required="required" onclick="idCheckConfirm();"></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="회원가입" />
					<input type="button" value="취소" onclick="" />
				</td>
			</tr>
		</table>
	<%}else{
		MemberDto mDto = (MemberDto)request.getAttribute("mDto");	
	%>
		<table border="1">
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="member_id" required="required" value="${mDto.member_id }">
					<input type="button" value="중복체크" onclick="idCheck();" />
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" name="member_pw" required="required" onclick="idCheckConfirm();"></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="text" name="member_pw_chk" required="required" onclick="idCheckConfirm();"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="member_name" required="required" onclick="idCheckConfirm();" value="${mDto.member_name }"></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input type="text" name="member_nicname" required="required" onclick="idCheckConfirm();" value="${mDto.member_nicname }"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="member_email" required="required" onclick="idCheckConfirm();" value="${mDto.member_email }"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="member_phone" required="required" onclick="idCheckConfirm();" value="${mDto.member_phone }"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="member_addr" required="required" onclick="idCheckConfirm();"></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="회원가입" onclick="" />
					<input type="button" value="취소" onclick="" />
				</td>
			</tr>
		</table>
	
	
	<%} %>
	</form>
</body>
</html>