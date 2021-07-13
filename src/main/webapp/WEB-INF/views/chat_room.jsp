<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="resources/js/sockjs.min.js"></script>
</head>
<body>
	<h3>Room_no : ${Room_no }</h3>
	<h3>${rDto.consult_id }와 채팅</h3>
	<form id="chatForm">
		<input type="text" id="message"/>
		<button>send</button>
		<input type="button" value="나가기" onclick="exit()">
	</form>
	<div id="chat">
		<c:choose>
			<c:when test="${empty chatlist }">
			</c:when>
			<c:otherwise>
				<c:forEach items="${chatlist }" var="dto">
					<p class="old">${dto.member_id} : ${dto.chatting_content } - ${dto.chatting_date }</p>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
	<script>
		$(document).ready(function(){
			$("#chatForm").submit(function(event){
				console.log(event);
				event.preventDefault();
				sock.send($("#message").val());
				$("#message").val('').focus();
			});
		});
		
		var sock = new SockJS("${pageContext.request.contextPath}/echo");
		
		// 메세지 왔을때
		sock.onmessage = function(e){
			console.log(e);
			var box = $('<p>' + e.data + '</p>').addClass('new');
			$("#chat").append(box);
		}
		
		// 나가기 버튼
		function exit(){
			sock.close();
		}		
		
		// 연결끊기면 
			sock.onclose = function(e){
				console.log(e);
				$("#chat").append("연결 종료");
			}

	</script>	
</body>
</html>