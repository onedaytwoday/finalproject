<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet" />
<link href="resources/css/chat.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="resources/js/sockjs.min.js"></script>
</head>
<body>
	<div class="inbox_msg">
		<h3>admin 채팅</h3>
		
	 <div class="mesgs">
          <div class="type_msg">
            <div class="input_msg_write">
	            <form id="chatForm">
					<input type="text" id="message" class="write_msg" placeholder="Type a message" />
					<button class="send_btn">보내기</button>
					<button class="exit_btn" type="button" onclick="exit()">나가기</button>
				</form>
            </div>
          </div>
        </div>
	</div>
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
				
		var sock = new SockJS("/echo");
		
		// 메세지 왔을때
		sock.onmessage = function(e){
			console.log(e);
			location.reload();
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