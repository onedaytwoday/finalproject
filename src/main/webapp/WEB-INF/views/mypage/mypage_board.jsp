<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>My Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	
	<main class="container">
		<jsp:include page="./mypage_menu.jsp"></jsp:include>
	
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
	</main>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>