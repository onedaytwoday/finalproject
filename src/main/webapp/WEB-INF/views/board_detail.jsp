<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>Detail</h1>
	
	<table border="1">
		<tr>
			<th>작성자</th>
			<td>${dto.member_id }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${dto.board_title }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="10" cols="60" readonly="readonly">${dto.board_content }</textarea></td>
		</tr>
		<tr>
			<td colspan="3" align="right">
				<input type="button" value="수정" onclick="location.href='board_updateform.do?board_no=${dto.board_no}'" />
				<input type="button" value="삭제" onclick="location.href='board_delete.do?board_no=${dto.board_no}&board_category=${board_category}'" />
				<input type="button" value="목록" onclick="location.href='board_list.do?board_category=${dto.board_category}'" />
			</td>
		</tr>
	</table>
</body>
</html>