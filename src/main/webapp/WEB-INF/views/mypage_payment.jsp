<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<style type="text/css">

	table{
		float: left;
		margin-right: 20px;
	}

</style>
</head>
<body>
<table>
<tr><td><input type="button" name="member_update" value="개인정보수정" onclick="location.href='member_update.do?member_id=${dto.member_id}'"></td></tr>
<tr><td><input type="button" name="member_payment" value="전체 주문 내역" onclick="location.href='member_payment?member_id=${dto.member_id}'"></td></tr>
<tr><td><input type="button" name="member_board" value="내가 쓴글" onclick="location.href='member_board??member_id=${dto.member_id}'"></td></tr>
<tr><td><input type="button" name="member_class" value="수강 클래스 내역" onclick="location.href='member_class?member_id=${dto.member_id}'"></td></tr>
</table>
<h1>MyPage</h1>
<form action="" method="post">
	<table>
	<tr><td>아이디 <input type="text" name="member_id" value="${dto.member_id }" readonly="readonly"><tr><td>
	<tr><td>닉네임 <input type="text" name="member_nicname" value="${dto.member_nicname }" readonly="readonly"><tr><td>
	<tr><td>비밀번호 <input type="text" name="member_pw" value="${dto.member_pw }"><tr><td>
	<tr><td>주소 <input type="text" name="member_addr" value="${dto.member_addr }" ><tr><td>
	<tr><td>이메일 <input type="text" name="member_email" value="${dto.member_email }"><tr><td>
	<tr>
		<td>
			<input type="submit" value="수정">
			<input type="button" value="Home" onclick="location.href='main.do'" >
		</td>
	</tr>
	</table>
</form>
</body>
</html>