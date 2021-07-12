<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>title</title>
<meta charset="UTF-8"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="resources/js/sockjs.min.js"></script>
</head>
<body>
	<h1>${rDto.consult_id }와의 새로운 채팅방</h1>
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