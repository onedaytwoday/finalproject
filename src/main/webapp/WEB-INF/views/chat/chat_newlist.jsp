<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			<c:when test="${empty list }">
				<p>---------강사가 없습니다---------</p>
			</c:when>
			<c:otherwise>
				<div class="inbox_chat">
				<c:forEach items="${list }" var="dto">
           				<div class="chat_list">
             				<div class="chat_people">
               					<div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"></div>
                					<div class="chat_ib">
                  						<h5><a href="chat_room.do?member_id=${dto.member_id}">${dto.member_id}</a></h5>
                  						<p>${dto.member_name}</p>	
                					</div>
              				</div>
            			</div>
				</c:forEach>
				</div>
			</c:otherwise>
		  </c:choose>
        </div>
</body>
</html>