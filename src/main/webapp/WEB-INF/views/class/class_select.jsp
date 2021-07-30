<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>  
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<div class="slider-area" style="margin-bottom: 150px;">
		<div class="single-slider slider-height2 d-flex align-items-center">
			<div class="container">
				<div class="row">
					<div class="col-xl-12">
						<div class="hero-cap text-center">
							<h2>Class Detail</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<main class="container mb-100">
		<div class="row" style="margin-bottom: 50px">
			<div class="col-xl-12" align="center">
				<img class="w-full image-fluid" alt="class" src="resources/upload/${dto.file_new_name }">
			</div>
		</div>

		<div class="row g-5">
			<div class="col-lg-7">
				<div class="d-md-flex justify-content-between pb-4 mt-2 mb-4 border-bottom">	
					<h3>${dto.class_title }</h3>
					
					<div class="text-center">
						<c:choose>
							<c:when test="${event != null and event.event_noti eq 'Y' and dto.class_sale > 0 }">
								<h5><del>${dto.class_price }원</del></h5>
								<h3 class="font-weight-bold text-monospace text-danger">${dto.class_sale }% 할인중!!</h3>
							</c:when>
							<c:otherwise>
								<h4>${dto.class_price }원</h4>					
							</c:otherwise>
						</c:choose>
					</div>
				</div>

				<article class="blog-post">
					<div class="d-md-flex justify-content-between mb-2">
						<div>
							<img style="width:30px; height: 30px;" alt="map" src="resources/images/map.png"> ${dto.class_loc }						
						</div>
						
						<div>
							<c:choose>
								<c:when test="${rate > 4 }">
									<i class="bi bi-star-fill"></i>
									<i class="bi bi-star-fill"></i>
									<i class="bi bi-star-fill"></i>
									<i class="bi bi-star-fill"></i>
									<i class="bi bi-star-fill"></i>
								</c:when>
								<c:when test="${rate > 3 }">
									<i class="bi bi-star-fill"></i>
									<i class="bi bi-star-fill"></i>
									<i class="bi bi-star-fill"></i>
									<i class="bi bi-star-fill"></i>
									<i class="bi bi-star"></i>
								</c:when>
								<c:when test="${rate > 2 }">
									<i class="bi bi-star-fill"></i>
									<i class="bi bi-star-fill"></i>
									<i class="bi bi-star-fill"></i>
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
								</c:when>
								<c:when test="${rate > 1 }">
									<i class="bi bi-star-fill"></i>
									<i class="bi bi-star-fill"></i>
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
								</c:when>
								<c:when test="${rate > 0 }">
									<i class="bi bi-star-fill"></i>
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
								</c:when>
								<c:when test="${rate == 0 }">
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
								</c:when>
							</c:choose>
						</div>					
					</div>
						
					<div id="map" style="width:650px;height:350px;margin-bottom: 40px;"></div> 
					<c:forEach items="${fList }" var="dto">
						<img src="resources/upload/${dto.file_new_name }" width="100%" height="100%" alt="상품" style="margin-bottom: 40px;">
					</c:forEach>
					<p>${dto.class_desc }</p>
				</article>

				<div class="comments-area">
					<h4>${rList.size() } Comments</h4>
					
					<c:if test="${rList.size() > 0 }">
						<c:forEach items="${rList }" var="dto">
							<div class="comment-list">
								<div class="single-comment justify-content-between d-flex">
									<div class="user justify-content-start d-flex w-100">
										<div class="thumb">
											<img src="resources/assets/img/comment/comment_1.png" alt="">
										</div>
										<div class="desc">
											<div class="d-md-flex justify-content-between">
												<p class="comment">${dto.review_content }</p>
												<div>${dto.review_rate }</div>
											</div>
											
											<div class="d-flex justify-content-between">
												<div class="d-flex align-items-center">
													<span>
														${dto.member_id }
													</span>
													<p class="date"><fmt:formatDate value="${dto.review_date }" pattern="yyyy/MM/dd hh:mm a"/></p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
				
				<c:if test="${mDto.member_id != null && mDto.member_grade == '일반회원'}">
					<div class="comment-form">
						<div class="form-group">
							<button onclick="location.href='review_insert_class.do?class_no=${dto.class_no}&class_title=${dto.class_title }'" class="button button-contactForm btn_1 boxed-btn">리뷰 작성하기</button>
						</div>					
					</div>
				</c:if>
				
				<c:if test="${mDto.member_grade eq '강사회원' }">
					<button onclick="location.href='classUpdate.do?class_no=${dto.class_no}'"
						type="button" class="genric-btn warning circle ml-auto"><i class="bi bi-pencil-fill"></i> 수정</button>
				</c:if>
			</div>

			<div class="col-lg-5">
				<div class="position-sticky" style="top: 10rem;">
					<div class="p-4 mb-3 bg-light rounded">
					
						<jsp:include page="class_calendar.jsp"></jsp:include>

						<c:if test="${mDto.member_id != null && mDto.member_grade == '일반회원'}">
							<form class="mt-3" action="payment.do" method="post">
								<input type="hidden" name="detail_no" /> 
								<input type="hidden" name="payment_num" value="1" /> 
								<fmt:formatNumber type="number" maxFractionDigits="0" value="${dto.class_price * (dto.class_sale / 100) }" var="sale" />
								<input type="hidden" name="payment_price" value="${dto.class_sale > 0 ? (dto.class_price - sale) : dto.class_price }" /> 
								<input type="hidden" name="product_name" value="${dto.class_title }" />
								<input type="hidden" name="type" value="class" /> 
								
								<span id="detail_date"></span>
								<button type="submit" class="button btn_1 boxed-btn" >결제하기</button>
							</form>
						</c:if>
					</div>
				</div>
			</div>

		</div>
	</main>

<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

<%--아래 지도코드 -------------------------------------------------------------------------------------------------------------------------%>

<%--아래 api코드 두개쓴것 둘중하나라도 지우면 안됨(지도api두가지를 합친것!) --%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b09278ee8c0d306e4d38397589fed58d&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b09278ee8c0d306e4d38397589fed58d"></script>
<script>
	//클래스 주소
	$.ajax({
           url:'https://dapi.kakao.com/v2/local/search/address.json?query='+encodeURIComponent('${dto.class_loc }'),
           type:'GET',
           datatype: 'json',
           headers: {'Authorization' : 'KakaoAK 0704a24e218cc486b2613072fabc7239'},
	   success:function(data){
			var x = data.documents[0].address.x;
			var y = data.documents[0].address.y;
			var classname= '${dto.class_title }';
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(y, x), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };

			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
			// 마커가 표시될 위치입니다 37.5114167909
			var markerPosition  = new kakao.maps.LatLng(y, x); 
			var text = "<div class='tex' style='font-size:10pt;'>" + classname + "<br></div>";
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition,
			});
	
			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
			var infowindow = new kakao.maps.InfoWindow({
			    position : markerPosition, 
			    content : text 
			});
			infowindow.open(map, marker);
			
			$('.tex').parent().width('1000px');
		   },
		   error : function(e){
		       console.log(e);
		   }
	
	}); 
</script>

	
</body>
</html>