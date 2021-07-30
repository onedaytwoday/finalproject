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
				<c:if test="${param.notice_search_category eq 'title' or param.notice_search_category eq 'nicname' or param.notice_search_category eq 'content+title' }">
					<c:url var="action" value="board_notice_search.do"/>
					<c:set var="search" value="&search_category=${param.notice_search_category }&search_keyword=${param.search_keyword }" />
				</c:if>
				<c:if test="${param.notice_search_category eq null }">
				<c:url var="action" value="board_notice_list.do" />
				</c:if>
			</c:when>
			
			<c:when test="${param.board_category eq 'Q' && param.from == null}">
				<c:if test="${param.qna_search_category eq 'title' or param.qna_search_category eq 'nicname' or param.qna_search_category eq 'content+title' }">
					<c:url var="action" value="board_qna_search.do"/>
					<c:set var="search" value="&search_category=${param.qna_search_category }&search_keyword=${param.search_keyword }" />
				</c:if>
				<c:if test="${param.qna_search_category eq null }">
				<c:url var="action" value="board_qna_list.do" />
				</c:if>
				
			</c:when>
			
			<c:when test="${param.board_category eq 'Q' && param.from eq 'admin' }">
				<c:url var="action" value="adminBoard.do" />
			</c:when>
			
			<c:when test="${param.board_category eq 'payment' && param.from eq 'mypage' }">
				<c:url var="action" value="mypage_payment.do" />
			</c:when>
			
			<c:when test="${param.store_category eq 'S' }">
				<c:choose>
				<c:when test="${empty param.search_keyword }">
					<c:url var="action" value="store.do" />
				</c:when>
				<c:otherwise>
					<c:url var="action" value="store_search.do" />
					<c:set var="search" value="&search_keyword=${param.search_keyword }"/>
				</c:otherwise>
				</c:choose>	
			</c:when>
			
			<c:when test="${param.class_category eq 'C' }">
				<c:if test="${param.class_search_category eq 'nickname' or param.class_search_category eq 'title+desc+category' }">
					<c:url var="action" value="class_search.do"/>
					<c:set var="search" value="&search_category=${param.class_search_category }&search_keyword=${param.search_keyword }" />
				</c:if>
				<c:if test="${param.class_search_category eq null }">
				<c:url var="action" value="classList.do" />
				</c:if>
			</c:when>


			<c:otherwise>
				<c:url var="action" value="admin${param.board_category }.do" />
			</c:otherwise>
		</c:choose>

		<nav class="blog-pagination justify-content-center d-flex">
			<ul class="pagination">
	        	<li class="page-item">
	        		<%-- 
	        		<c:if test="${param.nowBlock > 1}">
						<a class="page-link" aria-label="Previous" href="${action}?nowPage=${param.blockBegin-1}${search}"><i class="ti-angle-left"></i></a>
					</c:if>
	            	--%>
	            	<a href="#" class="page-link" aria-label="Previous">
	                	<i class="ti-angle-left"></i>
	                </a>
	            </li>
	            <li class="page-item d-flex">
	            	<c:forEach begin="${param.blockBegin}" end="${param.blockEnd}" var="index">
						<c:choose>
							<c:when test="${param.nowPage == index}">
								     <a class="page-link">${index}</a>
							    </c:when>
							<c:otherwise>
								<a class="page-link" href="${action}?nowPage=${index}${search}">${index}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
	            </li>
	            
	            <li class="page-item">
	            	<%--
	            	<c:if test="${param.nowBlock < param.totalBlock}">
						<a href="${action}?nowPage=${param.blockEnd+1}${search}">▶</a>
					</c:if>
	            	--%>
	            	<a href="#" class="page-link" aria-label="Next">
	                	<i class="ti-angle-right"></i>
	                </a>
	            </li>
	        </ul>
	    </nav>
		
	</div>
	
	
	
	
	
	
</body>
</html>