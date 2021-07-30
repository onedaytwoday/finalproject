<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- IP주소 얻기 -->
<script defer type="text/javascript" src="http://jsgetip.appspot.com"></script>

<!-- Kakao Link 보내기 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="resources/js/kakaoLink.js"></script>

<script type="text/javascript">
	$(function(){
		$("#loginChk").hide();
	});
	
	function login(){
		var member_id = $("#member_id").val().trim();
		var member_pw = $("#member_pw").val().trim();
		
		var loginVal = {
				"member_id":member_id,
				"member_pw":member_pw,
				"member_ip": '1111'
		}
		
		if(member_id == null || member_id ==""||member_pw == null || member_pw == "" ){
			alert("아이디 혹은 패스워드를 확인해주세요.")
		}else{
			$.ajax({
				type: "post",
				url: "ajaxlogin.do",
				data: JSON.stringify(loginVal),
				contentType: "application/json",
				dataType: "json",
				success: function(msg){
					if(msg.lock == true){
						alert("계정이 잠겨있습니다. 관리자에게 문의하세요.");
						
					} else if(msg.chk == true){
						if(msg.ip_chk == false) {
							checkIP();
							
							setTimeout(function(){
								//추후 수정
								location.href="main.do";
							}, 5000);
						} 
						
						if(msg.alarm == true) {
							getEvents();
							
							setTimeout(function(){
								//추후 수정
								location.href="main.do";
							}, 5000);
						}
						
						if(msg.ip_chk == true && msg.alarm == false) {location.href="main.do";}
					}else if (msg.chk == false){
						alert("아이디 혹은 패스워드를 확인해주세요.")
					}
				},
				error: function(){	
					alert("통신실패");
				}
			});
		}
		
	}

</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="slider-area">
        <div class="single-slider slider-height2 d-flex align-items-center">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center">
                            <h2>LOGIN</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
		<c:choose>
			<c:when test="${sessionId != null}">
				<h2> 네이버 아이디 로그인 성공하셨습니다!! </h2>
				<h3>'${sessionId}'님 </h3>
				<h3><a href="logout">로그아웃</a></h3>
			</c:when>
			
			<c:otherwise>
				<section class="login_part section_padding ">
				    <div class="container">
					    <div class="row align-items-center">
				    	    <div class="col-lg-6 col-md-6 w-full">
				        	    <div class="login_part_text text-center">
				            	    <div class="login_part_text_iner">
				                	    <h2>아직 회원이 아니신가요?</h2>
				                        <p>There are advances being made in science and technology
				                    	    everyday, and a good example of this is the</p>
				                        <a href="signup.do" class="btn_3">회원가입 하러가기</a>
				                    </div>
				                </div>
				            </div>
				            <div class="col-lg-6 col-md-6">
				            	<div class="login_part_form">
				                	<div class="login_part_form_iner">
				                    	<h3>Welcome Back ! <br>
				                        	Please Sign in now</h3>
				                        <form class="row contact_form" novalidate="novalidate">
				                        	<div class="col-md-12 form-group p_star">
				                            	<input type="text" class="form-control" id="member_id" placeholder="아이디를 입력해주세요">
				                            </div>
				                            <div class="col-md-12 form-group p_star">
				                            	<input type="password" class="form-control" id="member_pw" placeholder="패스워드를 입력해주세요">
				                            </div>
				                            <div class="col-md-12 form-group">
				                            	<div class="creat_account d-flex align-items-center justify-content-between">
				                                    <a href="${naverUrl}"><img width="150" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
				 	  								<a href="${kakaoUrl}"><img width="150" src="resources/images/kakao_login.png" /></a>
				                                </div>
				                                <input type="button" onclick="login();" class="btn_3" value="login" />
				                                <a class="lost_pass" href="findIdPwForm.do">forget password?</a>
				                            </div>
				                        </form>
				                    </div>
				               	</div>
				          	</div>
				    	</div>
					</div>
				</section>
	        </c:otherwise>
		</c:choose>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>