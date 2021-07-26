<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>상품 상세페이지</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		function addToBasket(){
			let price = $("#price").text();
			let sale = $("#sale").text();

			if(sale > 0) {
				sale = Math.round(price * (sale / 100));
				price = price - sale;
			}
			
			
			let productVal = {
					"product_no" : "${dto.product_no}",
					"product_name" : "${dto.product_name}",
					"product_price" : sale > 0 ? price : "${dto.product_price}"
			}
			
			$.ajax({
				type: "post",
				url: "addToBasket.do",
				data: JSON.stringify(productVal),
				contentType: "application/json",
				dataType: "json",
				success: function(msg) {
					console.log(msg.result);
					
					if(msg.result == "성공") {
						let redirect = confirm("장바구니에 넣었습니다. 장바구니로 이동하시겠습니까?");
						
						if(redirect) {
							location.href='basket.do';
						}
					}
				},
				error: function() {
					alert("통신 실패!");
				}
			});
		}
	</script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
		<main class="container" style="margin-bottom: 150px;">
			<div class="slider-area">
				<div class="single-slider slider-height2 d-flex align-items-center">
					<div class="container">
						<div class="row">
							<div class="col-xl-12">
								<div class="hero-cap text-center">
									<h2>Product Detail</h2>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	        <div class="product_image_area">
	            <div class="row">
	                <div class="col-md-6">            	
		                <div class="product_img_slide owl-carousel">
		                    <div class="single_product_img">
		                        <img src="resources/assets/img/gallery/gallery01.png" alt="#" class="img-fluid">
		                    </div>
		                    <div class="single_product_img">
		                        <img src="resources/assets/img/gallery/gallery01.png" alt="#" class="img-fluid">
		                    </div>
		                    <div class="single_product_img">
		                        <img src="resources/assets/img/gallery/gallery1.png" alt="#" class="img-fluid">
		                    </div>
		                </div>
		                
	                </div>
	                
	                <div class="col-md-6">
		                <div class="single_product_text mt-3">
		                    <h3>${dto.product_name }</h3>
		                    
		                    <c:choose>
								<c:when test="${dto.product_sale > 0 }">
									<h5 class="ml-2"><del id="price">${dto.product_price }</del>원</h5>
									<h4 class="ml-2 font-weight-bold text-monospace text-danger"><span id="sale">${dto.product_sale }</span>% 할인중!!</h4>
								</c:when>
								<c:otherwise>
									<h5 class="ml-2">${dto.product_price }원</h5>				
								</c:otherwise>
							</c:choose>
		                    
		                    <div class="ml-2">
								<c:choose>
									<c:when test="${rate > 4 }">
									<i class="bi bi-star-fill"></i>
									<i class="bi bi-star-fill"></i>
									<i class="bi bi-star-fill"></i>
									<i class="bi bi-star-fill"></i>
									<i class="bi bi-star-fill"></i>
								</c:when>
								<c:when test="${rate > 3 }">
									<i class="bi bi-star-fill"></i>
									<i class="bi bi-star-fill"></i>
									<i class="bi bi-star-fill"></i>
									<i class="bi bi-star-fill"></i>
									<i class="bi bi-star"></i>
								</c:when>
								<c:when test="${rate > 2 }">
									<i class="bi bi-star-fill"></i>
									<i class="bi bi-star-fill"></i>
									<i class="bi bi-star-fill"></i>
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
								</c:when>
								<c:when test="${rate > 1 }">
									<i class="bi bi-star-fill"></i>
									<i class="bi bi-star-fill"></i>
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
								</c:when>
								<c:when test="${rate > 0 }">
									<i class="bi bi-star-fill"></i>
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
								</c:when>
								<c:when test="${rate == 0 }">
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
								</c:when>
								</c:choose>
							</div>				
		                    
		                    <p class="ml-2">${dto.product_desc }</p>
		                    
		                    <div class="card_area ml-2">
		                    	<c:choose>
		                    		<c:when test="${mDto != null && mDto.member_grade == '일반회원' }">
			                    		<div class="add_to_cart d-flex">
					                        <input class="genric-btn success-border mr-5" type="button" value="장바구니" onclick="addToBasket()" />
					                    
					                    
					                    	<form action="payment.do" method="post">
												<input type="hidden" name="product_no" value="${dto.product_no }" />
												<input type="hidden" name="payment_num" value="1" />
												<fmt:formatNumber type="number" maxFractionDigits="0" value="${dto.product_price * (dto.product_sale / 100) }" var="sale" />
												<input type="hidden" name="payment_price" value="${dto.product_sale > 0 ? (dto.product_price - sale) : dto.product_price }" /> 
												<input type="hidden" name="product_name" value="${dto.product_name }" />
												<input type="hidden" name="type" value="product" />
												
												<input class="genric-btn primary-border" type="submit" value="바로 구매" />
											</form> 
				                    	</div>
		                    		</c:when>
		                    		
		                    		<c:when test="${mDto != null && mDto.member_grade != '일반회원' }">
				                    	<div class="mt-3">
					                    	<a href="store_updateform.do?product_no=${dto.product_no}" class="genric-btn warning circle"><i class="bi bi-pencil-square"></i> 수정</a>
					                    	<a href="store_delete.do?product_no=${dto.product_no}" class="genric-btn danger circle"><i class="bi bi-trash"></i> 삭제</a>
					                    </div>
		                    		</c:when>
		                    	</c:choose>
		                    </div>
		                </div>
	                </div>
	            </div>
	        </div>
	        
	        <div class="comments-area">
				<h4>${rList.size() } Comments</h4>
					
				<c:if test="${rList.size() > 0 }">
					<c:forEach items="${rList }" var="dto">
						<div class="comment-list">
							<div class="single-comment justify-content-between d-flex">
								<div class="user justify-content-start d-flex w-100">
									<div class="thumb">
										<img src="resources/assets/img/comment/comment_1.png" alt="">
									</div>
									<div class="desc">
										<div class="d-md-flex justify-content-between">
											<p class="comment">${dto.review_content }</p>
											<div>${dto.review_rate }</div>
										</div>
										
										<div class="d-flex justify-content-between">
											<div class="d-flex align-items-center">
												<span>
													${dto.member_id }
												</span>
												<p class="date"><fmt:formatDate value="${dto.review_date }" pattern="yyyy/MM/dd hh:mm a"/></p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
			<c:if test="${mDto.member_id != null && mDto.member_grade == '일반회원'}">
				<div class="comment-form">
					<div class="form-group">
						<button onclick="location.href='review_insert_product.do?product_no=${dto.product_no}&product_name=${dto.product_name }'" class="button button-contactForm btn_1 boxed-btn">리뷰 작성하기</button>
					</div>					
				</div>
			</c:if>
		</main>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	
	
	<script src="resources/assets/js/main.js"></script>
</body>
</html>