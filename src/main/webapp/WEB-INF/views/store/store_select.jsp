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
<link rel="stylesheet" href="resources/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="resources/assets/css/owl.carousel.min.css">
	<link rel="stylesheet" href="resources/assets/css/flaticon.css">
    <link rel="stylesheet" href="resources/assets/css/slicknav.css">
    <link rel="stylesheet" href="resources/assets/css/animate.min.css">
    <link rel="stylesheet" href="resources/assets/css/magnific-popup.css">
    <link rel="stylesheet" href="resources/assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="resources/assets/css/themify-icons.css">
    <link rel="stylesheet" href="resources/assets/css/slick.css">
    <link rel="stylesheet" href="resources/assets/css/nice-select.css">
    <link rel="stylesheet" href="resources/assets/css/style.css">

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
		<h1>상품 상세페이지</h1>
		<div class="product_image_area">
            <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-12">
                <div class="product_img_slide owl-carousel">
                    <div class="single_product_img">
                        <img src="resources/assets/img/gallery/gallery1.png" alt="#" class="img-fluid">
                    </div>
                    <div class="single_product_img">
                        <img src="resources/assets/img/gallery/gallery01.png" alt="#" class="img-fluid">
                    </div>
                    <div class="single_product_img">
                        <img src="resources/assets/img/gallery/gallery1.png" alt="#" class="img-fluid">
                    </div>
                </div>
                </div>
             </div>
             </div>
        </div>
		<table border="1">
			<tr>
				<th>상품 사진</th>
				<td>상품 사진</td>
			</tr>
			<tr>
				<th>상품명</th>
				<td>${dto.product_name }</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>${dto.product_price }</td>
			</tr>
			<tr>
				<th>유효기간</th>
				<td>2021/07/30</td>
			</tr>
			<tr>
				<th>평점</th>
				<td>
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
							${avg }
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			
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
				<th>상품 상세 설명</th>
				<td><textarea rows="10" cols="60" readonly="readonly">${dto.product_desc }</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="button" value="수정"
					onclick="location.href='store_updateform.do?product_no=${dto.product_no}'" />
					<input type="button" value="삭제"
					onclick="location.href='store_delete.do?product_no=${dto.product_no}'" />
					<input type="button" value="목록" onclick="location.href='store.do?nowPage=1'" />
					<button onclick="location.href='review_insert_product.do?product_no=${dto.product_no}&product_name=${dto.product_name }'" type="button">리뷰작성</button>
				</td>
			</tr>
		</table>
	</main>
	<script src="resources/assets/js/main.js"></script>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>