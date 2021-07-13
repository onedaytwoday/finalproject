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
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<h1 class="my-5">클래스 목록</h1>

		<section class="p-5">
			<div class="container">
				<div class="row text-center g-4">
					<c:choose>
						<c:when test="${empty list }">
							<p>--------등록된 클래스가 없습니다.---------</p>
						</c:when>

						<c:otherwise>
							<c:forEach items="${list }" var="dto">

								<div class="col-md">
									<div class="card bg-dark text-light">
										<div class="card-body text-center">
											<div class="h1 mb-3">
												<i class="bi bi-laptop"></i>
											</div>

											<h3 class="card-title mb-3">${dto.class_title }</h3>

											<p class="card-text">작성자 : ${dto.member_id }</p>

											<a href="classDetail.do?class_no=${dto.class_no }"
												class="btn btn-primary">자세히 보기</a>

											<c:if test="${dto.member_id eq mDto.member_id }">
												<button
													onclick="location.href='classDelete.do?class_no=${dto.class_no}'"
													type="button" class="btn btn-warning">삭제</button>
											</c:if>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</section>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>