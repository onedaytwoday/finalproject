<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		<h1>수강 클래스 내역</h1>
		<table border="1">
				<col width="50"/>
				<col width="100"/>
				<col width="200"/>
				<col width="200"/>
				<col width="500"/>
				<col width="200"/>	
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>카테고리</th>
					<th>가격</th>
					<th>강사</th>
				</tr>
				
				<c:set var="cnt" value="1"/>
				<c:choose>
					<c:when test="${empty list }">
						<tr><th colspan="6">-----------------등록하신 강의가 없습니다-------------</th></tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list }" var="dto">
							<tr>
								<td>${cnt }</td>
								<td><a href="classDetail.do?class_no=${dto.class_no }">${dto.class_title }</a></td>
								<td>${dto.class_category }</td>
								<td>${dto.class_price } 원</td>
								<td>${dto.member_id }</td>
							</tr>
							<c:set var="cnt" value="cnt+1"/>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<tr>
					<td colspan="6" align="right"><input type="button" value="Home" onclick="location.href='main.do'"/></td>
				</tr>
		</table>
	</main>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>