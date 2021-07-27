<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<div class="slider-area">
		<div class="single-slider slider-height2 d-flex align-items-center">
			<div class="container">
				<div class="row">
					<div class="col-xl-12">
						<div class="hero-cap text-center">
							<h2>Modify</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="comment-form"
		style="padding-left: 60px; padding-right: 60px">
		<form class="form-contact comment_form" action="review_updateRes.do" method="post" id="review_updateRes">
		<input type="hidden" name="review_no" value="${dto.review_no }" />
			<div class="row">
				<div class="col-12">
					<div class="form-group">
						<input class="form-control" type="text" name="member_id" value="${dto.member_id }" readonly="readonly">
					</div>
				</div>
				<div class="col-12">
					<div class="form-group">
						<input class="form-control" name="review_title" type="text" value="${dto.review_title }">
					</div>
				</div>
				<div class="col-12">
					<div class="form-group">
						<textarea class="form-control w-100" rows="10" cols="60"
							name="review_content">${dto.review_content }</textarea>
					</div>
				</div>
				<div class="col-12" style="margin-bottom: 30px;">
					<select name="review_rate">
						<option value="1">1.0</option>
						<option value="2">2.0</option>
						<option value="3">3.0</option>
						<option value="4">4.0</option>
						<option value="5" selected="selected">5.0</option>
					</select>
				</div>
			</div>
			<div class="form-group" align="right">
				<button type="submit" class="button button-contactForm btn_1 boxed-btn" form="review_updateRes">Send</button>
				<button type="button" class="button button-contactForm btn_1 boxed-btn" onclick="location.href='review_detail.do?review_no=${dto.review_no}'">Cancle</button>
			</div>
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>