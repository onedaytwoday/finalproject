<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>

</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<jsp:include page="./mypage_menu.jsp"></jsp:include>
<h1>전체 주문 내역</h1>
<table border="1">
		<col width="50"/>
		<col width="70"/>
		<col width="70"/>
		<col width="100"/>
		<col width="100"/>	
		<tr>
			<th>번호</th>
			<th>카테고리</th>
			<th>수량</th>
			<th>총 가격</th>
			<th>배송상태</th>
		</tr>
		
		<c:set var="cnt" value="1"/>
		<c:choose>
			<c:when test="${empty pList }">
				<tr><th colspan="5">-----------------구매하신 상품이 없습니다-------------</th></tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${pList }" var="dto">
					<tr>
						<td>${cnt }</td>
						
						<c:choose>
							<c:when test="${dto.product_no != 0 }">
								<td>상품</td>
							</c:when>
							
							<c:when test="${dto.basket_group != 0 }">
								<td>장바구니</td>
							</c:when>
							
							<c:when test="${dto.detail_no != 0 }">
								<td>클래스</td>
							</c:when>

							<c:otherwise>
								<td>-----</td>
							</c:otherwise>
						</c:choose>
						<td>${dto.payment_num }개</td>
						<td>${dto.payment_price }원</td>
						
						<c:choose>
							<c:when test="${dto.payment_del == '결제완료' }">
								<td><input type="button" onclick="cancelPayment(${dto.payment_no})" value="결제 취소" /></td>
							</c:when>
							
							<c:otherwise>
								<td>${dto.payment_del }</td>
							</c:otherwise>
						</c:choose>
					</tr>
					<c:set var="cnt" value="cnt+1"/>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="5" align="right"><input type="button" value="Home" onclick="location.href='main.do'"/></td>
		</tr>
	</table>
	
	<jsp:include page="/WEB-INF/views/paging.jsp">
		<jsp:param value="payment" name="board_category" />
		<jsp:param value="mypage" name="from" />
		<jsp:param value="${pDto.nowBlock}" name="nowBlock" />
		<jsp:param value="${pDto.blockBegin }" name="blockBegin" />
		<jsp:param value="${pDto.blockEnd }" name="blockEnd" />
		<jsp:param value="${pDto.nowPage}" name="nowPage" />
		<jsp:param value="${pDto.blockBegin}" name="blockBegin" />
		<jsp:param value="${pDto.blockEnd}" name="blockEnd" />
		<jsp:param value="${pDto.totalBlock}" name="totalBlock" />
	</jsp:include>
	
	
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>