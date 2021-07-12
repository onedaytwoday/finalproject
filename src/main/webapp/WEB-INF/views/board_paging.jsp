<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="paging">

		<c:choose>
			<c:when test="${param.board_category eq 'N' }">
				<c:url var="action" value="board_notice_list.do" />
			</c:when>
			
			<c:when test="${param.board_category eq 'Q' && param.from == null}">
				<c:url var="action" value="board_qna_list.do" />
			</c:when>
			
			<c:when test="${param.board_category eq 'Q' && param.from eq 'admin' }">
				<c:url var="action" value="adminBoard.do" />
			</c:when>

			<c:otherwise>
				<c:url var="action" value="admin${param.board_category }.do" />
			</c:otherwise>
		</c:choose>

		<c:if test="${param.nowBlock > 1}">
			<a href="${action}?nowPage=${param.blockBegin-1}">◀</a>
		</c:if>

		<c:forEach begin="${param.blockBegin}" end="${param.blockEnd}"
			var="index">
			<c:choose>
				<c:when test="${param.nowPage == index}">
					     ${index}
				    </c:when>
				<c:otherwise>
					<a href="${action}?nowPage=${index}">${index}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<c:if test="${param.nowBlock < param.totalBlock}">
			<a href="${action}?nowPage=${param.blockEnd+1}">▶</a>
		</c:if>
	</div>
</body>
</html>