<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<tr><td><input type="button" name="member_update" value="개인정보수정" onclick="location.href='mypage_update.do'"></td></tr>
		<tr><td><input type="button" name="member_payment" value="전체 주문 내역" onclick="location.href='mypage_payment.do?nowPage=1'"></td></tr>
		<tr><td><input type="button" name="member_board" value="내가 쓴글" onclick="location.href='mypage_board.do'"></td></tr>
		<tr><td><input type="button" name="member_class" value="수강 클래스 내역" onclick="location.href='mypage_class.do'"></td></tr>
		<tr><td><input type="button" name="member_class" value="회원탈퇴" onclick="delOk()"></td></tr>
	</table>
</body>
</html>