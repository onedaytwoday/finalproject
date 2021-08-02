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
<link rel="stylesheet" href="resources/assets/css/bootstrap.min.css?ver=1">
    <link rel="stylesheet" href="resources/assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="resources/assets/css/flaticon.css">
    <link rel="stylesheet" href="resources/assets/css/slicknav.css">
    <link rel="stylesheet" href="resources/assets/css/animate.min.css">
    <link rel="stylesheet" href="resources/assets/css/magnific-popup.css">
    <link rel="stylesheet" href="resources/assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="resources/assets/css/themify-icons.css">
    <link rel="stylesheet" href="resources/assets/css/nice-select.css?ver=1">
    <link rel="stylesheet" href="resources/assets/css/slick.css">
    <link rel="stylesheet" href="resources/assets/css/slick.min.css">
    <link rel="stylesheet" href="resources/assets/css/slick-theme.min.css">
    <link rel="stylesheet" href="resources/assets/css/style.css?ver=3">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="resources/js/sockjs.min.js"></script>
<style type="text/css">
.sent_msg {
  float: right;
  width: 50%;
}
.sent_msg p {
  background: #05728f none repeat scroll 0 0;
  border-radius: 3px;
  font-size: 14px;
  margin: 0;
  color:#fff;
  padding: 5px 10px 5px 12px;
  width:100%;
}
</style>
</head>
<body>
	<div class="inbox_msg">
		<div align="center">
			
		<div>
			<span style="font-size: 18pt">${rDto.consult_id }</span>
			<select name="langs" id="langs">
			  <option value="ko" selected>한국어</option>
			  <option value="en">English</option>
			  <option value="ja">Japanese</option>
			  <option value="es">Spanish</option>
			  <option value="fr">France</option>
			  <option value="it">Italian</option>
			</select>
		</div>
		</div>
	 <div class="mesgs">
          <div class="msg_history">
			<div id="chat">
						<c:set var="tmp" value="${rDto.member_id }" />
						<c:set var="tmp2" value="${rDto.consult_id }"/>
						<c:choose>
							<c:when test="${empty chatlist }">
							</c:when>
							<c:otherwise>
								<c:forEach items="${chatlist }" var="dto">
								<c:if test="${dto.member_id eq 'admin' }">
									<div class="incoming_msg">
	              					<div class="received_msg">
					                	<div class="received_withd_msg">
					                	<p>관리자 : <span class="content">${dto.chatting_content }</span> <img src="resources/images/tts.png" class="tts" alt="tts" style="width: 20px; height: 20px; float: right;"/></p>
                  						<span class="time_date"><fmt:formatDate value="${dto.chatting_date }" pattern="MM/dd hh시mm분" /></span>
                  						</div>
              						</div>
            					</div>
								</c:if>
								<c:if test="${dto.member_id eq tmp }">
									<div class="outgoing_msg">
              							<div class="sent_msg">
              							<c:if test="${dto.chatting_read eq 'N' }">
					                	<span class="content_read" style="color:red;float:left;position: relative; left: -15px; top: 2px;">1</span>
					                	</c:if>
                						<p><span class="content">${dto.chatting_content }</span> <img src="resources/images/tts.png" class="tts" alt="tts" style="width: 20px; height: 20px; float: right;"/></p>
                						<span class="time_date"><fmt:formatDate value="${dto.chatting_date }" pattern="MM/dd hh시mm분" /></span>
                						</div>
            						</div>
								</c:if>
								
								<c:if test="${dto.member_id eq tmp2 }">
								<div class="incoming_msg">
	              					<div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> 
	              					</div>
	              					<div class="received_msg">
					                	<div class="received_withd_msg" style="color:red;">
					                	<p><span class="content">${dto.chatting_content }</span> 
					                	<img src="resources/images/tts.png" class="tts" alt="tts" style="width: 20px; height: 20px; float: right;"/></p>
					                	<c:if test="${dto.chatting_read eq 'N' }">
					                	<span class="content_read">1</span>
					                	</c:if>
                  						<span class="time_date"><fmt:formatDate value="${dto.chatting_date }" pattern="MM/dd hh시mm분" /></span>
                  						</div>
                  						
              						</div>
            					</div>
								</c:if>
            </c:forEach>
			</c:otherwise>
			</c:choose>
			</div>
          <div class="type_msg">
            <div class="input_msg_write">
	            <form id="chatForm">
					<input type="text" id="message" class="write_msg" placeholder="Type a message" />
					<button class="send_btn button">보내기</button>
					<button class="exit_btn button" type="button" onclick="exit()">나가기</button>
				</form>
            </div>
          </div>
        </div>
	</div>
	</div>
	<script>
		$(document).ready(function(){
			if('${lang}' != '') {
				$("#langs").val('${lang}').prop("selected", true);			
			}
			
			$("#message").val('').focus();
			$("#chatForm").submit(function(event){
				console.log(event);
				event.preventDefault();
				sock.send($("#message").val());
				$("#message").val('').focus();
			});
			
			$("#langs").change(function(){
				let lang = $("select > option:selected").val();
				
				$.ajax({
					url: 'selectLang.do?lang='+lang,
					type: 'get',
					success: function(result){
							if(result.msg == '성공'){
								location.href='chat_room.do?member_id=${rDto.consult_id }';
							}
					},
					error: function(){
						alert("통신 실패!");
					}
				})
			});		
		});
				
		var sock = new SockJS("${pageContext.request.contextPath}/echo");
		
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
			var input = $(this).siblings(".content").text();
			speech(input);	
		});
		
		
	
	</script>
	
	<script src="resources/assets/js/vendor/modernizr-3.5.0.min.js"></script>
    <!-- Jquery, Popper, Bootstrap -->
    
    <script src="resources/assets/js/popper.min.js"></script>
    <script src="resources/assets/js/bootstrap.min.js"></script>
    <!-- Jquery Mobile Menu -->
    <script src="resources/assets/js/jquery.slicknav.min.js"></script>
    <!-- Jquery Slick , Owl-Carousel Plugins -->
    <script src="resources/assets/js/owl.carousel.min.js"></script>
	<script src="resources/assets/js/slick.min.js"></script>
    <!-- One Page, Animated-HeadLin -->
    <script src="resources/assets/js/wow.min.js"></script>
    <script src="resources/assets/js/animated.headline.js"></script>
    <script src="resources/assets/js/jquery.magnific-popup.js"></script>

    <!-- Scrollup, nice-select, sticky -->
    <script src="resources/assets/js/jquery.scrollUp.min.js"></script>
    <script src="resources/assets/js/jquery.nice-select.min.js"></script>
    <script src="resources/assets/js/jquery.sticky.js"></script>
    
    <!-- contact js -->
    <script src="resources/assets/js/jquery.form.js"></script>
    <script src="resources/assets/js/jquery.validate.min.js"></script>
    <script src="resources/assets/js/mail-script.js"></script>
    <script src="resources/assets/js/jquery.ajaxchimp.min.js"></script>
    
    <!-- Jquery Plugins, main Jquery -->	
    <script src="resources/assets/js/plugins.js"></script>
    <script src="resources/assets/js/main.js"></script>
   
    <script src="resources/assets/js/swiper.min.js"></script>
    <script src="resources/assets/js/mixitup.min.js"></script>
    <script src="resources/assets/js/jquery.counterup.min.js"></script>
    <script src="resources/assets/js/waypoints.min.js"></script>	
</body>
</html>