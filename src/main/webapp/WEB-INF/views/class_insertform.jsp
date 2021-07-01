<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="classInsertRes.do" method="post">
		<table border="1">
			<tr>
				<th>계정 ID</th>
				<td><input type="text" name="member_id" value="${mDto.member_id}" readonly /></td>
			</tr>
			
			<tr>
				<th>클래스 명</th>
				<td><input type="text" name="class_title" /></td>
			</tr>
			
			<tr>
				<th>클래스 설명</th>
				<td><textarea rows="10" cols="60" name="class_desc"></textarea></td>
			</tr>
			
			<tr>
				<th>클래스 위치</th>
				<td><input type="text" name="class_loc" /></td>
			</tr>
			
			<tr>
				<th>카테고리</th>
				<td><input type="text" name="class_category" /></td>
			</tr>
			
			<tr>
				<th>모집인원</th>
				<td><input type="text" name="class_member_num" /></td>
			</tr>
			
			<tr>
				<th>클래스 가격</th>
				<td><input type="text" name="class_price" /></td>
			</tr>
			
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="등록하기" />
					<input type="button" value="취소" onclick="location.href='main.do'" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>