<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
</head>
<body>

	<div class="container">
		<h1 class="my-5">클래스 상세 페이지 </h1>
		
		<div>
			<img class="w-50 h-50" src="https://images.unsplash.com/photo-1490750967868-88aa4486c946?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80" alt="pic" />
			
			<div class="my-2">
				<span>
					<i class="bi bi-star-fill"></i>
					<i class="bi bi-star-fill"></i>
					<i class="bi bi-star-fill"></i>
					<i class="bi bi-star-fill"></i>
					<i class="bi bi-star-fill"></i>
				</span>
			</div>
			
			<h3>${dto.class_title }</h3>
			
			<hr />
			
			<p class="my-3">${dto.class_desc }</p>
			
			<p>주소 : ${dto.class_loc }</p>
			
			<p>가격 : ${dto.class_price }원</p>
			
			<p>모집인원 : ${dto.class_member_num }명</p>
			
			<button onclick="location.href='classList.do'" type="button" class="btn btn-secondary">클래스 목록 보기</button>
			
			<c:if test="${dto.member_id eq mDto.member_id }">
				<button onclick="location.href='classUpdate.do?class_no=${dto.class_no}'" type="button" class="btn btn-warning">수정</button>								
			</c:if>
		</div>
		
		<!-- TODO: Calendar 추가 / 날짜 & 시간대 선택할 수 있어야 함 -->
		
		
		
		<!-- 결제하기 -->
		<c:choose>
			<c:when test="${mDto.member_id != null && checkPaid == false}">
				<form class="mt-3" action="payment.do" method="post">
					<input type="hidden" name="member_id" value="${mDto.member_id }" />
					<input type="hidden" name="class_no" value="${dto.class_no }" />
					<input type="hidden" name="class_title" value="${dto.class_title }" />
					<input type="hidden" name="class_price" value="${dto.class_price }" />
					
					<button type="submit" class="btn btn-primary">결제하기</button>
				</form>
			</c:when>
			
			<c:when test="${mDto.member_id != null && checkPaid == true}">
				<button class="btn btn-warning">결제 취소</button>
			</c:when>
		</c:choose>
		
	</div>

	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
		
</body>
</html>