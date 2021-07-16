<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>상품 수정</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	
	<main class="container">
		<h1>상품 수정</h1>
		
		<form action="store_updateres.do" method="post">
			<input type="hidden" name="product_no" value="${dto.product_no } ">
			<table border="1">
				<tr>
					<th>상품 카테고리</th>
					<td>
						<select name="product_category">
								<option value="cate01">카테고리1</option>
								<option value="cate02">카테고리2</option>
								<option value="cate03">카테고리3</option>
						</select>
					</td>
				</tr>
	
				<tr>
					<th>상품 사진</th>
					<td><input type="file" name="product_photo" value=""></td>
				</tr>
				<tr>
					<th>상품명</th>
					<td><input type="text" name="product_name" value="${dto.product_name }"></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="text" name="product_price" value="${dto.product_price }"></td>
				</tr>
				<tr>
					<th>할인율</th>
					<td><input type="text" name="product_sale" value="${dto.product_sale }"></td>
				</tr>
				<tr>
					<th>위치</th>
					<td><input type="text" name="product_loc" value="${dto.product_loc }"></td>
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
					<td><textarea name="product_desc" rows="10" cols="60" >${dto.product_desc }</textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="수정" />
						<input type="button" value="뒤로가기" onclick="location.href='store_select.do?product_no=${dto.product_no }'" />
					</td>
				</tr>
			</table>
		</form>
	</main>
	
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>