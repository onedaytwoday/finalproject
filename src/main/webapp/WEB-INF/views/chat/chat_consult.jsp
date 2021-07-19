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
<style type="text/css">
.circle{
	background-color:red;
	width:20px; 
	height:20px;
	border-radius:50%;
	text-align:center;
	margin:0 auto;
	font-size:12pt;
	color:#fff;
	vertical-align:middle;
}
</style>
</head>
<body>
	<div class="inbox_people">
          <div class="headind_srch">
            <h4>Exist</h4>
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
                					<a href="chat_room.do?member_id=${dto.member_id }">
                					<div class="chat_ib">
                  						<h5>${dto.member_id }
                  						<c:forEach items="${member_history }" var="log">
                  						<c:if test="${dto.member_id eq log }"><img src="resources/images/green.png" width="10px" height="10px" /></c:if>
                  						</c:forEach>
                  						<c:choose>
                  						<c:when test="${empty chatread }"></c:when>
                  						<c:otherwise>
                  							<c:forEach items="${chatread }" var="c_dto">
												<c:if test="${c_dto.room_no eq dto.room_no }">
													<span class="circle">${c_dto.cnt }</span>
												</c:if>
											</c:forEach>
										</c:otherwise>
										</c:choose>
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