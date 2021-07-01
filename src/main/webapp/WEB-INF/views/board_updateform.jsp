<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>UPDATE</h1>
	
	<form action="board_updateRes.do" method="post">
		<input type="hidden" name="board_no" value="${dto.board_no }" />
		<table border="1">
			<tr>
				<th>작성자</th>
				<td><input type="text" name="member_id" value="${dto.member_id }"
					readonly="readonly" /></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="board_title" value="${dto.board_title }"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="60" name="board_content">${dto.board_content }</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="수정" />
					<input type="button" value="취소" onclick="location.href='board_detail.do?board_no=${dto.board_no}'" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>