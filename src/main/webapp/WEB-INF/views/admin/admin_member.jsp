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
				<th>회원 ID</th>
				<th>이름</th>
				<th>닉네임</th>
				<th>이메일</th>
				<th>등급</th>
				<th></th>
			</tr>
			
			<c:choose>
				<c:when test="${empty mList }">
					<tr>
						<th colspan="5">------------회원이 존재하지 않습니다.------------</th>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${mList }" var="dto">
						<tr>
							<td>${dto.member_id }</td>
							<td>${dto.member_name }</td>
							<td>${dto.member_nicname }</td>
							<td>${dto.member_email }</td>
							<td>${dto.member_grade }</td>
							<td><input id="${dto.member_id }" type="button" onclick="manageMember('${dto.member_id}');" value="${dto.member_join == 'Y' ? '계정 잠그기' : '계정 풀기' }" /></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		
		<jsp:include page="/WEB-INF/views/paging.jsp">
			<jsp:param value="Member" name="board_category" />
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
</body>
</html>