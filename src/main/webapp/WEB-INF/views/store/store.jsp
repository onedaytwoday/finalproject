<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Store</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="resources/js/sockjs.min.js"></script>

<script type="text/javascript">
	$(function(){
		let category = "${category}";
		if(category == "handmade"){
			$('#nav-handmade-tab').addClass("active");
		}else if(category == "cooking"){
			$('#nav-cooking-tab').addClass("active");
		}else if(category == "flower"){
			$('#nav-flower-tab').addClass("active");
		}else if(category == "drawing"){
			$('#nav-drawing-tab').addClass("active");
		}else if(category == "music"){
			$('#nav-music-tab').addClass("active");
		}else if(category == "yoga"){
			$('#nav-yoga-tab').addClass("active");
		}else if(category == ""){
			$('#nav-home-tab').addClass("active");
		}
		
		$("[name=search_keyword]:eq(0)").change(function(){
			$.ajax({
				type: "post",
				url: "auto_product.do",
				data: JSON.stringify({"keyword" : $("[name=search_keyword]:eq(0)").val()}),
				contentType: "application/json",
				dataType: "json",
				success: function(result) {
					console.log(result.list);
					let list = result.list;

					for(let i=0; i<list.length; i++) {
						let input = $("<input type='text' class='form-control bg-white' value=" + list[1] +" readonly />")
						$("#auto_result").append(input)												
					}
					
				},
				error: function() {
					alert("통신 실패!");
				}
			});
		});
	});

	function ranking(){
		let list = ['product', $("[name='search_keyword']:eq(0)").val()]
		sock.send(list);
	}
	
	let sock = new SockJS("${pageContext.request.contextPath}/rank");		
	
	// 연결끊기면 
	sock.onclose = function(e){
		console.log(e);
		$(location).attr('href',"store.do?nowPage=1");
	}	
</script>

</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<main class="container">
		<div class="slider-area" style="margin-bottom: 150px;">
        <div class="single-slider slider-height2 d-flex align-items-center">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center">
                            <c:choose>
								<c:when test="${empty category }">
									<h2>Product</h2>
								</c:when>
								<c:otherwise>
									<h2>${category }</h2>
								</c:otherwise>
							</c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </div>
   		 </div>
   		 <div class="row product-btn justify-content-between mb-40">
                    <div class="properties__button">
                        <!--Nav Button  -->
                        <nav>                                                      
                            <div class="nav nav-tabs" id="nav-tab" >
                                <a class="nav-item nav-link" id="nav-home-tab" href="store.do?nowPage=1">All</a>
                                <a class="nav-item nav-link" id="nav-handmade-tab" href="store_category.do?category=handmade&nowPage=1">handmade</a>
                                <a class="nav-item nav-link" id="nav-cooking-tab"href="store_category.do?category=cooking&nowPage=1">cooking</a>
                                <a class="nav-item nav-link" id="nav-flower-tab" href="store_category.do?category=flower&nowPage=1">flower</a>
                                <a class="nav-item nav-link" id="nav-drawing-tab" href="store_category.do?category=drawing&nowPage=1">drawing</a>
                                <a class="nav-item nav-link" id="nav-music-tab" href="store_category.do?category=music&nowPage=1">music</a>
                            	<a class="nav-item nav-link" id="nav-yoga-tab" href="store_category.do?category=yoga&nowPage=1">yoga</a>
                            </div>
                        </nav>
                    </div>
                </div>
		<div class="blog_right_sidebar w-25 ml-auto">
			<c:if test="${mDto.member_grade eq '강사회원' }">
				<button type="button" class="genric-btn primary-border mt-5 mb-2" style="width:100%;" onclick="location.href='store_insertform.do'"><i class="bi bi-pencil-fill"></i> 상품 등록</button>
			</c:if>
                        
            <aside class="single_sidebar_widget search_widget">
            	<form action="store_search.do" method="post">
                 	<input type="hidden" name="nowPage" value="1">
                
                    <div class="form-group">  										
                    	<div class="input-group">
                        	<input type="text" class="form-control" name="search_keyword" placeholder="Search term..." onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search term...'">
                        </div>
                    </div>
                    
                    <div id="auto_result"></div>
                                        
                    <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn" type="submit" onclick="ranking()">검색</button>
                </form>
            </aside>
		</div>
	
		<section class="popular-items mt-5">
        	<c:choose>
				<c:when test="${empty list }">
					<p>등록된 상품이 없습니다.</p>
				</c:when>
				<c:otherwise>
						<div class="tab-content" id="nav-tabContent">
				            <div
				              class="tab-pane fade show active"
				              id="nav-home"
				              role="tabpanel"
				              aria-labelledby="nav-home-tab"
				            >
				              <div class="row">
								<c:forEach items="${list }" var="dto">
					                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
					                  <div class="single-popular-items mb-50 text-center">
					                    <div class="popular-img">
					                      <img src="resources/assets/img/gallery/popular1.png" alt="" />
					                      
					                    </div>
					                    <div class="popular-caption">
					                      <p>${dto.product_del } | ${dto.product_category }</p>
					                      <h3>
					                        <a href="store_select.do?product_no=${dto.product_no }">${dto.product_name }</a>
					                      </h3>
					                      <span>${dto.product_price } 원</span>
					                      
					                    </div>
					                  </div>
					                </div>
          						</c:forEach>
				              </div>
				            </div>
			        	</div>
       			</c:otherwise>
       		</c:choose>	          
      </section>
      
      <jsp:include page="/WEB-INF/views/paging.jsp">
      	<jsp:param value="S" name="store_list"/>
		<jsp:param value='${pDto.product_category }' name="product_category" />
		<jsp:param value="${pDto.search_keyword }" name="search_keyword"/>
		<jsp:param value="${pDto.nowBlock}" name="nowBlock" />
		<jsp:param value="${pDto.blockBegin }" name="blockBegin" />
		<jsp:param value="${pDto.blockEnd }" name="blockEnd" />
		<jsp:param value="${pDto.nowPage}" name="nowPage" />
		<jsp:param value="${pDto.blockBegin}" name="blockBegin" />
		<jsp:param value="${pDto.blockEnd}" name="blockEnd" />
		<jsp:param value="${pDto.totalBlock}" name="totalBlock" />
	  </jsp:include>
	</main>


<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>