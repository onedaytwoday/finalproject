<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script>
	$(document).ready(function() {
			$('#summernote').summernote({
				height : 300,
				lang : 'ko-KR',
				toolbar : [
						[ 'Font Style', [ 'fontname' ] ],
						[ 'style',[ 'bold', 'italic','underline' ] ],
						[ 'font', [ 'strikethrough' ] ],
						[ 'fontsize', [ 'fontsize' ] ],
						[ 'color', [ 'color' ] ],
						[ 'para', [ 'paragraph' ] ],
						[ 'height', [ 'height' ] ],
						[ 'Misc', [ 'fullscreen' ] ] ]
				});
	});
</script>
<link rel="stylesheet" href="resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/assets/css/flaticon.css">
<link rel="stylesheet" href="resources/assets/css/slicknav.css">
<link rel="stylesheet" href="resources/assets/css/animate.min.css">
<link rel="stylesheet" href="resources/assets/css/magnific-popup.css">
<link rel="stylesheet"
	href="resources/assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="resources/assets/css/themify-icons.css">
<link rel="stylesheet" href="resources/assets/css/nice-select.css?ver=1">
<link rel="stylesheet" href="resources/assets/css/style.css?ver=1">



<style type="text/css">
#iconImg:hover, #Img:hover {
	cursor: pointer;
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

		$('#iconImg').click(function() {
			window.open('http://localhost:8787/one/chat_main.do?member_id=${mDto.member_id }','채팅','width=400px,height=500px,scrollbars=yes');
	    });
		$('#Img').click(function() {
			window.open('http://localhost:8787/one/chat_room.do','채팅','width=400px,height=500px,scrollbars=yes');
		});
	});
</script>
</head>
<body>
	<div id="preloader-active">
		<div
			class="preloader d-flex align-items-center justify-content-center">
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
							<a href="main.do"><img id="logo"
								src="resources/images/logo.png"></a>
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
										</ul></li>
									<li><a href="classList.do?nowPage=1">Class</a>
										<ul class="submenu">
											<li><a href="#">category1</a></li>
											<li><a href="#">category2</a></li>
										</ul></li>
									<li><a href="board_qna_list.do?nowPage=1">QNA</a></li>
									<li><a href="#">Photo</a></li>
								</ul>
							</nav>
						</div>
						<!-- Header Right -->
						<div class="header-right">
							<ul>
								<c:choose>
									<c:when test="${mDto == null }">
										<li><a href="loginform.do"><span
												class="flaticon-user"></span></a></li>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${mDto.member_grade eq '관리자' }">
												<li><a href="eventInsert.do" style="color: black">이벤트
														임시</a></li>
												<li><img src="resources/images/chat.png" id="Img"
													width="20px" height="20px"
													onmouseover="this.src='resources/images/chat_ahover.png'"
													onmouseout="this.src='resources/images/chat.png'"></li>
											</c:when>
											<c:otherwise>
												<li><img src="resources/images/chat.png" id="iconImg"
													width="20px" height="20px"
													onmouseover="this.src='resources/images/chat_ahover.png'"
													onmouseout="this.src='resources/images/chat.png'"></li>
											</c:otherwise>
										</c:choose>
										<li><a
											href="${mDto.member_grade == '관리자' ? 'adminMain.do' : 'mypage_update.do' }"><span
												class="flaticon-user"></span></a></li>
										<li><a href="logout.do"><img
												src="resources/images/logout.png" width="20px" height="20px"
												onmouseover="this.src='resources/images/logout_ahover.png'"
												onmouseout="this.src='resources/images/logout.png'"></a></li>
										<li><a href="basket.do"><span
												class="flaticon-shopping-cart"></span></a></li>
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


	<div class="slider-area">
		<div class="single-slider slider-height2 d-flex align-items-center">
			<div class="container">
				<div class="row">
					<div class="col-xl-12">
						<div class="hero-cap text-center">
							<h2>Review Insert</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="comment-form" style="padding-left: 60px; padding-right: 60px">
		<form class="form-contact comment_form" method="post">
			<input type="hidden" name="class_no_str" value="${cDto.class_no }">
			<div class="row">
				<div class="col-12">
					<div class="form-group">
						<input class="form-control" name="member_id"value="${mDto.member_id}"  type="text">
					</div>
				</div>
				<div class="col-12">
					<div class="form-group">
						<input class="form-control" name="review_title" type="text"
							placeholder="Title">
					</div>
				</div>
				<div class="col-12">
					<div class="form-group">
						<textarea class="form-control w-100" id="summernote"
							name="review_content"></textarea>
					</div>
				</div>
			</div>
			<div class="col-12" style="margin-bottom: 30px;">
					<select name="review_rate">
								<option value="1">1.0</option>
								<option value="2">2.0</option>
								<option value="3">3.0</option>
								<option value="4">4.0</option>
								<option value="5" selected="selected">5.0</option>
					</select>
				</div>
			<button id="btn-upload" type="button" style="border: 1px solid #ddd; outline: none; cursor: pointer;">파일추가</button>
			<input id="input_file" multiple="multiple" type="file" accept="image/*" style="display: none;">
			<span style="font-size: 10px; color: gray;">※첨부파일은 최대 10개까지 등록이 가능합니다.</span>
			<div class="data_file_txt" id="data_file_txt" style="margin: 40px;">
				<span>첨부 파일</span> <br />
				<div id="articlefileChange"></div>
			</div>
			<div class="form-group" align="right">
					<button type="button" class="button button-contactForm btn_1 boxed-btn" onclick="registerAction()">Send</button>
					<button type="button" class="button button-contactForm btn_1 boxed-btn" onclick="location.href='classSelect.do?class_no=${cDto.class_no }'">Cancle</button>
			</div>
		</form>
	</div>
	
	<script>
$(document).ready(function()
		// input file 파일 첨부시 fileCheck 함수 실행
		{
			$("#input_file").on("change", fileCheck);
		});

/**
 * 첨부파일로직
 */
$(function () {
    $('#btn-upload').click(function (e) {
        e.preventDefault();
        $('#input_file').click();
    });
});

// 파일 현재 필드 숫자 totalCount랑 비교값
var fileCount = 0;
// 해당 숫자를 수정하여 전체 업로드 갯수를 정한다.
var totalCount = 10;
// 파일 고유넘버
var fileNum = 0;
// 첨부파일 배열
var content_files = new Array();

function fileCheck(e) {
    var files = e.target.files;
    
    // 파일 배열 담기
    var filesArr = Array.prototype.slice.call(files);
    
    // 파일 개수 확인 및 제한
    if (fileCount + filesArr.length > totalCount) {
      alert('파일은 최대 '+totalCount+'개까지 업로드 할 수 있습니다.');
      return;
    } else {
    	 fileCount = fileCount + filesArr.length;
    }
    
    // 각각의 파일 배열담기 및 기타
    filesArr.forEach(function (f) {
      var reader = new FileReader();
      reader.onload = function (e) {
        content_files.push(f);
        $('#articlefileChange').append(
       		'<div id="file' + fileNum + '" onclick="fileDelete(\'file' + fileNum + '\')">'
       		+ '<font style="font-size:12px">' + f.name + '</font>'  
       		+ '<img src="resources/images/minus.png" style="width:20px; height:auto; vertical-align: middle; cursor: pointer;"/>' 
       		+ '<div/>'
		);
        fileNum ++;
      };
      reader.readAsDataURL(f);
    });
    console.log(content_files);
    //초기화 한다.
    $("#input_file").val("");
  }

// 파일 부분 삭제 함수
function fileDelete(fileNum){
    var no = fileNum.replace(/[^0-9]/g, "");
    content_files[no].is_delete = true;
	$('#' + fileNum).remove();
	fileCount --;
    console.log(content_files);
}

/*
 * 폼 submit 로직
 */
	function registerAction(){
		
	var form = $("form")[0];        
 	var formData = new FormData(form);
		for (var x = 0; x < content_files.length; x++) {
			// 삭제 안한것만 담아 준다. 
			if(!content_files[x].is_delete){
				 formData.append("files", content_files[x]);
			}
		}
	for (var pair of formData.entries()) {
		//alert(pair[0]+ ', ' + pair[1]); 
	}
   /*
   * 파일업로드 multiple ajax처리
   */    
	$.ajax({
   	      type: "POST",
   	   	  enctype: "multipart/form-data",
   	      url: "review_insertres_class.do",
       	  data : formData,
       	  processData: false,
   	      contentType: false,
   	      success: function (data) {
   	    	if(JSON.parse(data)['result'] == "OK"){
   	    		alert("파일업로드 성공");
   	    		$(location).attr('href',"review_list.do?nowPage=1");
			} else
				alert("서버내 오류로 처리가 지연되고있습니다. 잠시 후 다시 시도해주세요");
   	    		return false;
   	      },
   	      error: function (xhr, status, error) {
   	    	alert("서버오류로 지연되고있습니다. 잠시 후 다시 시도해주시기 바랍니다.");
   	     return false;
   	      }
   	    });
   	    return false;
	}
</script>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	
</body>
</html>