<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='resources/fullcalendar/main.css' rel='stylesheet' />
<script src='resources/fullcalendar/main.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" integrity="sha512-qTXRIMyZIFb8iQcfjXWCO8+M5Tbc38Qi5WzdPOYZHIlZpzBHG3L3by84BBBOiRGiEb7KKtAOAs5qYdUiZiQNNQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript" src="resources/js/calendar.js"></script>
</head>
<body>
	<input type="hidden" id="member_id" value="${mDto.member_id }" />
	<div id="calendar">
		<c:if test="${mDto.member_grade == '강사회원' }">
			<button class="btn btn-warning" onclick="location.href='detailInsertForm.do?class_no=${dto.class_no}'">일정 추가/변경하기</button>	
		</c:if>
	</div>
</body>
</html>