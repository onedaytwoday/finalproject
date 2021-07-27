<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
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
                            <h6 class="m-0 font-weight-bold text-primary">내가 쓴 후기</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered text-center align-items-center" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>번호</th>
											<th>제목</th>
											<th>상품/클래스</th>
											<th>평점</th>
											<th>작성일</th>
                                        </tr>
                                    </thead>
                                    
                                    <tfoot>
                                        <tr>
                                            <th>번호</th>
											<th>제목</th>
											<th>상품/클래스</th>
											<th>평점</th>
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
														<td><a href="review_detail.do?review_no=${dto.review_no }">${dto.review_title }</a></td>
														<c:choose>
															<c:when test="${dto.product_no > 0 }">
																<td><a href="store_select.do?product_no=${dto.product_no }">${dto.product_name }</a></td>
															</c:when>
															
															<c:when test="${dto.class_no > 0 }">
																<td><a href="classDelete.do?class_no=${dto.class_no}">${dto.class_title }</a></td>
															</c:when>
														</c:choose>
														
														<td>${dto.review_rate }</td>
														<td><fmt:formatDate value="${dto.review_date }" pattern="yyyy-MM-dd" /></td>
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
					<jsp:param value="review" name="board_category" />
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