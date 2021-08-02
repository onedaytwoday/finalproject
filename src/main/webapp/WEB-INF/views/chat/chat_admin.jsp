<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet" />
<link href="resources/css/chat.css" rel="stylesheet" />
<link rel="stylesheet" href="resources/assets/css/bootstrap.min.css?ver=1">
    <link rel="stylesheet" href="resources/assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="resources/assets/css/flaticon.css">
    <link rel="stylesheet" href="resources/assets/css/slicknav.css">
    <link rel="stylesheet" href="resources/assets/css/animate.min.css">
    <link rel="stylesheet" href="resources/assets/css/magnific-popup.css">
    <link rel="stylesheet" href="resources/assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="resources/assets/css/themify-icons.css">
    <link rel="stylesheet" href="resources/assets/css/nice-select.css?ver=1">
    <link rel="stylesheet" href="resources/assets/css/slick.css">
    <link rel="stylesheet" href="resources/assets/css/slick.min.css">
    <link rel="stylesheet" href="resources/assets/css/slick-theme.min.css">
    <link rel="stylesheet" href="resources/assets/css/style.css?ver=3">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="resources/js/sockjs.min.js"></script>
</head>
<body>
	<div class="inbox_msg">
		<div align="center">
		<span style="font-size: 18pt">${rDto.consult_id }</span>
		</div>
	 <div class="mesgs">
          <div class="type_msg">
            <div class="input_msg_write">
	            <form id="chatForm">
					<input type="text" id="message" class="write_msg" placeholder="Type a message" />
					<button class="send_btn">보내기</button>
					<button class="exit_btn" type="button" onclick="exit()">나가기</button>
				</form>
            </div>
          </div>
        </div>
	</div>
	<script>
		$(document).ready(function(){

			$("#message").val('').focus();
			$("#chatForm").submit(function(event){
				console.log(event);
				event.preventDefault();
				sock.send($("#message").val());
				$("#message").val('').focus();
			});
			
		});
				
		var sock = new SockJS("/echo");
		
		// 메세지 왔을때
		sock.onmessage = function(e){
			console.log(e);
			location.reload();
		}
		
		// 나가기 버튼
		function exit(){
			sock.close();
		}		
		
		// 연결끊기면 
			sock.onclose = function(e){
				console.log(e);
			}
		
	</script>	
	<script src="resources/assets/js/vendor/modernizr-3.5.0.min.js"></script>
    <!-- Jquery, Popper, Bootstrap -->
    
    <script src="resources/assets/js/popper.min.js"></script>
    <script src="resources/assets/js/bootstrap.min.js"></script>
    <!-- Jquery Mobile Menu -->
    <script src="resources/assets/js/jquery.slicknav.min.js"></script>
    <!-- Jquery Slick , Owl-Carousel Plugins -->
    <script src="resources/assets/js/owl.carousel.min.js"></script>
	<script src="resources/assets/js/slick.min.js"></script>
    <!-- One Page, Animated-HeadLin -->
    <script src="resources/assets/js/wow.min.js"></script>
    <script src="resources/assets/js/animated.headline.js"></script>
    <script src="resources/assets/js/jquery.magnific-popup.js"></script>

    <!-- Scrollup, nice-select, sticky -->
    <script src="resources/assets/js/jquery.scrollUp.min.js"></script>
    <script src="resources/assets/js/jquery.nice-select.min.js"></script>
    <script src="resources/assets/js/jquery.sticky.js"></script>
    
    <!-- contact js -->
    <script src="resources/assets/js/jquery.form.js"></script>
    <script src="resources/assets/js/jquery.validate.min.js"></script>
    <script src="resources/assets/js/mail-script.js"></script>
    <script src="resources/assets/js/jquery.ajaxchimp.min.js"></script>
    
    <!-- Jquery Plugins, main Jquery -->	
    <script src="resources/assets/js/plugins.js"></script>
    <script src="resources/assets/js/main.js"></script>
   
    <script src="resources/assets/js/swiper.min.js"></script>
    <script src="resources/assets/js/mixitup.min.js"></script>
    <script src="resources/assets/js/jquery.counterup.min.js"></script>
    <script src="resources/assets/js/waypoints.min.js"></script>	
</body>
</html>