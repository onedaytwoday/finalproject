<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="resources/js/admin.js"></script>
</head>
<body>
	<div style="height: 100vh; display: flex">
      <!-- Side Menu -->
      <jsp:include page="admin_menu.jsp"></jsp:include>

      <!-- Content -->
      <div style="margin: 5rem 0; width: 80%">
      	<h1>상품 문의 관리</h1>
      	<table border="1">
	      	<col width="50" />
			<col width="50" />
			<col width="100" />
			<col width="500" />
			<col width="50" />
			<col width="100" />
			<tr>
				<th><input type="checkbox" onclick="allCheck(this.checked, 'qna')" /></th>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
			<c:choose>
				<c:when test="${empty qnaList }">
					<tr>
						<th colspan="6">------------작성된 글이 없습니다------------</th>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${qnaList }" var="dto">
						<tr>
							<td><input type="checkbox" name="chk_qna" value="${dto.board_no }" /></td>
							<td>${dto.board_qna_no }</td>
							<td>${dto.member_id }</td>
							<td><a href="board_detail.do?board_no=${dto.board_no }">${dto.board_title }</a></td>
							<td>${dto.board_readcount }</td>
							<td>
								<fmt:formatDate value="${dto.board_date }" pattern="yyyy-MM-dd" />
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="6" align="right">
					<input type="button" value="삭제" onclick="deleteChecked('qna')" />
				</td>
			</tr>
		</table>
	
					<jsp:include page="/WEB-INF/views/paging.jsp">
						<jsp:param value="Q" name="board_category" />
						<jsp:param value="admin" name="from" />
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