<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="classUpdateRes.do" method="post">
		<table border="1">
			<tr>
				<th>계정 ID</th>
				<td><input type="text" name="member_id" value="${dto.member_id}" readonly /></td>
			</tr>
			
			<tr>
				<th>클래스 명</th>
				<td><input type="text" name="class_title" value="${dto.class_title }" /></td>
			</tr>
			
			<tr>
				<th>클래스 설명</th>
				<td><textarea rows="10" cols="60" name="class_desc">${dto.class_desc }</textarea></td>
			</tr>
			
			<tr>
				<th>클래스 위치</th>
				<td><input type="text" name="class_loc" value="${dto.class_loc }" /></td>
			</tr>
			
			<tr>
				<th>카테고리</th>
				<td><input type="text" name="class_category" value="${dto.class_category }"  readonly /></td>
			</tr>
			
			<tr>
				<th>클래스 가격</th>
				<td><input type="text" name="class_price" value="${dto.class_price }" /></td>
			</tr>
			
			<tr>
				<th>할인율</th>
				<td><input type="text" name="class_sale" value="${dto.class_sale }" /></td>
			</tr>
			
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="수정하기" />
					<input type="button" value="취소" onclick="location.href='classDetail.do?class_no=${dto.class_no}'" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>