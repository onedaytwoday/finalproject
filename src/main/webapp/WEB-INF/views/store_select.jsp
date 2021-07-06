<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세페이지</title>
</head>
<body>

	<h1>상품 상세페이지</h1>

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
		<tr>
			<td colspan="2" align="center"><input type="button" value="장바구니"
				onclick="" /> <input type="button" value="구매" onclick="" /></td>
		</tr>

		<tr>
			<th>상품 상세 설명</th>
			<td><textarea rows="10" cols="60" readonly="readonly">${dto.product_desc }</textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="right"><input type="button" value="수정"
				onclick="location.href='store_updateform.do?product_no=${dto.product_no}'" />
				<input type="button" value="삭제"
				onclick="location.href='store_delete.do?product_no=${dto.product_no}'" />
				<input type="button" value="목록" onclick="location.href='store.do'" />
			</td>
		</tr>
	</table>

</body>
</html>