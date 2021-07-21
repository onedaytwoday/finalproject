<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="resources/css/slick.css"/>
	<link rel="stylesheet" type="text/css" href="resources/css/slick-theme.css"/>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>	
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>  
	<!--? slider Area Start -->
        <div class="slider-area ">
            <div class="slider-active">
                <!-- Single Slider -->
                <c:choose>
                <c:when test="${empty list }">
                	<div>이벤트 없음</div>
                </c:when>
                <c:otherwise>
                <c:forEach items="${list }" var="dto">
                <div class="single-slider slider-height d-flex align-items-center slide-bg" style="overflow:hidden; margin:0 auto;">
                     <img src="resources/upload/${dto.file_new_name }" alt="" class="heartbeat" style="width:100%; height:100%; object-fit:cover;"/>
                </div>
                </c:forEach>
                </c:otherwise>
                </c:choose>
            </div>
        </div>
        <!-- slider Area End-->
		<div style="width:100%; height: 500px;">
		
		</div>

    <jsp:include page="footer.jsp"></jsp:include>
  	<script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
  	<script type="text/javascript" src="resources/js/slick.min.js"></script>

  	<script type="text/javascript">
    $(document).ready(function(){
      $('.slider-active').slick({
      });
    });
  </script>
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