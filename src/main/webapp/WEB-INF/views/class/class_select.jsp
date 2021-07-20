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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css"
    />  
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>  
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<main class="container">
		<div class="mb-4 text-white rounded bg-dark">
		    <div class="col-md-6 px-0">
		      <img class="w-full image-fluid" alt="class" src="resources/images/event.jpg">
			</div>
		</div>

	  <div class="row g-5">
	    <div class="col-md-7">
	      <h3 class="pb-4 mb-4 border-bottom">
	        ${dto.class_title }
	      </h3>
	
	      <article class="blog-post">
	        <h4 class="blog-post-title">
				<span>
					<c:set var="sum" value="0" />
					<c:set var="cnt" value="0" />
					<c:choose>
						<c:when test="${empty list}">
							리뷰없음
						</c:when>
						<c:otherwise>
							<c:forEach items="${list }" var="rdto">
								<c:set var="rate" value="${rdto.review_rate }" />
								<c:set var="sum" value="${sum + rate }" />
								<c:set var="cnt" value="${cnt + 1 }" />
							</c:forEach>
							<fmt:parseNumber var="avg" integerOnly="true" value="${sum/rate }"/>
							<c:choose>
								 <c:when test="${avg eq 1 }">
								  	<i class="bi bi-star-fill"></i>
								 </c:when> 
								 <c:when test="${avg > 1 }">
								 	<i class="bi bi-star-fill"></i>
								 	<i class="bi bi-star-fill"></i>
								 </c:when>
								 <c:when test="${avg > 2 }">
								  	<i class="bi bi-star-fill"></i>
								  	<i class="bi bi-star-fill"></i>
								  	<i class="bi bi-star-fill"></i>
								 </c:when>
								 <c:when test="${avg > 3 }">
								  	<i class="bi bi-star-fill"></i>
								  	<i class="bi bi-star-fill"></i>
								  	<i class="bi bi-star-fill"></i>
								  	<i class="bi bi-star-fill"></i>
								 </c:when>
								 <c:otherwise>
								  	<i class="bi bi-star-fill"></i>
								  	<i class="bi bi-star-fill"></i>
								  	<i class="bi bi-star-fill"></i>
								  	<i class="bi bi-star-fill"></i>
								  	<i class="bi bi-star-fill"></i>
								 </c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</span>	        
	        </h4>
	        
	        <p class="my-3">${dto.class_desc }</p>
			
			<p>주소 : ${dto.class_loc }</p>
			
			<p>가격 : ${dto.class_price }원</p>
			
			<p>
				Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam at convallis dui, ut convallis neque. Nunc sollicitudin sem diam, 
				vitae maximus dolor pretium sed. Cras viverra justo ac elit consectetur, tincidunt lobortis massa interdum. Mauris fermentum in odio pretium posuere. 
				Nullam commodo sapien in diam eleifend, nec gravida lacus tincidunt. Nulla ut rhoncus elit, vel aliquam nulla. Vestibulum congue maximus nisl, blandit blandit turpis efficitur quis. 
				Praesent dapibus feugiat justo at mollis. Nunc nunc neque, vehicula sed magna ac, sollicitudin sodales lacus. Maecenas id nunc quis arcu faucibus tincidunt eget nec odio. Duis suscipit faucibus mi, 
				at dapibus nisi venenatis eu. Ut diam tellus, porta nec auctor a, imperdiet quis nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. 
				Proin vitae odio id nisl aliquam pellentesque quis sit amet tellus. Nam in feugiat nibh. In sodales mi tortor, non accumsan nunc sodales accumsan.
			</p>
			
			<p>
				Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam at convallis dui, ut convallis neque. Nunc sollicitudin sem diam, 
				vitae maximus dolor pretium sed. Cras viverra justo ac elit consectetur, tincidunt lobortis massa interdum. Mauris fermentum in odio pretium posuere. 
				Nullam commodo sapien in diam eleifend, nec gravida lacus tincidunt. Nulla ut rhoncus elit, vel aliquam nulla. Vestibulum congue maximus nisl, blandit blandit turpis efficitur quis. 
				Praesent dapibus feugiat justo at mollis. Nunc nunc neque, vehicula sed magna ac, sollicitudin sodales lacus. Maecenas id nunc quis arcu faucibus tincidunt eget nec odio. Duis suscipit faucibus mi, 
				at dapibus nisi venenatis eu. Ut diam tellus, porta nec auctor a, imperdiet quis nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. 
				Proin vitae odio id nisl aliquam pellentesque quis sit amet tellus. Nam in feugiat nibh. In sodales mi tortor, non accumsan nunc sodales accumsan.
			</p>
	
	
			<p>
				Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam at convallis dui, ut convallis neque. Nunc sollicitudin sem diam, 
				vitae maximus dolor pretium sed. Cras viverra justo ac elit consectetur, tincidunt lobortis massa interdum. Mauris fermentum in odio pretium posuere. 
				Nullam commodo sapien in diam eleifend, nec gravida lacus tincidunt. Nulla ut rhoncus elit, vel aliquam nulla. Vestibulum congue maximus nisl, blandit blandit turpis efficitur quis. 
				Praesent dapibus feugiat justo at mollis. Nunc nunc neque, vehicula sed magna ac, sollicitudin sodales lacus. Maecenas id nunc quis arcu faucibus tincidunt eget nec odio. Duis suscipit faucibus mi, 
				at dapibus nisi venenatis eu. Ut diam tellus, porta nec auctor a, imperdiet quis nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. 
				Proin vitae odio id nisl aliquam pellentesque quis sit amet tellus. Nam in feugiat nibh. In sodales mi tortor, non accumsan nunc sodales accumsan.
			</p>
	
	
	
	
			<button onclick="location.href='classList.do'" type="button" class="btn btn-secondary">클래스 목록 보기</button>
			
			<c:if test="${dto.member_id eq mDto.member_id }">
				<button onclick="location.href='classUpdate.do?class_no=${dto.class_no}'" type="button" class="btn btn-warning">수정</button>								
			</c:if>
	        
	      </article>
	
	    </div>
	
	    <div class="col-md-5">
	      <div class="position-sticky" style="top: 5rem;">
	        <div class="p-4 mb-3 bg-light rounded">
	        	<jsp:include page="class_calendar.jsp"></jsp:include>
	        	
	        	<c:if test="${mDto.member_id != null && mDto.member_grade == '일반회원'}">
					<form class="mt-3" action="payment.do" method="post">					
						<input type="hidden" name="detail_no" />
						<input type="hidden" name="payment_num" value="1" />
						<input type="hidden" name="payment_price" value="${dto.class_price }" />
						<input type="hidden" name="product_name" value="${dto.class_title }" />
						<input type="hidden" name="type" value="class" />
							
						<input style="border:none; outline:none;" type="text" name="detail_date" readonly />
						<button type="submit" class="btn btn-primary">결제하기</button>
						<button onclick="location.href='review_insert_class.do?class_no=${dto.class_no}&class_title=${dto.class_title }'" type="button">리뷰작성</button>
					</form>
				</c:if>
	          
	        </div>
	      </div>
	    </div>
	  </div>
	</main>

	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

<%--아래 지도코드 -------------------------------------------------------------------------------------------------------------------------%>
<div id="staticMap" style="width:600px;height:350px;"></div> 
<%--아래 api코드 두개쓴것 둘중하나라도 지우면 안됨(지도api두가지를 합친것!) --%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b09278ee8c0d306e4d38397589fed58d&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b09278ee8c0d306e4d38397589fed58d"></script>
<script>

//클래스 주소
var classadd = '${dto.class_loc }';//나중에 클래스에서 주소값을 받기로 한다.

//클래스명
var classname= '${dto.class_title }';//나중에 클래스에서 클래스명을 받기로 한다...

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
//주소로 좌표를 검색합니다
geocoder.addressSearch(classadd, function(result, status) {

// 이미지 지도에 표시할 마커입니다
// 이미지 지도에 표시할 마커를 아래와 같이 배열로 넣어주면 여러개의 마커를 표시할 수 있습니다 
var markers = [
    {
        position: new kakao.maps.LatLng(result[0].y, result[0].x)
    },
    {
        position: new kakao.maps.LatLng(result[0].y, result[0].x), 
        text: classname // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다     
    }
];

var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
    staticMapOption = { 
        center: new kakao.maps.LatLng(result[0].y, result[0].x), // 이미지 지도의 중심좌표
        level: 3, // 이미지 지도의 확대 레벨
        marker: markers // 이미지 지도에 표시할 마커 
    };    

// 이미지 지도를 생성합니다
var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
}); 



</script>


	
</body>
</html>