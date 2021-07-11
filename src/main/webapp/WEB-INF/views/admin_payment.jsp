<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="resources/js/admin.js"></script>
</head>
<body>
	<div style="height: 100vh; display: flex">
      <!-- Side Menu -->
      <jsp:include page="admin_menu.jsp"></jsp:include>

      <!-- Content -->
      <div style="margin: 5rem 0; width: 80%">
      	<table border="1">
			<col width="150" />
			<col width="150" />
			<col width="150" />
			<col width="200" />
			<col width="150" />
			<col width="100" />
			
			<tr>
				<th>결제자</th>
				<th>결제 수량</th>
				<th>결제 가격</th>
				<th>결제 날짜</th>
				<th>상태</th>
				<th></th>
			</tr>
			
			<c:choose>
				<c:when test="${empty pList }">
					<tr>
						<th colspan="5">------------결제 목록이 존재하지 않습니다.------------</th>
					</tr>
				</c:when>d
				<c:otherwise>
					<c:forEach items="${pList }" var="dto">
						<tr>
							<td>${dto.member_id }</td>
							<td>${dto.payment_num }</td>
							<td>${dto.payment_price }</td>
							<td>${dto.payment_date }</td>
							<td><span id="${dto.payment_no }">${dto.payment_del }</span></td>
							
							<c:if test="${dto.class_no == 0 }">
								<td><input onclick="updateStatus(${dto.payment_no})" type="button" value="업데이트" /></td>						
							</c:if>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
      </div>
    </div>
</body>
</html>