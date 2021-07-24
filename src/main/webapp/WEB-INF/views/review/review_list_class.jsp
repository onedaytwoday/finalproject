<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>	
	
	<main class="container">
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
							<td><a href="review_detail_class.do?review_no=${dto.review_no }">${dto.review_title }</a></td>
							<td>${dto.review_date }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
	
		</table>
					<jsp:include page="/WEB-INF/views/paging.jsp">
						<jsp:param value="R" name="review_catagory" />
						<jsp:param value="${pDto.nowBlock}" name="nowBlock" />
						<jsp:param value="${pDto.blockBegin }" name="blockBegin" />
						<jsp:param value="${pDto.blockEnd }" name="blockEnd" />
						<jsp:param value="${pDto.nowPage}" name="nowPage" />
						<jsp:param value="${pDto.blockBegin}" name="blockBegin" />
						<jsp:param value="${pDto.blockEnd}" name="blockEnd" />
						<jsp:param value="${pDto.totalBlock}" name="totalBlock" />
					</jsp:include>
			
	</main>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>