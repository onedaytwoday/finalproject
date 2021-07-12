<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="resources/js/admin.js"></script>
</head>
<body>
	<div style="height: 100vh; display: flex">
      <!-- Side Menu -->
      <jsp:include page="admin_menu.jsp"></jsp:include>

      <!-- Content -->
      <div style="margin: 5rem 0; width: 80%">
      
      	<div>
      		<input type="button" onclick="deleteChecked()" value="삭제" />
      	</div>
      
      	<table style="margin-top: 3rem;" border="1">
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
						<th colspan="7">------------등록된 상품이 존재하지 않습니다.------------</th>
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
		</table>
		
		<table style="margin-top: 3rem;" border="1">
			<col width="50" />
			<col width="150" />
			<col width="150" />
			<col width="150" />
			<col width="150" />
			<col width="200" />
			<col width="150" />
			<col width="150" />
			<col width="150" />
			
			<tr>
				<th><input type="checkbox" onclick="allCheck(this.checked, 'class')" /></th>
				<th>클래스 사진</th>
				<th>작성자</th>
				<th>클래스 이름</th>
				<th>클래스 가격</th>
				<th>카테고리</th>
				<th>할인율</th>
				<th>모집인원</th>
				<th>위치</th>
			</tr>
			
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
							<td>사진</td>
							<td>${dto.member_id }</td>
							<td><a href="classDetail.do?class_no=${dto.class_no }">${dto.class_title }</a></td>
							<td>${dto.class_price }</td>
							<td>${dto.class_category }</td>
							<td>${dto.class_sale }</td>
							<td>${dto.class_member_num }</td>
							<td>${dto.class_loc }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
      </div>
    </div>
</body>
</html>