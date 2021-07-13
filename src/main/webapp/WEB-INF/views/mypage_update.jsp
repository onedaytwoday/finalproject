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
<script type="text/javascript">
	function delOk() {
		if (confirm("회원탈퇴를 하시면 복구할 수 없습니다. \n 정말로 탈퇴하시겠습니까?")) {
			location.href = "mypage_del.do?member_id=${dto.member_id}" 
		    alert("회원탈퇴가 완료되었습니다.");
		} else {
			location.href = "mypage_update.do?member_id=${dto.member_id}"
		}
	}
</script>
</head>
<body>
<table>
<tr><td><input type="button" name="member_update" value="개인정보수정" onclick="location.href='mypage_update.do?member_id=${dto.member_id}'"></td></tr>
<tr><td><input type="button" name="member_payment" value="전체 주문 내역" onclick="location.href='mypage_payment.do?member_id=${dto.member_id}'"></td></tr>
<tr><td><input type="button" name="member_board" value="내가 쓴글" onclick="location.href='mypage_board.do?member_id=${dto.member_id}'"></td></tr>
<tr><td><input type="button" name="member_class" value="수강 클래스 내역" onclick="location.href='mypage_class.do?member_id=${dto.member_id}'"></td></tr>
<tr><td><input type="button" name="member_class" value="회원탈퇴" onclick="delOk()"></td></tr>
</table>
<h1>개인정보수정</h1>
<form action="mypage_updateres.do" method="post">
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