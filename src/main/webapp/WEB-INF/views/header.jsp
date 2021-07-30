<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Boostrap -->
	<link rel="stylesheet" href="resources/assets/css/bootstrap.min.css">
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
    <link rel="stylesheet" href="resources/assets/css/style.css?ver=4">



	<style type="text/css">
		#iconImg:hover , #Img:hover {
			cursor: pointer;
		}
		.right-li{
			padding-right: 20px;
		}
	</style>
	
	<script type="text/javascript">
		$(document).ready(function() {
			<%--
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
			--%>
			
			$('#iconImg').click(function(){
	    		window.open('http://localhost:8787/one/chat_main.do?member_id=${mDto.member_id }' ,'채팅', 'width=400px,height=500px,scrollbars=yes');
	    	});
			$('#Img').click(function(){
	    		window.open('http://localhost:8787/one/chat_room.do' ,'채팅', 'width=400px,height=500px,scrollbars=yes');
	    	});
	    	
		});
	</script>
</head>
<body>
	<div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="assets/img/logo/logo.png" alt="">
                </div>
            </div>
        </div>
    </div>
	<header>
        <!-- Header Start -->
        <div class="header-area">
            <div class="main-header header-sticky">
                <div class="container-fluid">
                    <div class="menu-wrapper">
                        <!-- Logo -->
                        <div class="logo">
                            <a href="main.do"><img id="logo" src="resources/images/logo.png"></a>
                        </div>
                        <!-- Main-menu -->
                        <div class="main-menu d-none d-lg-block">
                            <nav>                                                
                                <ul id="navigation">  
                                    <li><a href="main.do">Home</a></li>
                                    <li><a href="board_notice_list.do?nowPage=1">Notice</a></li>
                                    <li class="hot"><a href="store.do?nowPage=1">Shop</a>
                                    	<ul class="submenu">
                                            <li><a href="#">category1</a></li>
                                            <li><a href="#">category2</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="classList.do?nowPage=1">Class</a>
                                    	<ul class="submenu">
                                            <li><a href="#">category1</a></li>
                                            <li><a href="#">category2</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="board_qna_list.do?nowPage=1">QNA</a></li>
                                    <li><a href="review_list.do">Photo</a></li>
                                    <!-- test map -->
                                    <li><a href="map.do">Map</a></li>
                                </ul>
                            </nav>
                        </div>
                        <!-- Header Right -->
                        <div class="header-right">
                            <ul>
                                <c:choose>
	        						<c:when test="${mDto == null }">
                                		<li><a href="loginform.do"><span class="flaticon-user"></span></a></li>
                                	</c:when>
                                	<c:otherwise>
                                		<c:choose>
                                			<c:when test="${mDto.member_grade eq '관리자' }">
                                			<li class="right-li"><a href="eventInsert.do"><img src="resources/images/event.png" id="Img" width="20px" height="20px" onmouseover="this.src='resources/images/event_ahover.png'" onmouseout="this.src='resources/images/event.png'"></a></li>
                                			<li class="right-li"><img src="resources/images/chat.png" id="Img" width="20px" height="20px" onmouseover="this.src='resources/images/chat_ahover.png'" onmouseout="this.src='resources/images/chat.png'"></li>
                                			</c:when>
                                			<c:otherwise>
                                			<li class="right-li"><img src="resources/images/chat.png" id="iconImg" width="20px" height="20px" onmouseover="this.src='resources/images/chat_ahover.png'" onmouseout="this.src='resources/images/chat.png'"></li>
											</c:otherwise>
										</c:choose>
                                		<li class="right-li"><a href="${mDto.member_grade == '관리자' ? 'adminMain.do' : 'mypage_update.do' }"><span class="flaticon-user"></span></a></li>
                                		<li class="right-li"><a href="logout.do"><img src="resources/images/logout.png" width="20px" height="20px" onmouseover="this.src='resources/images/logout_ahover.png'" onmouseout="this.src='resources/images/logout.png'"></a></li>
                                		<li class="right-li"><a href="basket.do"><span class="flaticon-shopping-cart"></span></a> </li>
                                	</c:otherwise>
                                </c:choose>
                                
                            </ul>
                        </div>
                    </div>
                    <!-- Mobile Menu -->
                    <div class="col-12">
                        <div class="mobile_menu d-block d-lg-none"></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Header End -->
    </header>
    
    <script src="resources/assets/js/vendor/modernizr-3.5.0.min.js"></script>
    <!-- Jquery, Popper, Bootstrap -->
    <script src="resources/assets/js/vendor/jquery-1.12.4.min.js"></script>
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
    <script src="resources/assets/js/contact.js"></script>
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