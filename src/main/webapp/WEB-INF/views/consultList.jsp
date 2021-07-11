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
	<h2>강사 ID를 클릭하여 채팅을 시작해보세요</h2>
	<table border="1">
		<col width="100"/>
		<col width="70"/>
		<tr>
			<th>강사 ID</th>
			<th>강사명</th>
		</tr>
		<c:choose>
			<c:when test="${empty list }">
				<<tr><th colspan="4">--------강사가 없습니다---------</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td><a href="creatChat.do?member_id=${dto.member_id}">${dto.member_id}</a></td>
						<td>${dto.member_name}</td>	
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	


</body>
</html>