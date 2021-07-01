<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<td>★ ★ ★</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="장바구니" onclick=""/>
				<input type="button" value="구매" onclick=""/>
			</td>
		</tr>
		
		<tr>
			<th>상품 상세 설명</th>
			<td><textarea rows="10" cols="60" readonly="readonly">${dto.product_desc }</textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="button" value="수정" onclick="location.href='store_updateform.do?product_no=${dto.product_no}'"/>
				<input type="button" value="삭제" onclick="location.href='store_delete.do?product_no=${dto.product_no}'"/>
				<input type="button" value="목록" onclick=""/>
			</td>
		</tr>
	</table>

</body>
</html>