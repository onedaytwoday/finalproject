<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 페이지</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<h1>상품 페이지</h1>
	
	<table border="1">
		<col width="50"/>
		<col width="100"/>
		<col width="200"/>
		<col width="200"/>
		<col width="500"/>
		<col width="200"/>
		<col width="100"/>
		
		<tr>
			<th>번호</th>
			<th>상품사진</th>
			<th>배송여부</th>
			<th>카테고리</th>
			<th>상품명</th>
			<th>가격</th>
			<th>평점</th>
		</tr>
		
		<c:choose>
			<c:when test="${empty list }">
				<tr><th colspan="4">-----------------상품이 없습니다-------------</th></tr>
			</c:when>
			<c:otherwise>
				<c:set var="sum" value="0" />
				<c:set var="cnt" value="0" />
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.product_no }</td>
						<td><a href="store_select.do?product_no=${dto.product_no }">상품 사진</a></td>
						<td>${dto.product_del }</td>
						<td>${dto.product_category }</td>
						<td>${dto.product_name }</td>
						<td>${dto.product_price } 원</td>
						<td>
							<c:choose>
								<c:when test="${empty rlist}">
									리뷰없음
								</c:when>
								<c:otherwise>
									<c:forEach items="${rlist }" var="rdto">
										<c:set var="product_no" value="${dto.product_no }" />
										<c:set var="review_no" value="${rdto.product_no }" />
										<c:set var="rate" value="${rdto.review_rate }" />
										<c:if test="${product_no eq review_no}">
											<c:set var="sum" value="${sum + rate }" />
											<c:set var="cnt" value="${cnt + 1 }" />
										</c:if>
									</c:forEach>
									${sum/cnt }
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="7" align="right"><input type="button" value="상품 작성" onclick="location.href='store_insertform.do'"/></td>
		</tr>
		
	</table>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>