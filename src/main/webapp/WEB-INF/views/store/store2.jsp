<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 페이지</title>

<style type="text/css">

	.product_list{
        width: 1260px;
		height: 630px;
	}
	.product_section {
    	 border-top: none;
 		 display: grid;
    	 grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
 		 gap: 3rem 1rem;
    	 padding: 3rem 0;
    	 margin: 0 1.5rem;
    	 border-top: 4px solid #ccc;
	}
	.product_container {
  		display: flex;
  		flex-direction: column; 		
	}
	.product_image {
		border-radius:12px;
  		width: 100%;
  		height: 100%;
  		max-height:180px;
  		min-height:180px;
  		background-color:grey;
	}
	.product_bottom_section {
  		text-align:center;
 		margin-top:5px; 		 
	}	
	.product_details {
		  display: flex;
  	      flex-direction: column;	     
	}
	.product_details .product_title {
  		font-size: 1.1rem;
  		font-weight: bold;
  		margin-bottom: 0.5rem;
  		text-decoration: none;
  		color: grey;
	}
	.product_title:hover{
		color:black;
	}
	.product_details p{
		margin:0px;
	}
	
</style>

</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<h1>상품 페이지</h1>
	
		<div class="product_list">
			<section class="product_section">
				
				<c:choose>
					<c:when test="${empty list }">
						<p>등록된 상품이 없습니다.</p>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list }" var="dto">
			 			<div class="product_container">
			 				<a href="store_select.do?product_no=${dto.product_no }"><img class="product_image" src="resources/upload/${dto.file_new_name }"></a>       
         					<div class="product_bottom_section">
           						<div class="product_details">
           							<p>${dto.product_del } | ${dto.product_category }</p>
              						<a class="product_title" href="store_select.do?product_no=${dto.product_no }">${dto.product_name }</a>
             						<p class="product_price">${dto.product_price } 원</p>
             						<p>
			             				<c:choose>
											<c:when test="${empty rlist}">
												리뷰없음
											</c:when>
											<c:otherwise>
												<c:forEach items="${rlist }" var="rdto">
													<c:set var="product_no" value="${dto.product_no }" />
													<c:set var="review_no" value="${rdto.product_no }" />
													<c:set var="rate" value="${rdto.review_rate }" />
													<c:if test="${product_no eq review_no}">
														<c:set var="sum" value="${sum + rate }" />
														<c:set var="cnt" value="${cnt + 1 }" />
													</c:if>
												</c:forEach>
												${sum/cnt }
											</c:otherwise>
										</c:choose>
             						</p>
              					</div>
         					</div>
       					</div>
       			 		</c:forEach>
       				</c:otherwise>
       			</c:choose>
       			<input type="button" value="상품 작성" onclick="location.href='store_insertform.do'"/>
            </section>
		</div>
		
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>