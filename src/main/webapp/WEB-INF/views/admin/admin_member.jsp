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
                	<h1 class="h3 mb-4 text-gray-800">회원 관리</h1>
                	
                	<!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">회원 목록</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered text-center align-items-center" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>회원 ID</th>
											<th>이름</th>
											<th>닉네임</th>
											<th>이메일</th>
											<th>등급</th>
											<th></th>
                                        </tr>
                                    </thead>
                                    
                                    <tfoot>
                                        <tr>
                                            <th>회원 ID</th>
											<th>이름</th>
											<th>닉네임</th>
											<th>이메일</th>
											<th>등급</th>
											<th></th>
                                        </tr>
                                    </tfoot>
                                    
                                    <tbody>
	                                    <c:choose>
											<c:when test="${empty mList }">
												<tr>
													<th colspan="5">------------회원이 존재하지 않습니다.------------</th>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach items="${mList }" var="dto">
													<tr>
														<td>${dto.member_id }</td>
														<td>${dto.member_name }</td>
														<td>${dto.member_nicname }</td>
														<td>${dto.member_email }</td>
														<td>${dto.member_grade }</td>
														<td><input id="${dto.member_id }" class="genric-btn primary-border circle medium" type="button" onclick="manageMember('${dto.member_id}');" value="${dto.member_join == 'Y' ? '계정 잠그기' : '계정 풀기' }" /></td>
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
					<jsp:param value="Member" name="board_category" />
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