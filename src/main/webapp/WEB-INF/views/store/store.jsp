<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>상품 페이지</title>
<style type="text/css">

	.product_header{
		margin-left: 5.5rem;		
	}
	.product_list{
        width: 1260px;
		height: 630px;
	}
	.product_section {
		 text-align: center;
    	 border-top: none;
 		 display: grid;
    	 grid-template-columns: repeat(auto-fill, minmax(230px, 1fr));
 		 gap: 3rem 1rem;
    	 padding: 1.5rem 0;
    	 margin: 0 1.5rem;
    	 border-top: 2px solid black;
	}
	.product_container {
  		display: flex;
  		flex-direction: column; 		
	}
	.product_image {
		border-radius: 1rem;
  		width: 100%;
  		height: 100%;
  		max-height:10rem;
  		max-width:10rem;
  		min-height:10rem;
  		min-width:10rem;
  		background-color:grey;
	}
	.product_bottom_section {

 		margin-top:5px; 		 
	}	
	.product_details {
		  display: flex;
  	      flex-direction: column;	     
	}

	.product_details p{
		margin:2px;
	}
	.product_del{
		text-color:grey;
	}
	#paging{
		text-align:center;
		background-color:skyblue;
		font-weight:bold;
	}
	.insert_btn{
		margin: 0px 90px 8px;
	}
	
</style>

</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

	<h1 class="product_header">스토어</h1>
	<input class="insert_btn" type="button" value="상품 등록" onclick="location.href='store_insertform.do'"/>

		<div class="search">
			<form action="store_search.do" method="post">
			<input type="hidden" name="nowPage" value="1">
			<input type="text" class="search_keyword" name="search_keyword" placeholder="Search term...">
	        <input type="submit" value="검색" />
	         </form>
		</div>
		
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
           							<p class="product_del">${dto.product_del } | ${dto.product_category }</p>
              						<P>${dto.product_name }</P>
             						<p class="product_price">${dto.product_price } 원</p>
             						<p>평점 
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
            </section>
		</div>
					<jsp:include page="/WEB-INF/views/paging.jsp">
						<jsp:param value="S" name="store_category" />
						<!-- 질문 PAGING.JSP -->
						<jsp:param value="${pDto.search_category }" name="ca" />
						<jsp:param value="${pDto.nowBlock}" name="nowBlock" />
						<jsp:param value="${pDto.blockBegin }" name="blockBegin" />
						<jsp:param value="${pDto.blockEnd }" name="blockEnd" />
						<jsp:param value="${pDto.nowPage}" name="nowPage" />
						<jsp:param value="${pDto.blockBegin}" name="blockBegin" />
						<jsp:param value="${pDto.blockEnd}" name="blockEnd" />
						<jsp:param value="${pDto.totalBlock}" name="totalBlock" />
					</jsp:include>
		

<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>