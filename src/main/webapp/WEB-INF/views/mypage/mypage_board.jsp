<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>My Page</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	
	<!-- Page Wrapper -->
    <div id="wrapper">
		<jsp:include page="mypage_menu.jsp"></jsp:include>
        
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
                <!-- Begin Page Content -->
                <div class="container-fluid mt-3">
                	<h1 class="h3 mb-4 text-gray-800">게시판</h1>
                	
                	<!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">상품 문의</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered text-center align-items-center" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>번호</th>
											<th>제목</th>
											<th>조회수</th>
											<th>작성일</th>
                                        </tr>
                                    </thead>
                                    
                                    <tfoot>
                                        <tr>
                                            <th>번호</th>
											<th>제목</th>
											<th>조회수</th>
											<th>작성일</th>
                                        </tr>
                                    </tfoot>
                                    
                                    <tbody>
	                                    <c:choose>
											<c:when test="${empty list }">
												<tr><th colspan="5">-----------------작성하신 글이 없습니다-------------</th></tr>
											</c:when>
											<c:otherwise>
												<c:forEach items="${list }" var="dto">
													<c:set var="cnt" value="${cnt + 1}"/>
													<tr>
														<td>${cnt }</td>
														<td><a href="board_detail.do?board_no=${dto.board_no }">${dto.board_title }</a></td>
														<td>${dto.board_readcount }</td>
														<td><fmt:formatDate value="${dto.board_date }" pattern="yyyy-MM-dd" /></td>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
                
                <jsp:include page="/WEB-INF/views/paging.jsp">
					<jsp:param value="qna" name="board_category" />
					<jsp:param value="mypage" name="from" />
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
    </div>
	
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>