<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>${cDto.class_title }(${cDto.class_no }) 리뷰 작성</h1>
		<form action="review_insertres.do" method="post">
		<input type="hidden" name="class_no_str" value="${cDto.class_no }">
		<table border="1">
			<tr>
				<th>ID</th>
				<td><input type="text" name="member_id"value="${mDto.member_id}" readonly /></td>
			</tr>

			<tr>
				<th>제목</th>
				<td><input type="text" name="review_title" /></td>
			</tr>
			<tr>
				<th>평점</th>
				<td><input type="text" name="review_rate" /></td>
			</tr>
					
			<tr>
				<th>작성내용</th>
				<td><textarea rows="10" cols="60" name="review_content"></textarea></td>
			</tr>
		</table>

		<input type="submit" value="리뷰등록"/>
		<input type="button" value="취소" onclick="location.href='classDetail.do?class_no=${cDto.class_no }'" />
	</form>
</body>
</html>