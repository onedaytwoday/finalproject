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
							<h2>Review Detail</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="comment-form"
		style="padding-left: 60px; padding-right: 60px">
			<div class="row">
				<div class="col-12">
					<div class="form-group">
						<input class="form-control" name="member_id" type="text" value="${dto.member_id }" readonly="readonly">
					</div>
				</div>
				<div class="col-12">
					<div class="form-group">
						<input class="form-control" name="review_title" type="text" value="${dto.review_title }" readonly="readonly">
					</div>
				</div>
				<div class="col-12">
					<div class="form-group">
						<textarea class="form-control w-100" rows="10" cols="60"
							name="board_content" readonly="readonly">${dto.review_content }</textarea>
					</div>
				</div>
				<div class="col-12" style="margin-bottom: 30px;">
					<select name="review_rate">
						<option value="${dto.review_rate }">${dto.review_rate }</option>
					</select>
				</div>
			</div>
			<c:choose>
			<c:when test="${mDto.member_nicname eq dto.member_id }">
			<div class="form-group" align="right">
				<button type="button" class="button button-contactForm btn_1 boxed-btn" onclick="location.href='review_updateform.do?review_no=${dto.review_no}'">Modify</button>
				<button type="button" class="button button-contactForm btn_1 boxed-btn" onclick="location.href='review_delete.do?review_no=${dto.review_no}'">Delete</button>
				<button type="button" class="button button-contactForm btn_1 boxed-btn" onclick="location.href='review_list.do'">Cancle</button>
			</div>
			</c:when>
			</c:choose>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>