<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<style type="text/css">
.search{
	float: right;
	position: relative;
	top: -50px;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<jsp:include page="/WEB-INF/views/header.jsp" />

	<main class="container">
	<h1>공지사항</h1>
	<div class="search">
		<form action="board_notice_search.do" method="post">
		<input type="hidden" name="nowPage" value="1">
		<select name="search_category">
			<option value="nicname" selected>닉네임</option>
			<option value="title">제목</option>
			<option value="content+title">제목+내용</option>
		</select>
		<input type="text" class="search_keyword" name="search_keyword" placeholder="Search term...">
        <input type="submit" value="검색" />
         </form>
	</div>
	<table border="1">
		<col width="50" />
		<col width="100" />
		<col width="500" />
		<col width="50" />
		<col width="100" />
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>조회수</th>
			<th>작성일</th>
		</tr>
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<th colspan="5">------------작성된 글이 없습니다------------</th>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
				<tr>
							<td>${dto.board_notice_no }</td>
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
				<td colspan="5" align="right">
					<input type="button" value="글작성" onclick="location.href='board_insertform.do?board_category=N'" />
				</td>
			</tr>
		</table>
		
		<p>category : ${Pdto.search_category }</p>
					<jsp:include page="/WEB-INF/views/paging.jsp">
						<jsp:param value="N" name="board_category" />
						<jsp:param value="${Pdto.search_category }" name="search_category" />
						<jsp:param value="${Pdto.search_keyword }" name="search_keyword"/>
						<jsp:param value="${Pdto.nowBlock}" name="nowBlock" />
						<jsp:param value="${Pdto.blockBegin }" name="blockBegin" />
						<jsp:param value="${Pdto.blockEnd }" name="blockEnd" />
						<jsp:param value="${Pdto.nowPage}" name="nowPage" />
						<jsp:param value="${Pdto.blockBegin}" name="blockBegin" />
						<jsp:param value="${Pdto.blockEnd}" name="blockEnd" />
						<jsp:param value="${Pdto.totalBlock}" name="totalBlock" />
					</jsp:include>
	</main>				
	
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>