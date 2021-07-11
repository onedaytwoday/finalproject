<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="resources/sockjs.min.js"></script>
</head>
<body>
	<h1>기존 채팅방이 존재</h1>
	<h1>${rDto.consult_id }와 채팅</h1>
	<form id="chatForm">
		<input type="text" id="message"/>
		<button>send</button>
	</form>
	<div id="chat"></div>
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
		sock.onmessage = function(e){
			console.log(e);
			$("#chat").append(e.data + "<br/>");
		}
		
		sock.onclose = function(e){
			console.log(e);
			$("#chat").append("연결 종료");
		}
		
	</script>	
</body>
</html>