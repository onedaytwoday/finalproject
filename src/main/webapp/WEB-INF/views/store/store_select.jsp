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
			let productVal = {
					"product_no" : "${dto.product_no}",
					"product_name" : "${dto.product_name}",
					"product_price" : "${dto.product_price}"
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
	
		<main class="container">
	        <div class="mt-100">
	            <div class="row">
	                <div class="col-md-6">
	                	<div class="single_product_img">
		                	<img src="resources/assets/img/gallery/gallery01.png" alt="#" class="img-fluid">
		                </div>
	                	<%-- 
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
		                --%>
	                </div>
	                
	                <div class="col-md-6">
		                <div class="single_product_text mt-3">
		                    <h3>${dto.product_name }</h3>
		                    <h5 class="ml-2">${dto.product_price }원</h5>
		                    
		                    <div class="ml-2">
								<c:choose>
									<c:when test="${rate == 0 }">
										<i class="bi bi-star"></i>
										<i class="bi bi-star"></i>
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
									
									<c:when test="${rate > 1 }">
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star"></i>
										<i class="bi bi-star"></i>
										<i class="bi bi-star"></i>
									</c:when>
									
									<c:when test="${rate > 2 }">
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star"></i>
										<i class="bi bi-star"></i>
									</c:when>
									
									<c:when test="${rate > 3 }">
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star"></i>
									</c:when>
									
									<c:when test="${rate > 4 }">
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
										<i class="bi bi-star-fill"></i>
									</c:when>
								</c:choose>
							</div>				
		                    
		                    <p class="ml-2">${dto.product_desc }</p>
		                    
		                    <div class="card_area ml-2">
			                    <div class="add_to_cart d-flex">
			                        <input class="genric-btn success-border mr-5" type="button" value="장바구니" onclick="addToBasket()" />
			                    
			                    
			                    	<form action="payment.do" method="post">
										<input type="hidden" name="product_no" value="${dto.product_no }" />
										<input type="hidden" name="payment_num" value="1" />
										<input type="hidden" name="payment_price" value="${dto.product_price }" />
										<input type="hidden" name="product_name" value="${dto.product_name }" />
										<input type="hidden" name="type" value="product" />
										
										<input class="genric-btn primary-border" type="submit" value="바로 구매" />
									</form> 
			                    </div>
		                    </div>
		                </div>
	                </div>
	            </div>
	        </div>

	
	
	
		
			<%-- 
			<c:if test="${mDto.member_id != null }">
				<tr>
					<td colspan="2" align="center">
						<div style="display:flex; justify-content:space-evenly;">
							<input type="button" value="장바구니" onclick="addToBasket()" />
						
						
							<form action="payment.do" method="post">
								<input type="hidden" name="product_no" value="${dto.product_no }" />
								<input type="hidden" name="payment_num" value="1" />
								<input type="hidden" name="payment_price" value="${dto.product_price }" />
								<input type="hidden" name="product_name" value="${dto.product_name }" />
								<input type="hidden" name="type" value="product" />
								
								<input type="submit" value="바로 구매" />
							</form> 
						</div>
						
					</td>
				</tr>
			</c:if>
			
	
			
			<tr>
				<td colspan="2" align="right"><input type="button" value="수정"
					onclick="location.href='store_updateform.do?product_no=${dto.product_no}'" />
					<input type="button" value="삭제"
					onclick="location.href='store_delete.do?product_no=${dto.product_no}'" />
					<input type="button" value="목록" onclick="location.href='store.do?nowPage=1'" />
					<button onclick="location.href='review_insert_product.do?product_no=${dto.product_no}&product_name=${dto.product_name }'" type="button">리뷰작성</button>
				</td>
			</tr>
		--%>
	</main>
	
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	
	
</body>
</html>