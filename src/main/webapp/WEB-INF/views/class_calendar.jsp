<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.css' rel='stylesheet' />
<link href='https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.1/css/all.css' rel='stylesheet'>
<link href='resources/fullcalendar/main.css' rel='stylesheet' />
<script src='resources/fullcalendar/main.js'></script>
<script type="text/javascript" src="resources/js/calendar.js"></script>
</head>
<body>
	<div id="calendar">
		<c:if test="${mDto.member_grade == '강사회원' }">
			<button class="btn btn-warning" onclick="location.href='detailInsertForm.do?class_no=${dto.class_no}'">일정 추가/변경하기</button>	
		</c:if>
	</div>
</body>
</html>