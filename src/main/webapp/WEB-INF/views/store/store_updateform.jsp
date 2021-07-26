<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>상품 수정</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<div class="slider-area" style="margin-bottom: 150px;">
		<div class="single-slider slider-height2 d-flex align-items-center">
			<div class="container">
				<div class="row">
					<div class="col-xl-12">
						<div class="hero-cap text-center">
							<h2>Product Update</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="comment-form"
		style="padding-left: 60px; padding-right: 60px">
		<form class="form-contact comment_form" action="store_updateres.do" method="post" id="store_updateres">
			<input type="hidden" name="product_no" value="${dto.product_no } ">
			<div class="row">
				<div class="col-4" style="margin-bottom: 30px;">
					<select name="product_category" class="product_category">
						<c:choose>
						<c:when test="${dto.product_category eq 'cate01' }">
							<option value="cate01" selected="selected">카테고리1</option>
							<option value="cate02">카테고리2</option>
							<option value="cate03">카테고리3</option>
						</c:when>
						<c:when test="${dto.product_category eq 'cate02' }">
							<option value="cate01">카테고리1</option>
							<option value="cate02" selected="selected">카테고리2</option>
							<option value="cate03">카테고리3</option>
						</c:when>
						<c:when test="${dto.product_category eq 'cate03' }">
							<option value="cate01">카테고리1</option>
							<option value="cate02">카테고리2</option>
							<option value="cate03" selected="selected">카테고리3</option>
						</c:when>
						</c:choose>
					</select>
				</div>
				<div class="col-4" style="margin-bottom: 30px;">
					<select name="product_del">
						<c:choose>
							<c:when test="${dto.product_del eq '배송가능' }">
							<option value="배송가능" selected="selected">배송가능</option>
							<option value="배송불가능">배송불가능</option>
							</c:when>
							<c:when test="${dto.product_del eq '배송불가능' }">
							<option value="배송가능">배송가능</option>
							<option value="배송불가능" selected="selected">배송불가능</option>
							</c:when>
						</c:choose>
						
						
					</select>
				</div>
				<div class="col-12">
					<div class="form-group">
						<input class="form-control" name="product_name" type="text"
							value="${dto.product_name }">
					</div>
				</div>
				<div class="col-12">
					<div class="form-group">
						<input class="form-control" name="product_price" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" type="text"
							value="${dto.product_price }">
					</div>
				</div>
				<div class="col-12">
					<div class="form-group">
						<input class="form-control" name="product_sale"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" type="text"
							value="${dto.product_sale }">
					</div>
				</div>
				<div class="col-12">
					<div class="form-group">
						<input class="form-control" name="product_loc" type="text"
							value="${dto.product_loc }">
					</div>
				</div>
				<div class="col-12">
					<div class="form-group">
						<textarea class="form-control w-100" rows="10" cols="60"
							name="product_desc">${dto.product_desc }</textarea>
					</div>
				</div>
			</div>
			<div class="form-group" align="right">
				<button type="submit" class="button button-contactForm btn_1 boxed-btn" form="store_updateres">Send</button>
				<button type="button" class="button button-contactForm btn_1 boxed-btn" onclick="location.href='store_select.do?product_no=${dto.product_no }'">Cancle</button>
			</div>
		</form>
	</div>
	
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>