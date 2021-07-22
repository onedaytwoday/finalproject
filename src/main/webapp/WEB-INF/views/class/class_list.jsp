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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="resources/js/sockjs.min.js"></script>

<script type="text/javascript">
	let checked
	$(function(){
			$.ajax({
				type: 'post',
				url: 'rank_list.do',
				data: JSON.stringify(),
				contentType: "application/json",
				dataType: "json",
				success: function(data) {
					var tmp = data['list'];
					for(var i=0;i<tmp.length;i++){
						var rank_name = tmp[i]['rank_name'];
						var rank_no = tmp[i]['rank_no'];
						$('.search_ul').append("<li>" + rank_no +"순위&nbsp;&nbsp;" + rank_name +"</li>");
					}
				},
				error: function() {
					alert("통신 실패!");
				}
			});
		
		
		$("#search_category").change(function(){
			let category = $("select > option:selected").val();
			checked = category == 'title+desc+category'
		});		
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
	<main class="container mb-100">
		<ul class="search_ul"></ul>
		
		<div class="search">
			<form action="class_search.do" method="post">
				<input type="hidden" name="nowPage" value="1">
				<select id="search_category" name="search_category">
					<option value="nickname" selected>닉네임</option>
					<option value="title+desc+category">클래스명+설명+내용</option>
				</select>
				<input type="text" class="search_keyword" name="search_keyword" placeholder="Search term...">
		        <input onclick="ranking()" type="submit" value="검색" />
	         </form>
		</div>
		
		<c:if test="${mDto.member_grade eq '강사회원' }">
			<button type="button" onclick="location.href='classInsert.do'" style="color:black">클래스 작성</button>
		</c:if>
		
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
			                                        <div>${dto.class_title }</div>
			                                    </a>
			                                    <p>${dto.class_desc }</p>
			                                    <ul class="blog-info-link">
			                                        <li><a href="#"><i class="fa fa-user"></i> ${dto.class_loc }</a></li>
			                                        <li><a href="#"><i class="fa fa-comments"></i> 03 Comments</a></li>
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
                            <aside class="single_sidebar_widget search_widget">
                                <form action="#">
                                    <div class="form-group">
                                        <div class="input-group mb-3">
                                            <input type="text" class="form-control" placeholder='Search Keyword'
                                                onfocus="this.placeholder = ''"
                                                onblur="this.placeholder = 'Search Keyword'">
                                            <div class="input-group-append">
                                                <button class="btns" type="button"><i class="ti-search"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                    <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
                                        type="submit">Search</button>
                                </form>
                            </aside>
                        </div>
                    </div>
                    
                </div>
            </div>
        </section>
		
		
					<jsp:include page="/WEB-INF/views/paging.jsp">
						<jsp:param value="C" name="class_category" />
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