<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                	<h1 class="h3 mb-4 text-gray-800">결제 내역</h1>
                	
                	<!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">구매한 상품/클래스</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered text-center align-items-center" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>번호</th>
											<th>카테고리</th>
											<th>수량</th>
											<th>총 가격</th>
											<th>배송상태</th>
                                        </tr>
                                    </thead>
                                    
                                    <tfoot>
                                        <tr>
                                            <th>번호</th>
											<th>카테고리</th>
											<th>수량</th>
											<th>총 가격</th>
											<th>배송상태</th>
                                        </tr>
                                    </tfoot>
                                    
                                    <tbody>
										<c:choose>
											<c:when test="${empty pList }">
												<tr><th colspan="5">-----------------구매하신 상품/클래스가 없습니다-------------</th></tr>
											</c:when>
											<c:otherwise>
												<c:forEach items="${pList }" var="dto">
	                                    			<c:set var="cnt" value="${cnt + 1}"/>
													<tr>
														<td>${cnt }</td>
														<c:choose>
															<c:when test="${dto.basket_group > 0 }">
																<td>장바구니</td>
															</c:when>
															<c:when test="${dto.product_no > 0 }">
																<td><a href="store_select.do?product_no=${dto.product_no }">${dto.product_name }</a></td>
															</c:when>
															<c:when test="${dto.detail_no > 0 }">
																<td><a href="classSelect.do?class_no=${dto.class_no }">${dto.product_name }</a></td>
															</c:when>
														</c:choose>
														<td>${dto.payment_num }개</td>
														<td>${dto.payment_price }원</td>
														
														<c:choose>
															<c:when test="${dto.payment_del == '결제완료' and dto.detail_no == 0}">
																<td><input class="genric-btn primary-border circle medium" type="button" onclick="cancelPayment(${dto.payment_no})" value="결제 취소" /></td>
															</c:when>
															
															<c:otherwise>
																<td>${dto.payment_del }</td>
															</c:otherwise>
														</c:choose>
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
					<jsp:param value="payment" name="board_category" />
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