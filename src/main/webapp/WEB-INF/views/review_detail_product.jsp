<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Review Detail</h1>

		<table border="1">
		<tr>
			<th>작성자</th>
			<td>${dto.member_id }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${dto.review_title }</td>
		</tr>
		<tr>
			<th>평점</th>
			<td>${dto.review_rate }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="10" cols="60" readonly="readonly">${dto.review_content }</textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="button" value="수정" onclick="location.href=''"/>
				<input type="button" value="삭제" onclick="location.href=''"/>
				<input type="button" value="목록" onclick="location.href=''"/>
			</td>
		</tr>
	</table>

</body>
</html>