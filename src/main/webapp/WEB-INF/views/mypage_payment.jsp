<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<tr><td><input type="button" name="member_update" value="개인정보수정" onclick="location.href='mypage_update.do?member_id=${member_id}'"></td></tr>
<tr><td><input type="button" name="member_payment" value="전체 주문 내역" onclick="location.href='mypage_payment.do?member_id=${member_id}'"></td></tr>
<tr><td><input type="button" name="member_board" value="내가 쓴글" onclick="location.href='mypage_board.do?member_id=${member_id}'"></td></tr>
<tr><td><input type="button" name="member_class" value="수강 클래스 내역" onclick="location.href='mypage_class.do?member_id=${member_id}'"></td></tr>
<tr><td><input type="button" name="member_class" value="회원탈퇴" onclick="delOk()"></td></tr>
</table>
<h1>전체 주문 내역</h1>
<table border="1">
		<col width="50"/>
		<col width="100"/>
		<col width="400"/>
		<col width="200"/>
		<col width="200"/>	
		<tr>
			<th>번호</th>
			<th>상품명</th>
			<th>수량</th>
			<th>총 가격</th>
			<th>배송상태</th>
		</tr>
		
		<c:set var="cnt" value="1"/>
		<c:choose>
			<c:when test="${empty list }">
				<tr><th colspan="5">-----------------구매하신 상품이 없습니다-------------</th></tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${cnt }</td>
						<td><a href="store_select.do?product_no=${dto.product_no }">${dto.product_name }</a></td>
						<td>${dto.payment_num }</td>
						<td>${dto.payment_price }</td>
						<td>${dto.payment_del }</td>
					</tr>
					<c:set var="cnt" value="cnt+1"/>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="5" align="right"><input type="button" value="Home" onclick="location.href='main.do'"/></td>
		</tr>
	</table>
</body>
</html>