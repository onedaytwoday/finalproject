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
		$("#search_category").change(function(){
			let category = $("select > option:selected").val();
			checked = category == 'title+desc+category'
		});		
	});
	
	function ranking(){
		if(checked){
			sock.send($("[name='search_keyword']:eq(0)").val());		
		}
	}
	
	
	let sock = new SockJS("${pageContext.request.contextPath}/rank");		
	
	// 연결끊기면 
	sock.onclose = function(e){
		console.log(e);
	}	
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	
	<main class="container">
		<h1>클래스 목록</h1>
	<div class="search">
		<form id="searchForm" action="class_search.do" method="post">
		<input type="hidden" name="nowPage" value="1">
		<select id="search_category" name="search_category">
			<option value="nickname" selected>닉네임</option>
			<option value="title+desc+category">클래스명+설명+내용</option>
		</select>
		<input type="text" class="search_keyword" name="search_keyword" placeholder="Search term...">
        <input onclick="ranking()" type="submit" value="검색" />
         </form>
	</div>

		<section class="p-5">
			
				<div class="row text-center g-4">
					<c:choose>
						<c:when test="${empty list }">
							<p>--------등록된 클래스가 없습니다.---------</p>
						</c:when>

						<c:otherwise>
							<c:forEach items="${list }" var="dto">

								<div class="col-md-4">
									<div class="card bg-dark text-light">
										<div class="card-body text-center">
											<div class="h1 mb-3">
												<i class="bi bi-laptop"></i>
											</div>

											<h3 class="card-title mb-3">${dto.class_title }</h3>

											<p class="card-text">작성자 : ${dto.member_id }</p>

											<a href="classSelect.do?class_no=${dto.class_no }"
												class="btn btn-primary">자세히 보기</a>

											<c:if test="${dto.member_id eq mDto.member_id }">
												<button
													onclick="location.href='classDelete.do?class_no=${dto.class_no}'"
													type="button" class="btn btn-warning">삭제</button>
											</c:if>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
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