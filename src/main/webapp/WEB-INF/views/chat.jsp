<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>

<script type="text/javascript">
	

	//websocket 지정url 연결
	var sock = new SockJS("<c:url value="/echo"/>");
	//websocket 서버에 메세지 보내면 실행
	sock.onmessage = onMessage;
	//연결 끊을 때
	sock.onclose = onClose;
	
	$(function(){
		$("#sendBtn").click(function(){
			cosole.log('메세지를 보냅니다...');
			sendMessage();
		});
	});
	
	function sendMessage(){
		//웹소켓으로 메세지 보낼때
		sock.send($("#message").val());
		
	}
	//evt : 웹소켓이 보내준 데이터
	function onMessage(evt){
		var data = evt.data;
		var sessionid = null;
		var message = null;
		
		var strArray = data.split('|');
		for(var i = 0; i <strArray.length i++){
			conosle.log('str['+i+']: '+ strArray[i]);
		}
		//현재 sessionid
		var currentuser_session = $("#sessionuserid").val();
		console.log("현재 session id : "+currentuser_session);
		
		sessionid = strrray[0]; //현재 메세지 보낸 사람의 세션 등록
		message = strArray[1]; //현재 메세지 저장
		
		//메세지 구분
		if(sessionid == currentuser_session){
			var printHTML = "<div class='well'>";
			printHTML += "<div class='alert alert-info'>";
			printHTML += "<strong>["+sesionid+"] -> "+message+"</strong>";
			printHTML += "</div>";
			printHTML += "</div>";
			$("#chatdata").append(printHTML);
			
		}else{
			var printTML = "<div class='well'>";
			printHTML += "<div class='alert alert-warning'>";
			printHTML += "<strong>["+sessionid+"]->"+message+"</strong>";
			printHTML += "</div>";
			printHTML += "</div>";
			$("#chatdata").append(printHTML);
		}
		console.log('chatting data : '+data);
	}
	
	function onClose(evt){
		$("#data").append("연결끊김");
	}
	
	
	
</script>
</head>
<body>

	<h1>Chat (id: ${member_id})</h1>

	<div>
		<div>
			<input type="text" id="message"/>
    		<input type="button" id="sendBtn" value="전송"/>
    	</div>
    	<br>
    	<div class="well" id="chatdata">
    		
    		<input type="hidden" value='${member_id}' id="sessionuserid">
    	</div>
	</div>

</body>
</html>