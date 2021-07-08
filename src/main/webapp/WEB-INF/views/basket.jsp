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
<script type="text/javascript">
	function updateBasket(index, basket_no, price, type){
		let basket_num = $("#"+ basket_no).text();
		
		if(type == 'increase') {
			$("#"+ basket_no).text(Number(basket_num) + 1);		
			
		} else if(type == 'decrease') {
			if(basket_num > 0) {
				$("#"+ basket_no).text(Number(basket_num) - 1);			
			} else {
				$("#"+ basket_no).text(0);			
			}
		}
		
		basket_num = $("#"+ basket_no).text();
		
		let basket_price = Number(price * basket_num);
		
		$("#"+basket_no+"_price").text(basket_price+"원");
				
		let basketVal = {
				"basket_no" : Number(basket_no),
				"basket_num" : Number(basket_num),
				"basket_price" : Number(basket_price)
		}

		$.ajax({
			type: "post",
			url: "updateBasket.do",
			data: JSON.stringify(basketVal),
			contentType: "application/json",
			dataType: "json",
			success: function(msg) {
				console.log(msg.result);
			},
			error: function() {
				alert("통신 실패!");
			}
		});
	}
</script>
</head>
<body>
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
							<i onclick="updateBasket(${status.index}, ${dto.basket_no}, ${pList[status.index].product_price},'increase')" class="bi bi-plus-square" style="font-size:1.5rem; margin-right: 0.5rem; cursor:pointer;"></i>
								
								<span id="${dto.basket_no }">${dto.basket_num > 0 ? dto.basket_num : 0}</span>
							
							<i onclick="updateBasket(${status.index}, ${dto.basket_no}, ${pList[status.index].product_price},'decrease')" class="bi bi-dash-square" style="font-size:1.5rem; margin-left: 0.5rem; cursor:pointer;"></i>
						</td>
						<td id="${dto.basket_no }_price">${dto.basket_price > 0 ? dto.basket_price : 0}원</td>
						
						<td><i onclick="location.href='deleteBasket.do?basket_no=${dto.basket_no}'" class="bi bi-trash" style="font-size:1.5rem; cursor:pointer;"></i></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
	</table>
	</div>
	

</body>
</html>