<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Boostrap Icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

<style type="text/css">

main{
	border: 1px solid red;
	width: 100%;
	height: 1000px;
}

</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){		
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
	        window.open('http://localhost:8787/one/consultList.do', 'width=300px,height=500px,scrollbars=yes');
	    });
		*/
	    
	    
	});

</script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="chatIcon">
        <img width="50"  src="https://previews.123rf.com/images/nikolae/nikolae1601/nikolae160100031/51288418-%ED%9D%B0%EC%83%89-%EB%B0%B0%EA%B2%BD%EC%97%90-%EA%B3%A0%EB%A6%BD-%EC%B1%84%ED%8C%85-%EC%95%84%EC%9D%B4%EC%BD%98.jpg" class="iconImg">
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

<jsp:include page="footer.jsp"></jsp:include>    
</body>
</html>