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
		<col width="10"/>
		<col width="100"/>
		<col width="100"/>
		<col width="200"/>
		<col width="100"/>
		<tr>
			<th>room번호</th>
			<th>아이디</th>
			<th>마지막 채팅</th>
			<th>마지막 시간</th>
			<th>채팅방 삭제</th>
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
						<td><a href="chat_room.do?member_id=${dto.consult_id }">${dto.room_no }</a></td>
						<td>${dto.consult_id }</td>
						<td>${dto.room_content }</td>
						<td>${dto.room_con_date }</td>	
						<td><a href="chat_delete.do?room_no=${dto.room_no }">나가기</a></td>	
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>
