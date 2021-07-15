<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<table>
<tr><td><input type="button" name="member_update" value="개인정보수정" onclick="location.href='mypage_update.do?member_id=${member_id}'"></td></tr>
<tr><td><input type="button" name="member_payment" value="전체 주문 내역" onclick="location.href='mypage_payment.do?member_id=${member_id}'"></td></tr>
<tr><td><input type="button" name="member_board" value="내가 쓴글" onclick="location.href='mypage_board.do?member_id=${member_id}'"></td></tr>
<tr><td><input type="button" name="member_class" value="수강 클래스 내역" onclick="location.href='mypage_class.do?member_id=${member_id}'"></td></tr>
<tr><td><input type="button" name="member_class" value="회원탈퇴" onclick="delOk()"></td></tr>
</table>
<h1>내가 쓴글</h1>
<table border="1">
		<col width="50"/>
		<col width="100"/>
		<col width="400"/>
		<col width="200"/>
		<col width="200"/>	
		<tr>
			<th>번호</th>
			<th>카테고리</th>
			<th>제목</th>
			<th>조회수</th>
			<th>작성일</th>
		</tr>
		<c:set var="cnt" value="1"/>
		<c:choose>
			<c:when test="${empty list }">
				<tr><th colspan="5">-----------------작성하신 글이 없습니다-------------</th></tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${cnt }</td>
						<td>${dto.board_category }</td>
						<td><a href="board_detail.do?board_no=${dto.board_no }">${dto.board_title }</a></td>
						<td>${dto.board_readcount }</td>
						<td><fmt:formatDate value="${dto.board_date }" pattern="yyyy-MM-dd" /></td>
					</tr>
					<c:set var="cnt" value="cnt+1"/>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="5" align="right"><input type="button" value="Home" onclick="location.href='main.do'"/></td>
		</tr>
	</table>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>