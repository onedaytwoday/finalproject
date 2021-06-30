<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>공지사항</h1>

	<table border="1">
		<col width="50" />
		<col width="100" />
		<col width="500" />
		<col width="50" />
		<col width="100" />
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>조회수</th>
			<th>작성일</th>
		</tr>
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<th colspan="5">------------작성된 글이 없습니다------------</th>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.board_notice_no }</td>
						<td>${dto.member_id }</td>
						<td><a href="#">${dto.board_title }</a></td>
						<td>${dto.board_readcount }</td>
						<td>
							<fmt:formatDate value="${dto.board_date }" pattern="yyyy-MM-dd" />
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="5" align="right">
				<input type="button" value="글작성" onclick="location.href='board_insertform.do?board_category=N'" />
			</td>
		</tr>
	</table>
</body>
</html>