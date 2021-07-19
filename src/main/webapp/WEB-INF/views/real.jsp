<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<form id="chatForm">
			<input type="text" id="message" class="write_msg" placeholder="Type a message" />
			<button class="send_btn">보내기</button>
			<button class="exit_btn" type="button" onclick="exit()">나가기</button>
		</form>
		<div id="result"></div>

<script>
		$(document).ready(function(){
			$("#message").val('').focus();
			$("#chatForm").submit(function(event){
				console.log(event);
				event.preventDefault();
				sock.send($("#message").val());
				$("#message").val('').focus();
			});
		});
				
		var sock = new SockJS("${pageContext.request.contextPath}/real");
		
		// 메세지 왔을때
		sock.onmessage = function(e){
			$('#result').append(e.data + "<br>");
			console.log(e);
		}
		
		// 나가기 버튼
		function exit(){
			sock.close();
		}		
		
		// 연결끊기면 
			sock.onclose = function(e){
				console.log(e);
			}
		
</script>
</body>
</html>