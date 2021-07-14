<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
					<p class="old">${dto.member_id} : ${dto.chatting_content } <input class="tts" type="button" value="음성" />_${fn:substring(dto.chatting_date,11,19) }</p>
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
				$(location).attr('href',"chat_main.do?member_id=${rDto.member_id }");
			}
	//음성번연(목소리 가져오기)

		var voices = [];
		function setVoiceList() {
			voices = window.speechSynthesis.getVoices();
		}
		setVoiceList();
		if (window.speechSynthesis.onvoiceschanged !== undefined) {
			window.speechSynthesis.onvoiceschanged = setVoiceList;
		}
		function speech(txt) {
			//브라우저 체크
			if(!window.speechSynthesis) {
				alert("음성 재생을 지원하지 않는 브라우저입니다. 크롬, 파이어폭스 등의 최신 브라우저를 이용하세요");
				return;
			}
			//음성읽기 객체
			var lang = 'ko-KR';
			var utterThis = new SpeechSynthesisUtterance(txt);
			utterThis.onend = function (event) {
				console.log('end');
			};
			utterThis.onerror = function(event) {
				console.log('error', event);
			};
			var voiceFound = false;
			for(var i = 0; i < voices.length ; i++) {
				if(voices[i].lang.indexOf(lang) >= 0 || voices[i].lang.indexOf(lang.replace('-', '_')) >= 0) {
					utterThis.voice = voices[i];
					voiceFound = true;
				}
			}
			if(!voiceFound) {
				alert('voice not found');
				return;
			}
			utterThis.lang = lang;
			utterThis.pitch = 1;
			utterThis.rate = 1; //속도
			window.speechSynthesis.speak(utterThis);
		}
		$(".tts").click(function(){
			var input = $(this).parent().text();
			alert(input);
			speech(input);	
		});
	
	</script>	
</body>
</html>