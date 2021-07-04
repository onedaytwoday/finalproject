<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>웹소켓 채팅</title>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$("#button-send").click(function(e){
		sendMessage();
		$("#msg").val('')
	});
	var sock = new SockJS('http://localhost:8787/chat');
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	sock.onopen = onOpen;
	
	function sendMessage(){
		sock.send($("#msg").val());
	}
	//서버에서 메세지 받았을 때
	function onMessage(msg){
		var data = msg.data;
		var sessionId = null;
		var message = null;
		
		var arr = data.split(":");
		
		for(var i=0; i<arr.length;i++){
			console.log('arr['+i+']:'+arr[i]);
		}
		
		var cur_session = '${member_id}';
		sessionId = arr[0];
		message = arr[1];
		//로그인한 클라이언트와 다른 클라이언트 분류
		if(sessionId == cur_session){
			var str = "<div class='col-6'>";
			str += "<div class='alert alert-secondary'>";
			str += "<b>"+sessionId+" : "+message+"</b>";
			str += "</div></div>";
			
			$("#msgArea").append(str);
			
		}else{
			var str = "<div class='col-6'>";
			str += "<div class='alert alert-warning'>";
			str += "<b>"+sessionId+" : "+message+"</b>";
			str += "</div></div>";
			
			$("#msgArea").append(str);
		}
		//채팅창에서 나간 경우
		function onClose(evt){
			var user = '${member_id}';
			var str = user =" 님이 퇴장하였습니다.";
			
			$("#msgArea").append(str);
		}
		//채팅방 들어온 경우
		function onOpen(evt){
			var user = '${member_id}';
			var str = user +" 님이 입장하였습니다.";
			$("#msgArea").append(str);
		}
		
		
	}
</script>
</head>
<body>
	<div class="container">
		<div class="col-6">
			<label><b>채팅방</b></label>
		</div>
		<div>
			<div id="msgArea" class="col">
			</div>
			<div class="col-6">
				<div class="input-group mb-3">
					<input type="text" id="msg" class="form-control"/>
					<div class="input-group-append">
						<button class="btn btn-outline-secondary" type="button" id="button-send">전송</button>
					</div>
				</div>
			</div>
		</div>
		<div class="col-6">
		</div>
	</div>

</body>
</html>