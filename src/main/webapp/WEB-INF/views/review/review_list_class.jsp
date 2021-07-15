<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<h1>REVIEW LIST(CLASS)</h1>
	
	<table border="1">
		<col width="50"/>
		<col width="70"/>
		<col width="200"/>
		<col width="230"/>
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>작성일</th>
		</tr>
		<c:choose>
			<c:when test="${empty list }">
				<<tr><th colspan="4">--------리뷰가 없습니다---------</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.review_no }</td>
						<td>${dto.member_id }</td>
						<td><a href="reviewDetail.do?review_no=${dto.review_no }">${dto.review_title }</a></td>
						<td>${dto.review_date }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>

	</table>	

	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>