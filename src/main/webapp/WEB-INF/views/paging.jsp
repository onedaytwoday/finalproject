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
		<c:set var="search"/>
		<c:choose>
			<c:when test="${param.board_category eq 'N' }">
				<c:if test="${param.search_category eq 'title' or param.search_category eq 'content' or param.search_category eq 'content+title' }">
					<c:url var="action" value="board_notice_search.do"/>
					<c:set var="search" value="&search_category=${param.search_category }&search_keyword=${param.search_keyword }" />
				</c:if>
				<c:if test="${param.search_category eq null }">
				<c:url var="action" value="board_notice_list.do" />
				</c:if>
			</c:when>
			
			<c:when test="${param.board_category eq 'Q' && param.from == null}">
				<c:url var="action" value="board_qna_list.do" />
			</c:when>
			
			<c:when test="${param.board_category eq 'Q' && param.from eq 'admin' }">
				<c:url var="action" value="adminBoard.do" />
			</c:when>
			
			<c:when test="${param.board_category eq 'payment' && param.from eq 'mypage' }">
				<c:url var="action" value="mypage_payment.do" />
			</c:when>
			
			<c:when test="${param.store_category eq 'S' }">
				<c:if test="${param.search_keyword eq null }">
					<c:url var="action" value="store.do" />
				</c:if>
				<c:if test="${param.search_keyword != null }">
					<c:url var="action" value="store_search.do" />
					<c:set var="search" value="&search_keyword=${param.search_keyword }"/>
				</c:if>			
			</c:when>


			<c:otherwise>
				<c:url var="action" value="admin${param.board_category }.do" />
			</c:otherwise>
		</c:choose>

		<c:if test="${param.nowBlock > 1}">
			<a href="${action}?nowPage=${param.blockBegin-1}${search}">◀</a>
		</c:if>

		<c:forEach begin="${param.blockBegin}" end="${param.blockEnd}"
			var="index">
			<c:choose>
				<c:when test="${param.nowPage == index}">
					     ${index}
				    </c:when>
				<c:otherwise>
					<a href="${action}?nowPage=${index}${search}">${index}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<c:if test="${param.nowBlock < param.totalBlock}">
			<a href="${action}?nowPage=${param.blockEnd+1}${search}">▶</a>
		</c:if>
	</div>
</body>
</html>