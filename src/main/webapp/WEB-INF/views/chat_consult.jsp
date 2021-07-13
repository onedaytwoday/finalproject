<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<col width="10"/>
		<col width="100"/>
		<col width="100"/>
		<col width="200"/>
		<tr>
			<th>room번호</th>
			<th>아이디</th>
			<th>마지막 채팅</th>
			<th>마지막 시간</th>
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
						<td><a href="chat_room.do?member_id=${dto.member_id }">${dto.room_no }</a></td>
						<td>${dto.member_id }</td>
						<td>${dto.room_content }</td>
						<td>${dto.room_con_date }</td>	
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>