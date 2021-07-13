<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="resources/js/basket.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div>
		<h1>장바구니</h1>
		
		<table border="1">
			<col width="100" />
			<col width="100" />
			<col width="150" />
			<col width="100" />
			<tr>
				<th>상품</th>
				<th>상품명</th>
				<th>수량</th>
				<th>가격</th>
				<th></th>
			</tr>
			<c:choose>
				<c:when test="${empty bList }">
					<tr>
						<th colspan="4">------------장바구니가 비었습니다.------------</th>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${bList }" var="dto" varStatus="status">
						<tr>
							<td>상품사진</td>
							<td><a href="store_select.do?product_no=${pList[status.index].product_no }">${pList[status.index].product_name }</a></td>
							<td>
								<i onclick="updateBasket(${dto.basket_no}, ${pList[status.index].product_price},'increase')" class="bi bi-plus-square" style="font-size:1.5rem; margin-right: 0.5rem; cursor:pointer;"></i>
									
									<span id="${dto.basket_no }">${dto.basket_num > 0 ? dto.basket_num : 0}</span>
								
								<i onclick="updateBasket(${dto.basket_no}, ${pList[status.index].product_price},'decrease')" class="bi bi-dash-square" style="font-size:1.5rem; margin-left: 0.5rem; cursor:pointer;"></i>
							</td>
							<td id="${dto.basket_no }_price">${dto.basket_price > 0 ? dto.basket_price : 0}원</td>
							
							<td><i onclick="location.href='deleteBasket.do?basket_no=${dto.basket_no}'" class="bi bi-trash" style="font-size:1.5rem; cursor:pointer;"></i></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	
		<div style="border: 1px solid lightgray; width: fit-content; margin-top: 2rem; padding: 2rem;">
			<h3>Total</h3>
			
			<form action="payment.do" method="post" style="display:flex; flex-direction:column;">
				<p style="margin-bottom: 1rem;">총 수량 : <input type="text" id="total_num" name="payment_num" readonly /></p> 
				<p style="margin-bottom: 1rem;">총 가격 : <input type="text" id="total_price" name="payment_price" readonly />원</p>
				
				<input type="hidden" name="basket_group" value="${basket_group }" />
				<input type="hidden" name="name" value="장바구니에서 구매" />
				<input type="hidden" name="type" value="basket" />
				
				<input type="submit" value="결제 하기" />
			</form>
		</div>
	</div>
	
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>