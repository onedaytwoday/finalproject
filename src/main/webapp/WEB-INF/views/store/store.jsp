<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>상품 페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="resources/js/sockjs.min.js"></script>

<script type="text/javascript">
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
		<ul class="search_ul"></ul>
		
		<div class="blog_right_sidebar w-25 ml-auto">
			<c:if test="${mDto.member_grade eq '강사회원' }">
				<button type="button" class="genric-btn primary-border mt-5 mb-2" style="width:100%;" onclick="location.href='store_insertform.do'"><i class="bi bi-pencil-fill"></i> 상품 등록</button>
			</c:if>
                        
            <aside class="single_sidebar_widget search_widget">
            	<form action="store_search.do" method="post">
                 	<input type="hidden" name="nowPage" value="1">
                
                    <div class="form-group">  										
                    	<div class="input-group mb-3">
                        	<input type="text" class="form-control" name="search_keyword" placeholder="Search term..." onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search term...'">
                            <div class="input-group-append">
                            	<button class="btns" type="button"><i class="ti-search"></i></button>
                            </div>
                        </div>
                    </div>
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
		<jsp:param value='S' name="store_category" />
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