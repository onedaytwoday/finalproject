<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Boostrap Icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<style type="text/css">
header{
	border: 1px solid skyblue;
	width: 100%;
	height: 100px;
}
	
ul {
	list-style-type: none;
}

li {
	display: inline;
	margin-left: 10px;
}

#logo{
	float: left;
	margin-right: 1000px;
}

.login{
	margin: 0;
	padding: 0;
	float: right;
}

.headernav{
	margin: 0;
	padding: 0;
	float: right;
	
}
	
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
			$.ajax({
				type: 'get',
				url: 'getBasketNum.do',
				dataType: 'json',
				success: function(res){
					console.log(res.basket_num);
					$("#basket_num").text(res.basket_num);
				},
				error: function(err){
					console.log("통신 실패!");
				}
			});
		
		$('.iconImg').click(function(){

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
	<header>
	<%if(session.getAttribute("mDto") != null){
	%>
		<h1>${mDto.member_id }님 환영합니다.</h1>
		<ul class="login">
			<li>
				<a href="basket.do" style="position: relative; text-decoration-line:none;">
					<i class="bi bi-cart4" style="font-size: 3rem; cursor:pointer;"></i>
					<span id="basket_num"
						style="position: absolute; left: 1.5rem; bottom: 25px; border-radius: 50%; padding: 5px 10px; background-color: red; color: white;">
							${basket_num }
					</span>
				</a>
				<a href="mypage_update.do?member_id=${mDto.member_id }">마이페이지</a>
			</li>
			
			<li><a href="logout.do">로그아웃</a>
		</ul>
	<%
	}else{
	%>
		<ul class="login">
			<li><a href="loginform.do">로그인</a></li>
			<li><a href="signup.do">회원가입</a></li>
		</ul>
	<%} %>
		<br>

		<ul class="headernav">
			<li><a href="main.do"><img src="resources/images/logo.png"></a></li>
			<li><a href="main.do">Home</a></li>
			<li><a href="board_notice_list.do?nowPage=1">공지사항</a></li>
			<li>
				<select id="class">
						<option value="">클래스</option>
						<option value="cate01">카테고리1</option>
						<option value="cate02">카테고리2</option>
						<option value="cate03">카테고리3</option>
				</select>
			</li>
			<li><a href="store.do">쇼핑</a></li>
			<c:if test="${mDto.member_grade == '강사회원' }">
				<li><a href="classInsert.do">클래스 등록</a></li>
			</c:if>
			<li><a href="classList.do">클래스</a></li>
			<li><a href="board_qna_list.do?nowPage=1">상품문의</a></li>
			<li><a href="#">수강후기포토</a></li>
			<li><a href="map.do">지도</a></li>
			<li><a href="chat.do">채팅</a></li>
			<%-- <li><a href="map.do" onclick="window.open('map.do', '지도', 'width=500px, height=400px');return false">지도</a></li>--%>

			
			<c:if test="${mDto.member_grade == '관리자' }">
				<!-- 관리자만 가능 -->
				<li><a href="eventInsert.do">이벤트 등록</a></li>
				<li><a href="adminMain.do">관리자 페이지</a></li>					
			</c:if>
		</ul>

	</header>
</body>
</html>