<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Boostrap -->
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



<style type="text/css">
#iconImg:hover , #Img:hover {
	cursor: pointer;
}
.right-li{
	padding-right: 20px;
}
#content {
margin: 20px;
padding: 10px;
}

#rank-list a {
	color: #FFF;
	text-decoration: none;
}

#rank-list a:hover {
	text-decoration: underline;
}

#rank-list {
	overflow: hidden;
	width: 100px;
	height: 20px;
	margin: 0;
}

#rank-list dt {
	display: none;
}

#rank-list dd {
	position: relative;
	margin: 0;
}

#rank-list ol {
	position: absolute;
	top: 0;
	left: 0;
	margin: 0;
	padding: 0;
	list-style-type: none;
}

#rank-list li {
	height: 20px;
	line-height: 20px;
}
.rank{
	color:red;
}
	</style>
	
	<script type="text/javascript">
		$(document).ready(function() {
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
						$('.search_ul').append("<li style='font-size:8pt;font-weight: 600;'><span class='rank'>" + rank_no +"&nbsp&nbsp&nbsp</span>" + rank_name +"</li>");
						var count = $('#rank-list li').length;
					    var height = $('#rank-list li').height();

					    function step(index) {
					        $('#rank-list ol').delay(100).animate({
					            top: -height * index,
					        }, 500, function() {
					            step((index + 1) % count);
					        });
					    }

					    step(1);
					}
				},
				error: function() {
					alert("통신 실패!");
				}
			});
			
			
			$('#iconImg').click(function(){
	    		window.open('http://132.226.236.97:8787/finalproject/chat_main.do?member_id=${mDto.member_id }' ,'채팅', 'width=400px,height=500px,scrollbars=yes');
	    	});
			$('#Img').click(function(){
	    		window.open('http://132.226.236.97:8787/finalproject/chat_room.do' ,'채팅', 'width=400px,height=500px,scrollbars=yes');
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
                                    <li><a href="store.do?nowPage=1">Shop</a>
                                        <ul class="submenu" style="width: 250px; height: 130px;">
                                            <li class="hot" style="width: 110px;"><a href="store_category.do?category=handmade&nowPage=1">handmade</a></li>
                                            <li><a href="store_category.do?category=cooking&nowPage=1">cooking</a></li>
                                            <li><a href="store_category.do?category=flower&nowPage=1">flower</a></li>
                                            <li style="position: relative; left:120px; top:-108px;"><a href="store_category.do?category=drawing&nowPage=1">drawing</a></li>
                                            <li style="position: relative; left:120px; top:-108px;"><a href="store_category.do?category=music&nowPage=1">music</a></li>
                                            <li style="position: relative; left:120px; top:-108px;"><a href="store_category.do?category=yoga&nowPage=1">yoga</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="classList.do?nowPage=1">Class</a>
                                    	 <ul class="submenu" style="width: 250px; height: 130px;">
                                            <li class="hot" style="width: 110px;"><a href="class_category.do?category=handmade&nowPage=1">handmade</a></li>
                                            <li><a href="class_category.do?category=cooking&nowPage=1">cooking</a></li>
                                            <li><a href="class_category.do?category=flower&nowPage=1">flower</a></li>
                                            <li style="position: relative; left:120px; top:-108px;"><a href="class_category.do?category=drawing&nowPage=1">drawing</a></li>
                                            <li style="position: relative; left:120px; top:-108px;"><a href="class_category.do?category=music&nowPage=1">music</a></li>
                                            <li style="position: relative; left:120px; top:-108px;"><a href="class_category.do?category=yoga&nowPage=1">yoga</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="board_qna_list.do?nowPage=1">QNA</a></li>
                                    <li><a href="review_list.do">Photo</a></li>
                                    <!-- test map -->
                                    <li><a href="map.do">Map</a></li>
                                    <li><a href="review_list.do?nowPage=1">Photo</a></li>
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
                                				<li class="right-li"><a href="eventInsert.do"><img src="resources/images/event.png" width="20px" height="20px" onmouseover="this.src='resources/images/event_ahover.png'" onmouseout="this.src='resources/images/event.png'"></a></li>
                                				<li class="right-li"><img src="resources/images/chat.png" id="Img" width="20px" height="20px" onmouseover="this.src='resources/images/chat_ahover.png'" onmouseout="this.src='resources/images/chat.png'"></li>
                                			</c:when>
                                			
                                			<c:otherwise>
                                				<li class="right-li"><img src="resources/images/chat.png" id="iconImg" width="20px" height="20px" onmouseover="this.src='resources/images/chat_ahover.png'" onmouseout="this.src='resources/images/chat.png'"></li>
												<li class="right-li"><a href="basket.do"><span class="flaticon-shopping-cart"></span></a> </li>
											</c:otherwise>
										</c:choose>
                                		
                                		<li class="right-li"><a href="${mDto.member_grade == '관리자' ? 'adminMain.do' : 'mypage_update.do' }"><span class="flaticon-user"></span></a></li>
                                		<li class="right-li"><a href="logout.do"><img src="resources/images/logout.png" width="20px" height="20px" onmouseover="this.src='resources/images/logout_ahover.png'" onmouseout="this.src='resources/images/logout.png'"></a></li>
                                		
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
    <div id="content" style="position: fixed;z-index: 2147483647; top: 2%;left: 18%">
		<dl id="rank-list">
			<dt>실시간 급상승 검색어</dt>
			<dd>
				<ol class="search_ul">
				</ol>
			</dd>
		</dl>
	</div>
    
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