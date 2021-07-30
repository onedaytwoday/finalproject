<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Class</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="resources/js/sockjs.min.js"></script>

<script type="text/javascript">
	let checked
	$(function(){
		
		$("#search_category").change(function(){
			let category = $("select > option:selected").val();
			checked = category == 'title+desc+category'
		});
		
		<%--
		$("[name=search_keyword]:eq(0)").on("propertychange change keyup paste input", function() {
			$.ajax({
				type: "post",
				url: "autoComplete.do",
				data: JSON.stringify({"keyword" : $("[name=search_keyword]:eq(0)").val()}),
				contentType: "application/json",
				dataType: "json",
				success: function(result) {
					let list = result.list;

					for(let i=0; i<list.length; i++) {
						let input = $("<input type='text' class='form-control bg-white' value=" + list[i] +" readonly />")
						$("#auto_result").append(input)												
					}
					
				},
				error: function() {
					alert("통신 실패!");
				}
			});
		});
		--%>
		$("[name=search_keyword]:eq(0)").change(function(){
			$.ajax({
				type: "post",
				url: "auto_class.do",
				data: JSON.stringify({"keyword" : $("[name=search_keyword]:eq(0)").val()}),
				contentType: "application/json",
				dataType: "json",
				success: function(result) {
					console.log(result.list);
					let list = result.list;

					for(let i=0; i<list.length; i++) {
						let input = $("<input type='text' class='form-control bg-white' value=" + list[i] +" readonly />")
						$("#auto_result").append(input)												
					}
					
				},
				error: function() {
					alert("통신 실패!");
				}
			});
		})
		
		
		
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
	});
	
	function ranking(){
		if(checked){
			let list = ['class', $("[name='search_keyword']:eq(0)").val()]
			sock.send(list);		
		}
	}
	// 나가기 버튼
	function exit(){
		sock.close();
	}		
	
	let sock = new SockJS("${pageContext.request.contextPath}/rank");		
	// 연결끊기면 
	sock.onclose = function(e){
		console.log(e);
		$(location).attr('href',"classList.do?nowPage=1");
	}	
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<div class="slider-area" style="margin-bottom: 150px;">
		<div class="single-slider slider-height2 d-flex align-items-center">
			<div class="container">
				<div class="row">
					<div class="col-xl-12">
						<div class="hero-cap text-center">
							<c:choose>
								<c:when test="${empty category }">
									<h2>Class</h2>
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
	<main class="container mb-100">
		<div class="row product-btn justify-content-between mb-40">
                    <div class="properties__button">
                        <!--Nav Button  -->
                        <nav>                                                      
                            <div class="nav nav-tabs" id="nav-tab" >
                                <a class="nav-item nav-link" id="nav-home-tab" href="classList.do?nowPage=1">All</a>
                                <a class="nav-item nav-link" id="nav-handmade-tab" href="class_category.do?category=handmade&nowPage=1">handmade</a>
                                <a class="nav-item nav-link" id="nav-cooking-tab"href="class_category.do?category=cooking&nowPage=1">cooking</a>
                                <a class="nav-item nav-link" id="nav-flower-tab" href="class_category.do?category=flower&nowPage=1">flower</a>
                                <a class="nav-item nav-link" id="nav-drawing-tab" href="class_category.do?category=drawing&nowPage=1">drawing</a>
                                <a class="nav-item nav-link" id="nav-music-tab" href="class_category.do?category=music&nowPage=1">music</a>
                            	<a class="nav-item nav-link" id="nav-yoga-tab" href="class_category.do?category=yoga&nowPage=1">yoga</a>
                            </div>
                        </nav>
                    </div>
                </div>
		<section class="blog_area section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 mb-5 mb-lg-0">
                        <div class="blog_left_sidebar">
                        	<c:choose>
                        		<c:when test="${empty list }">
									<p>--------등록된 클래스가 없습니다.---------</p>
								</c:when>
		
								<c:otherwise>
									<c:forEach items="${list }" var="dto">
										<article class="blog_item">
			                                <div class="blog_item_img">
			                                    <img class="card-img rounded-0" src="resources/assets/img/blog/single_blog_1.png" alt="">
			                                </div>
			
			                                <div class="blog_details">
			                                    <a class="d-inline-block" href="classSelect.do?class_no=${dto.class_no }">
			                                       	<h2>${dto.class_title }</h2>	
			                                    </a>
			                                    <p>${dto.class_desc }</p>
			                                    <ul class="blog-info-link">
			                                        <li><a href="#"><i class="bi bi-tag-fill"></i> ${dto.class_category }</a></li>
			                                        <li><a href="#"><i class="bi bi-geo-alt"></i> ${dto.class_loc } </a></li>
			                                    </ul>
			                                    
			                                    <c:if test="${dto.member_id eq mDto.member_id }">
													<button
														onclick="location.href='classDelete.do?class_no=${dto.class_no}'"
														type="button" class="btn btn-warning">삭제</button>
												</c:if>
			                                </div>
		                            	</article>
	                            	</c:forEach>
								</c:otherwise>
                        	</c:choose>
                        </div>
                    </div>
                    
                    <div class="col-lg-4">
                        <div class="blog_right_sidebar">
	                    	<c:if test="${mDto.member_grade eq '강사회원' }">
								<button type="button" class="genric-btn primary-border mb-2" style="width:100%;" onclick="location.href='classInsert.do'"><i class="bi bi-pencil-fill"></i> 클래스 등록</button>
							</c:if>
						
                            <aside class="single_sidebar_widget search_widget">
                                <form action="class_search.do" method="post">
                                	<input type="hidden" name="nowPage" value="1">
                                    <div class="form-group">  
                                    	<div class="default-select" id="default-select">
											<select class="shipping_select" id="search_category" name="search_category">
												<option value="nickname" selected>닉네임</option>
												<option value="title+desc+category">클래스명+설명+내용</option>
											</select>
										</div>
										
                                        <div id="searchInput" class="input-group ">
                                            <input type="text" class="d-block form-control" name="search_keyword" placeholder="Search term..." autocomplete=off
                                                onfocus="this.placeholder = ''"
                                                onblur="this.placeholder = 'Search term...'">
                                        </div>
                                        
                                        <div id="auto_result">
                                        	
                                        </div>
                                    </div>
                                    <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
                                        type="submit" onclick="ranking()">Search</button>
                                </form>
                            </aside>
                        </div>
                    </div>
                    
                </div>
            </div>
        </section>
					<jsp:include page="/WEB-INF/views/paging.jsp">
						<jsp:param value="C" name="class_list" />
						<jsp:param value="${pDto.class_category }" name="class_category" />
						<jsp:param value="${pDto.search_category }" name="class_search_category" />
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