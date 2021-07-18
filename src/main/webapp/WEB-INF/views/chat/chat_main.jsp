<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>title</title>
<meta charset="UTF-8" />
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet" />
<link href="resources/css/chat.css" rel="stylesheet" />
</head>
<body>
	<div class="inbox_people">
          <div class="headind_srch">
            <div class="left_heading" onclick="location.href='chat_main.do?member_id=${mDto.member_id }'">
            <h4>Exist</h4>
            </div>
			<div class="right_heading" onclick="location.href='chat_newlist.do'">
			<h4>New</h4>
			</div>            
          </div>
          <c:choose>
			<c:when test="${empty roomlist }">
				<p>---------대화방이 없습니다---------</p>
			</c:when>
			<c:otherwise>
				<div class="inbox_chat">
				<c:forEach items="${roomlist }" var="dto">
           				<div class="chat_list">
             				<div class="chat_people">
               					<div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"></div>
                					<a href="chat_room.do?member_id=${dto.consult_id }">
                					<div class="chat_ib">
                  						<h5>${dto.consult_id }
                  						<c:forEach items="${member_history }" var="log">
                  						<c:if test="${dto.consult_id eq log }"><img src="resources/images/green.png" width="10px" height="10px" /></c:if>
                  						</c:forEach>
										<span class="chat_date">${dto.room_con_date }</span></h5>
                  						<p>${dto.room_content }</p>
                					</div>
                					</a>
              				</div>
            			</div>
				</c:forEach>
				</div>
			</c:otherwise>
		  </c:choose>
        </div>
</body>
</html>
