<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>title</title>
<meta charset="UTF-8" />
</head>
<body>
	<jsp:include page="chat_menu.jsp"></jsp:include>
	
	<table border="1">
		<col width="50"/>
		<col width="100"/>
		<col width="100"/>
		<col width="50"/>
		<tr>
			<th>ROOM_NO</th>
			<th>ID</th>
			<th>ROOM_CONTENT</th>
			<th>ROOM_DATE</th>
		</tr>
		<c:choose>
			<c:when test="${empty roomlist }">
				<tr>
					<th colspan="4">--------기존 채팅방이 없습니다--------</th>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${roomlist }" var="dto">
					<tr>
						<td><a href="#">${dto.room_no }</a></td>
						<td>${dto.consult_id }</td>
						<td>${dto.room_content }</td>
						<td><fmt:formatDate value="${dto.room_date }" pattern="yyyy-MM-dd" /></td>	
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>
