<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin Page</title>

</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	
	<!-- Page Wrapper -->
    <div id="wrapper">
		<jsp:include page="admin_menu.jsp"></jsp:include>
        
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
                <!-- Begin Page Content -->
                <div class="container-fluid mt-3">
                	<h1 class="h3 mb-4 text-gray-800">상품문의 관리</h1>
                	
                	<!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">상품문의 목록</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered text-center align-items-center" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th><input type="checkbox" onclick="allCheck(this.checked, 'qna')" /></th>
											<th>번호</th>
											<th>작성자</th>
											<th>제목</th>
											<th>조회수</th>
											<th>작성일</th>
                                        </tr>
                                    </thead>
                                    
                                    <tfoot>
                                        <tr>
                                            <th><input type="checkbox" onclick="allCheck(this.checked, 'qna')" /></th>
											<th>번호</th>
											<th>작성자</th>
											<th>제목</th>
											<th>조회수</th>
											<th>작성일</th>
                                        </tr>
                                    </tfoot>
                                    
                                    <tbody>
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
                                    </tbody>
                                </table>
                                
                                <input class="genric-btn danger-border circle float-right" type="button" value="삭제" onclick="deleteChecked('qna')" />
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
                
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
    </div>

    <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>