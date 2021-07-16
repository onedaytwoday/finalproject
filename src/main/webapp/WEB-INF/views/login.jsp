<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

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
				"member_ip": "1111"
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
						}
						setTimeout(function(){
							//추후 수정
							location.href="main.do";
						}, 2000);
						
					}else{
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
	
	<main class="container">
		<c:choose>
			<c:when test="${sessionId != null}">
				<h2> 네이버 아이디 로그인 성공하셨습니다!! </h2>
				<h3>'${sessionId}'님 </h3>
				<h3><a href="logout">로그아웃</a></h3>
			</c:when>
			<c:otherwise>
				
				<div class="box-body">
					<div class="form-group">
						<input type="text" id="member_id" 
							class="form-control" placeholder="아이디를 입력해주세요" />
					</div>
					<div class="form-group">
						<input type="password" id="member_pw" 
							class="form-control" placeholder="패스워드를 입력해주세요"/>
					</div>
				</div> 
				<div class="box-footer">
				  <input type="button" value="login" onclick="login();" />
				  <input type="button" value="register" onclick="location.href='signup.do'" />
				</div>
				
				<div>
					<a href="findIdPwForm.do">아이디/비밀번호 찾기</a>
				</div>
				
				<div class="text-center">
			 	  <a href="${naverUrl}"><img width="150" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
			 	  <a href="${kakaoUrl}"><img width="150" src="" />카카오로그인</a>
				</div>
			</c:otherwise>
		</c:choose>
	</main>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>