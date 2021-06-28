<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	float: right;
}

li {
	display: inline;
	margin-left: 10px;
}
</style>
</head>
<body>
	<header>
		<ul class="login">
			<li><a href="loginform.do">로그인</a></li>
			<li><a href="signup.do">회원가입</a></li>
		</ul>
		<br>

		<ul class="headernav">
			<li><a href="#">로고</a></li>
			<li><a href="#">Home</a></li>
			<li><a href="#">공지사항</a></li>
			<li>
				<select name="class">
						<option value="">클래스</option>
						<option value="cate01">카테고리1</option>
						<option value="cate02">카테고리2</option>
						<option value="cate03">카테고리3</option>
				</select>
			</li>
			<li>
				<select name="shop">
						<option value="">쇼핑</option>
						<option value="cate01">카테고리1</option>
						<option value="cate02">카테고리2</option>
						<option value="cate03">카테고리3</option>
				</select>
			</li>
			<li><a href="#">상품문의</a></li>
			<li><a href="#">수강후기포토</a></li>
		</ul>


	</header>

</body>
</html>