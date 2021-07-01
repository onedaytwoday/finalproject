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

	<h1>INSERT</h1>

	<form action="board_insertRes.do" method="post">
		카테고리 : <select name="board_category">
			<c:choose>
				<c:when test="${board_category eq 'N' }">
					<option  value="N" selected="selected">공지사항</option>
				</c:when>
				<c:when test="${board_category eq 'Q' }">
					<option value="Q" selected="selected">상품문의</option>
				</c:when>
			</c:choose>
		</select>
		<input type="hidden" name="member_id" value="${mDto.member_id }" />
		<table border="1">
			<tr>
				<th>제목</th>
				<td><input type="text" name="board_title" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="60" name="board_content"></textarea></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" size="4" name="board_pw" /></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="글작성" />
					<input type="button" value="취소" onclick="">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>