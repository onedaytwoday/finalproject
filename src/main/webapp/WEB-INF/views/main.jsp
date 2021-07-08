<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
header{
	border: 1px solid skyblue;
	width: 100%;
	height: 100px;
}

main{
	border: 1px solid red;
	width: 100%;
	height: 1000px;
}

footer{
	border: 1px solid yellow;
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
		$('.iconImg').click(function(){
    		window.open('http://localhost:8787/one/chat.do','채팅', 'width=300px,height=500px,scrollbars=yes');
    	});
    	
	    $('#class').on('change', function() {
			//클래스 카테고리 선택시에 이동할 경로 수정
			//카테고리 value는 추후 controller에 맞춰서 수정
			var cate = this.value;
			
			if(cate == "cate01"){
				 alert("카테고리 01"); 
			}else if(cate == "cate02"){
				alert("카테고리 02"); 
			}else if(cate == "cate03"){
				alert("카테고리 03"); 
			}
	
	    });
	    
	    $('#shop').on('change', function() {
			//쇼핑 카테고리 선택시에 이동할 경로 수정
			//카테고리 value는 추후 controller에 맞춰서 수정
			var cate = this.value;
			
			if(cate == "cate01"){
				location.href = 'store.do';
			}else if(cate == "cate02"){
				alert("카테고리 02"); 
			}else if(cate == "cate03"){
				alert("카테고리 03"); 
			}
	
	    });
	    /*
		$('.iconImg').click(function(){
	        window.open('http://localhost:8787/one/chat.do', 'width=300px,height=500px,scrollbars=yes');
	    });
		*/
	    
	    
	});

</script>
</head>
<body>
	<header>
	<%if(session.getAttribute("mDto") != null){
	%>
		<h1>${mDto.member_id }님 환영합니다.</h1>
		<ul class="login">
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
			<li><a href="main.do"><img src="logo.png"></a></li>
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
			<li>
				<select id="shop">
						<option value="">쇼핑</option>
						<option value="cate01">카테고리1</option>
						<option value="cate02">카테고리2</option>
						<option value="cate03">카테고리3</option>
				</select>
			</li>
			<li><a href="classInsert.do">클래스 등록</a></li>
			<li><a href="classList.do">클래스</a></li>
			<li><a href="board_qna_list.do?nowPage=1">상품문의</a></li>
			<li><a href="#">수강후기포토</a></li>
			<li><a href="chatList.do">채팅</a></li>
			<li><a href="map.do">지도</a>
			
			<c:if test="${mDto.member_grade == '관리자' }">
				<!-- 관리자만 가능 -->
				<li><a href="eventInsert.do">이벤트 등록</a></li>					
			</c:if>
		</ul>

	</header>
	<div class="chatIcon">
        <a href="chat.do"><img width="50"  src="https://previews.123rf.com/images/nikolae/nikolae1601/nikolae160100031/51288418-%ED%9D%B0%EC%83%89-%EB%B0%B0%EA%B2%BD%EC%97%90-%EA%B3%A0%EB%A6%BD-%EC%B1%84%ED%8C%85-%EC%95%84%EC%9D%B4%EC%BD%98.jpg" class="iconImg"></a>
    </div>
    <div class="tts">
    	<a href="tts.do">tts</a>
    </div>
    
<!-- 채널톡 -->
<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "f7e6f758-14ee-4f23-bfb0-0cfbccbb85cf" 
  });
</script>

    
</body>
</html>