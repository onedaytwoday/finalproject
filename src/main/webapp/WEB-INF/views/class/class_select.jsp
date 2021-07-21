<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/assets/css/flaticon.css">
<link rel="stylesheet" href="resources/assets/css/slicknav.css">
<link rel="stylesheet" href="resources/assets/css/animate.min.css">
<link rel="stylesheet" href="resources/assets/css/magnific-popup.css">
<link rel="stylesheet"
	href="resources/assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="resources/assets/css/themify-icons.css">
<link rel="stylesheet" href="resources/assets/css/slick.css">
<link rel="stylesheet" href="resources/assets/css/nice-select.css">
<link rel="stylesheet" href="resources/assets/css/style.css">

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<main class="container">
		<div class="mb-4 text-white rounded bg-dark">
			<div class="col-md-6 px-0">
				<img class="w-full image-fluid" alt="class" src="resources/images/event.jpg">
			</div>
		</div>

		<div class="row g-5">
			<div class="col-md-7">
				<h3 class="pb-4 mb-4 border-bottom">${dto.class_title }</h3>

				<article class="blog-post">
					<h4 class="blog-post-title">
						<span> <c:set var="sum" value="0" /> <c:set var="cnt" value="0" /> 
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
									<fmt:parseNumber var="avg" integerOnly="true"
										value="${sum/rate }" />
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
					</h4>

					<p class="my-3">${dto.class_desc }</p>

					<p>주소 : ${dto.class_loc }</p>

					<p>가격 : ${dto.class_price }원</p>

					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam
						at convallis dui, ut convallis neque. Nunc sollicitudin sem diam,
						vitae maximus dolor pretium sed. Cras viverra justo ac elit
						consectetur, tincidunt lobortis massa interdum. Mauris fermentum
						in odio pretium posuere. Nullam commodo sapien in diam eleifend,
						nec gravida lacus tincidunt. Nulla ut rhoncus elit, vel aliquam
						nulla. Vestibulum congue maximus nisl, blandit blandit turpis
						efficitur quis. Praesent dapibus feugiat justo at mollis. Nunc
						nunc neque, vehicula sed magna ac, sollicitudin sodales lacus.
						Maecenas id nunc quis arcu faucibus tincidunt eget nec odio. Duis
						suscipit faucibus mi, at dapibus nisi venenatis eu. Ut diam
						tellus, porta nec auctor a, imperdiet quis nisl. Pellentesque
						habitant morbi tristique senectus et netus et malesuada fames ac
						turpis egestas. Proin vitae odio id nisl aliquam pellentesque quis
						sit amet tellus. Nam in feugiat nibh. In sodales mi tortor, non
						accumsan nunc sodales accumsan.</p>


					<button onclick="location.href='classList.do?nowPage=1'" type="button"
						class="btn btn-secondary">클래스 목록 보기</button>

					<c:if test="${dto.member_id eq mDto.member_id }">
						<button
							onclick="location.href='classUpdate.do?class_no=${dto.class_no}'"
							type="button" class="btn btn-warning">수정</button>
					</c:if>

				</article>

				<div class="comments-area">
					<h4>05 Comments</h4>
					<div class="comment-list">
						<div class="single-comment justify-content-between d-flex">
							<div class="user justify-content-between d-flex">
								<div class="thumb">
									<img src="resources/assets/img/comment/comment_1.png" alt="">
								</div>
								<div class="desc">
									<p class="comment">Multiply sea night grass fourth day sea
										lesser rule open subdue female fill which them Blessed, give
										fill lesser bearing multiply sea night grass fourth day sea
										lesser</p>
									<div class="d-flex justify-content-between">
										<div class="d-flex align-items-center">
											<h5>
												<a href="#">Emilly Blunt</a>
											</h5>
											<p class="date">December 4, 2017 at 3:12 pm</p>
										</div>
										<div class="reply-btn">
											<a href="#" class="btn-reply text-uppercase">reply</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="comment-list">
						<div class="single-comment justify-content-between d-flex">
							<div class="user justify-content-between d-flex">
								<div class="thumb">
									<img src="resources/assets/img/comment/comment_2.png" alt="">
								</div>
								<div class="desc">
									<p class="comment">Multiply sea night grass fourth day sea
										lesser rule open subdue female fill which them Blessed, give
										fill lesser bearing multiply sea night grass fourth day sea
										lesser</p>
									<div class="d-flex justify-content-between">
										<div class="d-flex align-items-center">
											<h5>
												<a href="#">Emilly Blunt</a>
											</h5>
											<p class="date">December 4, 2017 at 3:12 pm</p>
										</div>
										<div class="reply-btn">
											<a href="#" class="btn-reply text-uppercase">reply</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="comment-list">
						<div class="single-comment justify-content-between d-flex">
							<div class="user justify-content-between d-flex">
								<div class="thumb">
									<img src="resources/assets/img/comment/comment_3.png" alt="">
								</div>
								<div class="desc">
									<p class="comment">Multiply sea night grass fourth day sea
										lesser rule open subdue female fill which them Blessed, give
										fill lesser bearing multiply sea night grass fourth day sea
										lesser</p>
									<div class="d-flex justify-content-between">
										<div class="d-flex align-items-center">
											<h5>
												<a href="#">Emilly Blunt</a>
											</h5>
											<p class="date">December 4, 2017 at 3:12 pm</p>
										</div>
										<div class="reply-btn">
											<a href="#" class="btn-reply text-uppercase">reply</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="comment-form">
					
						<div class="form-group">
							<button type="submit"
								class="button button-contactForm btn_1 boxed-btn">Send
								Message</button>
						</div>
					
				</div>
			</div>

			<div class="col-md-5">
				<div class="position-sticky" style="top: 5rem;">
					<div class="p-4 mb-3 bg-light rounded">
						<jsp:include page="class_calendar.jsp"></jsp:include>

						<c:if
							test="${mDto.member_id != null && mDto.member_grade == '일반회원'}">
							<form class="mt-3" action="payment.do" method="post">
								<input type="hidden" name="detail_no" /> <input type="hidden"
									name="payment_num" value="1" /> <input type="hidden"
									name="payment_price" value="${dto.class_price }" /> <input
									type="hidden" name="product_name" value="${dto.class_title }" />
								<input type="hidden" name="type" value="class" /> 
								
								<input style="border: none; outline: none;" type="text" name="detail_date" readonly />
								<button type="submit" class="btn btn-primary">결제하기</button>
								<button
									onclick="location.href='review_insert_class.do?class_no=${dto.class_no}&class_title=${dto.class_title }'"
									type="button">리뷰작성</button>
							</form>
						</c:if>
					</div>
				</div>
			</div>

		</div>
	</main>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>