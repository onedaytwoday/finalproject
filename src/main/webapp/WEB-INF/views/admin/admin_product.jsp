<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script type="text/javascript" src="resources/js/admin.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	
	<main class="container">
		<div style="display: flex">
	      <!-- Side Menu -->
	      <jsp:include page="admin_menu.jsp"></jsp:include>
	
	      <!-- Content -->
	      <div style="margin: 5rem 0; width: 80%">      
	      	<table border="1">
				<col width="50" />
				<col width="150" />
				<col width="150" />
				<col width="200" />
				<col width="150" />
				<col width="150" />
				<col width="150" />
				
				<tr>
					<th><input type="checkbox" onclick="allCheck(this.checked, 'product')" /></th>
					<th>상품 사진</th>
					<th>상품 이름</th>
					<th>상품 가격</th>
					<th>카테고리</th>
					<th>할인율</th>
					<th>위치</th>
					<th>배송 여부</th>
				</tr>
				
				<c:choose>
					<c:when test="${empty proList }">
						<tr>
							<th colspan="8">------------등록된 상품이 존재하지 않습니다.------------</th>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${proList }" var="dto">
							<tr>
								<td><input type="checkbox" name="chk_product" value="${dto.product_no }" /></td>
								<td>사진</td>
								<td><a href="store_select.do?product_no=${dto.product_no }">${dto.product_name }</a></td>
								<td>${dto.product_price }</td>
								<td>${dto.product_category }</td>
								<td>${dto.product_sale }</td>
								<td>${dto.product_loc }</td>
								<td>${dto.product_del }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<tr>
					<td colspan="8" align="right">
						<input type="button" value="삭제" onclick="deleteChecked('product')" />
					</td>
				</tr>
			</table>
			
			<jsp:include page="/WEB-INF/views/paging.jsp">
				<jsp:param value="Product" name="board_category" />
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
    </main>
    
    <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>