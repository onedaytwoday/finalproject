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
                     <img src="resources/assets/img/blog/learn_about_bg.png" alt="" class="heartbeat" style="width:100%; height:100%; object-fit:cover;"/>
                </div>
                </c:forEach>
                </c:otherwise>
                </c:choose>
            </div>
        </div>
        <!-- slider Area End-->
        <!-- ? New Product Start -->
        <section class="new-product-area section-padding30">
            <div class="container">
                <!-- Section tittle -->
                <div class="row">
                    <div class="col-xl-12">
                        <div class="section-tittle mb-70">
                            <h2>Recommend Class</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                <c:choose>
				<c:when test="${empty clist }">
                	<div>클래스 없음</div>
                </c:when>
                <c:otherwise>
                <c:forEach items="${clist }" var="dto">
                
                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                        <div class="single-new-pro mb-30 text-center">
                            <div class="product-img">
                                <img src="resources/assets/img/gallery/new_product1.png" alt="">
                            </div>
                            <div class="product-caption">
                                <h3><a href="classSelect.do?class_no=${dto.class_no }">${dto.class_title }</a></h3>
                                <span>${dto.class_price }원</span>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                </c:otherwise>
               </c:choose>
               </div>
            </div>
        </section>
        <!--  New Product End -->
        <!--? Popular Items Start -->
        <div class="popular-items section-padding30">
            <div class="container">
                <!-- Section tittle -->
                <div class="row justify-content-center">
                    <div class="col-xl-7 col-lg-8 col-md-10">
                        <div class="section-tittle mb-70 text-center">
                            <h2>Popular Items</h2>
                            <p>Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida.</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                	<c:choose>
					<c:when test="${empty plist }">
                		<div>상품 없음</div>
                	</c:when>
               		<c:otherwise>
                	<c:forEach items="${plist }" var="dto">
                		
                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                        <div class="single-popular-items mb-50 text-center">
                            <div class="popular-img">
                                <img src="resources/assets/img/gallery/popular1.png" alt="">
                                <c:if test="${mDto != null }">
                                <div class="img-cap">
                                    <a href="#"><span>Add to cart</span></a>
                                </div>
                                </c:if>
                            </div>
                            <div class="popular-caption">
                                <h3><a href="store_select.do?product_no=${dto.product_no }">${dto.product_name }</a></h3>
                                <span>${dto.product_price }원</span>
                            </div>
                        </div>
                    </div>
                	</c:forEach>
               		</c:otherwise>
               		</c:choose>
                </div>
                <!-- Button -->
                <div class="row justify-content-center">
                    <div class="room-btn pt-70">
                        <a href="store.do?nowPage=1" class="btn view-btn1">View More Products</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Popular Items End -->
        
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