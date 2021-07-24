<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                	<h1 class="h3 mb-4 text-gray-800">이벤트 관리</h1>
                	
                	<!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">이벤트 목록</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered text-center align-items-center" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th><input type="checkbox" onclick="allCheck(this.checked, 'event')" /></th>
											<th>이벤트 제목</th>
											<th>내용</th>
											<th>시작 날짜</th>
											<th>종료 날짜</th>
											<th>알림 여부</th>
											<th>상품/클래스</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
	                                    <c:choose>
											<c:when test="${empty eList }">
												<tr>
													<th colspan="7">------------이벤트 목록이 존재하지 않습니다.------------</th>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach items="${eList }" var="dto">
													<tr>
														<td><input type="checkbox" name="chk_event" value="${dto.event_no }" /></td>
														<td>${dto.event_title }</td>
														<td>${dto.event_desc }</td>
														<td><fmt:formatDate value="${dto.event_start }" pattern="yyyy/MM/dd" /></td>
														<td><fmt:formatDate value="${dto.event_end }" pattern="yyyy/MM/dd" /></td>
														<td>${dto.event_noti }</td>
														<c:choose>
															<c:when test="${dto.class_no >= 0 && dto.product_no == 0 }">
																<td><a href='classSelect.do?class_no=${dto.class_no }'>${dto.title }</a></td>
															</c:when>
															
															<c:otherwise>
																<td><a href='store_select.do?product_no=${dto.product_no }'>${dto.title }</a></td>
															</c:otherwise>
														</c:choose>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
                                    </tbody>
                                </table>
                                
                                <input class="genric-btn success-border circle float-right ml-2" type="button" value="알림 보내기" onclick="updateNoti()"/>
								<input class="genric-btn danger-border circle float-right" type="button" value="삭제" onclick="deleteChecked('event')" />
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
                
                <jsp:include page="/WEB-INF/views/paging.jsp">
					<jsp:param value="Event" name="board_category" />
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