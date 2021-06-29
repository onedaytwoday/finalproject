<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>일반회원 회원가입</h1>
	
	<form action="signup.do" method="post">
		<input type="hidden" name="member_grade" value="일반회원">
		<input type="hidden" name="member_ip" value="192.108.10.1" />
		<input type="hidden" name="member_join" value="Y" />
		<input type="hidden" name="member_notify" value="Y" />
		<input type="hidden" name="member_face" value="N" />
		<input type="hidden" name="member_auto" value="Y" />
		<table border="1">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="member_id" required="required"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" name="member_pw" required="required"></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="text" name="member_pw_chk" required="required"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="member_name" required="required"></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input type="text" name="member_nicname" required="required"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="member_email" required="required"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="member_phone" required="required"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="member_addr" required="required"></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="회원가입" />
					<input type="button" value="취소" onclick="" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>