<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css"
    />  
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>  
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<main class="container">
		<h1 class="my-5">클래스 상세 페이지 </h1>
		
		<div>
			<img class="w-50 h-50" src="resources/upload/f02d2a5d-4165-483f-9904-01d679d6fde3.png" alt="pic" />
			
			<div class="my-2">
				<span>
					<c:set var="sum" value="0" />
					<c:set var="cnt" value="0" />
					<c:choose>
						<c:when test="${empty list}">
							리뷰없음
						</c:when>
						<c:otherwise>
							<c:forEach items="${list }" var="rdto">
								<c:set var="rate" value="${rdto.review_rate }" />
								<c:set var="sum" value="${sum + rate }" />
								<c:set var="cnt" value="${cnt + 1 }" />
							</c:forEach>
							<fmt:parseNumber var="avg" integerOnly="true" value="${sum/rate }"/>
							<c:choose>
								 <c:when test="${avg eq 1 }">
								  	<i class="bi bi-star-fill"></i>
								 </c:when> 
								 <c:when test="${avg > 1 }">
								 	<i class="bi bi-star-fill"></i>
								 	<i class="bi bi-star-fill"></i>
								 </c:when>
								 <c:when test="${avg > 2 }">
								  	<i class="bi bi-star-fill"></i>
								  	<i class="bi bi-star-fill"></i>
								  	<i class="bi bi-star-fill"></i>
								 </c:when>
								 <c:when test="${avg > 3 }">
								  	<i class="bi bi-star-fill"></i>
								  	<i class="bi bi-star-fill"></i>
								  	<i class="bi bi-star-fill"></i>
								  	<i class="bi bi-star-fill"></i>
								 </c:when>
								 <c:otherwise>
								  	<i class="bi bi-star-fill"></i>
								  	<i class="bi bi-star-fill"></i>
								  	<i class="bi bi-star-fill"></i>
								  	<i class="bi bi-star-fill"></i>
								  	<i class="bi bi-star-fill"></i>
								 </c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</span>
			</div>
			
			<h3>${dto.class_title }</h3>
			
			<hr />
			
			<p class="my-3">${dto.class_desc }</p>
			
			<p>주소 : ${dto.class_loc }</p>
			
			<p>가격 : ${dto.class_price }원</p>
			
			<button onclick="location.href='classList.do'" type="button" class="btn btn-secondary">클래스 목록 보기</button>
			
			<c:if test="${dto.member_id eq mDto.member_id }">
				<button onclick="location.href='classUpdate.do?class_no=${dto.class_no}'" type="button" class="btn btn-warning">수정</button>								
			</c:if>
		</div>
		
		<jsp:include page="class_calendar.jsp"></jsp:include>
		
		<!-- 결제하기 -->
		<c:if test="${mDto.member_id != null}">
			<form class="mt-3" action="payment.do" method="post">					
				<input type="hidden" name="detail_no" />
				<input type="hidden" name="payment_num" value="1" />
				<input type="hidden" name="payment_price" value="${dto.class_price }" />
				<input type="hidden" name="product_name" value="${dto.class_title }" />
				<input type="hidden" name="type" value="class" />
					
				<input style="border:none; outline:none;" type="text" name="detail_date" readonly />
				<button type="submit" class="btn btn-primary">결제하기</button>
				<button onclick="location.href='review_insert_class.do?class_no=${dto.class_no}&class_title=${dto.class_title }'" type="button">리뷰작성</button>
			</form>
		</c:if>
	</main>

	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>	
</body>
</html>