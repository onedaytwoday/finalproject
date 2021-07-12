<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="resources/js/sockjs.min.js"></script>
</head>
<body>
	<h1>기존 채팅방이 존재 Room_no : ${Room_no }</h1>
	<h1>${rDto.consult_id }와 채팅</h1>
	<form id="chatForm">
		<input type="text" id="message"/>
		<button>send</button>
		<input type="button" value="나가기" onclick="exit()">
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
		var room_content = null;
		sock.onmessage = function(e){
			console.log(e);
			$("#chat").append(e.data + "<br/>");
			var tmp = e.data.split(":");
			var member_id = $.trim(tmp[0]);
			var chatting_content = $.trim(tmp[1]);
			var room_no = ${Room_no}; 
			room_content = chatting_content;
			let insertStatus = {
					"member_id": member_id,
					"chatting_content": chatting_content,
					"room_no": room_no
				}
			$.ajax({
				type: "post",
				url: "chat_insert.do",
				data: JSON.stringify(insertStatus),
				contentType: "application/json",
				dataType: "json",
				success: function(result) {
					if (result.msg == '성공') {
						alert("성공");
					}
				},
				error: function() {
					alert("통신 실패!");
				}
			});
		}
		
		function exit(){
			$("#chat").append("연결 종료");
		}
			sock.onclose = function(e){
				console.log(e);
				var room_no = ${Room_no}; 
				let updateStatus = {
						"room_content": room_content,
						"room_no": room_no
					}
				alert(updateStatus);
				
				$("#chat").append("연결 종료");
			}
		
	</script>	
</body>
</html>