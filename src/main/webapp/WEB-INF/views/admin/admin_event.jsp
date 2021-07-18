<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script type="text/javascript" src="resources/js/admin.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	
	<main class="container">
		<div style="display: flex">
	      <!-- Side Menu -->
	      <jsp:include page="admin_menu.jsp"></jsp:include>
	
	      <!-- Content -->
	      <div style="margin: 5rem 0; width: 80%">
	      	<h1>Event 관리</h1>
	      	
	      	<table border="1">
				<col width="50" />
				<col width="150" />
				<col width="150" />
				<col width="200" />
				<col width="150" />
				<col width="100" />
				<col width="100" />
				
				<tr>
					<th><input type="checkbox" onclick="allCheck(this.checked, 'event')" /></th>
					<th>이벤트 제목</th>
					<th>내용</th>
					<th>시작 날짜</th>
					<th>종료 날짜</th>
					<th>알림 여부</th>
					<th>상품/클래스</th>
				</tr>
				
				<c:choose>
					<c:when test="${empty eList }">
						<tr>
							<th colspan="7">------------이벤트 목록이 존재하지 않습니다.------------</th>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${eList }" var="dto">
							<tr>
								<td><input type="checkbox" name="chk_event" value="${dto.event_no }" /></td>
								<td>${dto.event_title }</td>
								<td>${dto.event_desc }</td>
								<td><fmt:formatDate value="${dto.event_start }" pattern="yyyy/MM/dd" /></td>
								<td><fmt:formatDate value="${dto.event_end }" pattern="yyyy/MM/dd" /></td>
								<td>${dto.event_noti }</td>
								<c:choose>
									<c:when test="${dto.class_no >= 0 && dto.product_no == 0 }">
										<td><a href='classSelect.do?class_no=${dto.class_no }'>${dto.title }</a></td>
									</c:when>
									
									<c:otherwise>
										<td><a href='store_select.do?product_no=${dto.product_no }'>${dto.title }</a></td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<tr>
					<td colspan="7" align="right">
						<input type="button" value="알림 보내기" onclick="updateNoti()"/>
						<input type="button" value="삭제" onclick="deleteChecked('event')" />
					</td>
				</tr>
			</table>
			
			<jsp:include page="/WEB-INF/views/paging.jsp">
				<jsp:param value="Event" name="board_category" />
				<jsp:param value="${pDto.nowBlock}" name="nowBlock" />
				<jsp:param value="${pDto.blockBegin }" name="blockBegin" />
				<jsp:param value="${pDto.blockEnd }" name="blockEnd" />
				<jsp:param value="${pDto.nowPage}" name="nowPage" />
				<jsp:param value="${pDto.blockBegin}" name="blockBegin" />
				<jsp:param value="${pDto.blockEnd}" name="blockEnd" />
				<jsp:param value="${pDto.totalBlock}" name="totalBlock" />
			</jsp:include>
	      </div>
	    </div>
	</main>
	
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>