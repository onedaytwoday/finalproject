<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<h1>상품 등록</h1>
	<form action="store_insertres.do" method="post">
		<table border="1">
			<tr>
				<th>상품 카테고리</th>
				<td><select name="product_category">
						<option value="cate01">카테고리1</option>
						<option value="cate02">카테고리2</option>
						<option value="cate03">카테고리3</option>
				</select></td>
			</tr>

			<tr>
				<th>상품 사진</th>
				<td><input type="file" name="product_photo" value=""></td>
			</tr>
			<tr>
				<th>상품명</th>
				<td><input type="text" name="product_name" value=""></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" name="product_price" value=""></td>
			</tr>
			<tr>
				<th>할인율</th>
				<td><input type="text" name="product_sale" value=""></td>
			</tr>
			<tr>
				<th>위치</th>
				<td><input type="text" name="product_loc" value=""></td>
			</tr>
			<tr>
				<th>배송 여부</th>
				<td>
					<input type="radio" name="product_del" value="배송가능" />배송가능
				 	<input type="radio" name="product_del" value="배송불가능" />배송불가능
				</td>
			</tr>
			<tr>
				<th>상품 상세 설명</th>
				<td><textarea name="product_desc" rows="10" cols="60"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="등록" />
					<input type="button" value="목록" onclick="location.href='store.do'" />
				</td>
			</tr>
		</table>
	</form>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>