<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>

</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<jsp:include page="./mypage_menu.jsp"></jsp:include>
<h1>개인정보수정</h1>
<form action="mypage_updateres.do" method="post">
	<table>
	<tr><td>아이디 <input type="text" name="member_id" value="${mDto.member_id }" readonly="readonly"><tr><td>
	<tr><td>닉네임 <input type="text" name="member_nicname" value="${mDto.member_nicname }" readonly="readonly"><tr><td>
	<tr><td>비밀번호 <input type="text" name="member_pw" value="${mDto.member_pw }"><tr><td>
	<tr><td>주소 <input type="text" name="member_addr" value="${mDto.member_addr }" ><tr><td>
	<tr><td>이메일 <input type="text" name="member_email" value="${mDto.member_email }"><tr><td>
	<tr>
		<td>
			<input type="submit" value="수정">
			<input type="button" value="Home" onclick="location.href='main.do'" >
		</td>
	</tr>
	</table>
</form>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>