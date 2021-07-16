<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Boostrap -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
	<style type="text/css">
		#logo {
			width: 70%;
			object-fit: cover;
		}
		
		main {
			margin-top: 8rem;
			margin-bottom: 5rem;
		}
	</style>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$.ajax({
				type : 'get',
				url : 'getBasketNum.do',
				dataType : 'json',
				success : function(res) {
					$("#basket_num").text(res.basket_num);
				},
				error : function(err) {
					alert("통신 실패!");
				}
			});
		
			$('#iconImg').click(function(){
	    		window.open('http://localhost:8787/one/chat_main.do?member_id=${mDto.member_id }' ,'채팅', 'width=400px,height=500px,scrollbars=yes');
	    	});
	    	
		    $('#class').on('change', function() {
				//클래스 카테고리 선택시에 이동할 경로 수정
				//카테고리 value는 추후 controller에 맞춰서 수정
				var cate = this.value;
				
				if(cate == "cate01"){
					location.href = 'classList.do'; 
				}else if(cate == "cate02"){
					alert("카테고리 02"); 
				}else if(cate == "cate03"){
					alert("카테고리 03"); 
				}
		
		    });
		});
	</script>
</head>
<body>
	<!-- Nav Bar -->
    <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 fixed-top">
      <div class="container">
        <a class="navbar-brand" href="main.do"><img id="logo" src="resources/images/logo.png"></a>
	    
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    
	    <div class="collapse navbar-collapse" id="navbarCollapse">
	      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	        
	        <li class="nav-item">
	          <a class="nav-link" href="store.do?nowPage=1">쇼핑</a>
	        </li>
	        
	        <li class="nav-item">
	          <a class="nav-link" href="classList.do">클래스</a>
	        </li>
	        
	        <li class="nav-item">
	          <a class="nav-link" href="board_notice_list.do?nowPage=1">공지사항</a>
	        </li>
	        
	        <li class="nav-item">
	          <a class="nav-link" href="board_qna_list.do?nowPage=1">상품문의</a>
	        </li>
	        
	        <li class="nav-item">
	          <a class="nav-link" href="#">수강후기포토</a>
	        </li>
	        
	        <li class="nav-item">
	          <a class="nav-link" href="map.do">지도</a>
	        </li>
	      </ul>
	      
	      <div class="d-flex">
	        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	        	<c:choose>
	        		<c:when test="${mDto != null }">
	        			<c:choose>
	        				<c:when test="${mDto.member_grade == '관리자' }">
	        					<li class="nav-item">
						          <a class="nav-link" href="eventInsert.do"><i class="bi bi-pencil-square text-white fs-3"></i></a>
						        </li>
	        				</c:when>
	        				
	        				<c:when test="${mDto.member_grade == '강사회원' }">
	        					<li class="nav-item">
						          <a class="nav-link" href="classInsert.do"><i class="bi bi-pencil-square text-white fs-3"></i></a>
						        </li>
	        				</c:when>
	        			</c:choose>
	        			
	        			<li class="nav-item">
				          <a class="nav-link" href="basket.do" style="position: relative;"> 
							<i class="bi bi-cart4 text-white fs-2" style="cursor: pointer;"></i>
							<span id="basket_num" style="position: absolute; left: 1.5rem; bottom: 30px; border-radius: 50%; padding: 3px 6px; background-color: red; color: white;">${basket_num }</span>
				          </a>
				        </li>
	        			
	        			
	        			<li class="nav-item">
	        				<i id="iconImg" class="bi bi-chat-text text-white fs-2"></i>
				        </li>
				        
	        			<li class="nav-item">
				          <a class="nav-link" href="${mDto.member_grade == '관리자' ? 'adminMain.do' : 'mypage_update.do' }">${mDto.member_id }님</a>
				        </li>
				        
				        <li class="nav-item">
				          <a class="nav-link" href="logout.do">로그아웃</a>
				        </li>
	        		</c:when>
	        		
	        		<c:otherwise>
	        			<li class="nav-item">
				          <a class="nav-link" href="loginform.do">로그인</a>
				        </li>
				        
				        <li class="nav-item">
				          <a class="nav-link" href="signup.do">회원가입</a>
				        </li>
	        		</c:otherwise>
	        	</c:choose>
		    </ul>
	      </div>
	    </div>
      </div>
    </nav>
</body>
</html>