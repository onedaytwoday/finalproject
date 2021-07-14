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
		<h3>Room_no : ${Room_no }</h3>
		<h3>${rDto.consult_id }와 채팅</h3>
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
								
								<c:if test="${dto.member_id eq tmp }">
									<div class="outgoing_msg">
              							<div class="sent_msg">
                						<p>${dto.chatting_content }</p>
                						<span class="time_date"><fmt:formatDate value="${dto.chatting_date }" pattern="MM/dd hh시mm분" /></span>
                						</div>
            						</div>
								</c:if>
								
								<c:if test="${dto.member_id eq tmp2 }">
								<div class="incoming_msg">
	              					<div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> 
	              					</div>
	              					<div class="received_msg">
					                	<div class="received_withd_msg">
					                	<p>${dto.chatting_content }</p>
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
				<button class="send_btn" style="float: right; position: relative; padding: 10px; top:-48px">보내기</button>
				<button class="exit_btn" type="button" onclick="exit()">나가기</button>
				</form>
            </div>
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
				$("#chat").append("연결 종료");
				$(location).attr('href',"chat_main.do?member_id=${rDto.member_id }");
			}

	</script>	
</body>
</html>