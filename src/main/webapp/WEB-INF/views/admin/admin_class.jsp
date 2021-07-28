<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                	<h1 class="h3 mb-4 text-gray-800">클래스 관리</h1>
                	
                	<!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary align-items-center">클래스 목록</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered text-center" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th><input type="checkbox" onclick="allCheck(this.checked, 'class')" /></th>
											<th>작성자</th>
											<th>클래스 이름</th>
											<th>클래스 가격</th>
											<th>카테고리</th>
											<th>할인율</th>
											<th>위치</th>
                                        </tr>
                                    </thead>
                                    <tbody>
	                                    <c:choose>
											<c:when test="${empty cList }">
												<tr>
													<th colspan="8">------------등록된 클래스가 존재하지 않습니다.------------</th>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach items="${cList }" var="dto">
													<tr>
														<td><input type="checkbox" name="chk_class" value="${dto.class_no }" /></td>
														<td>${dto.member_id }</td>
														<td><a href="classSelect.do?class_no=${dto.class_no }">${dto.class_title }</a></td>
														<td>${dto.class_price }원</td>
														<td>${dto.class_category }</td>
														<td>${dto.class_sale }%</td>
														<td>${dto.class_loc }</td>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
                                    </tbody>
                                </table>
                                
                                <input class="genric-btn danger-border circle float-right" type="button" value="삭제" onclick="deleteChecked('class')" />
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
                
                
                
                <jsp:include page="/WEB-INF/views/paging.jsp">
					<jsp:param value="Class" name="board_category" />
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