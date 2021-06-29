<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#loginChk").hide();
	});
	
	function login(){
		var memberid = $("#memberid").val().trim();
		var memberpw = $("#memberpw").val().trim();
		
		var loginVal = {
				"memberid":memberid,
				"memberpw":memberpw
		}
		
		if(memberid == null || memberid ==""||memberpw == null || memberpw == "" ){
			alert("아이디 혹은 패스워드를 확인해주세요.")
		}else{
			$.ajax({
				type: "post",
				url: "ajaxlogin.do",
				data: JSON.stringify(loginVal),
				contentType: "application/json",
				dataType: "json",
				success: function(msg){
					if(msg.chk == true){
						//추후 수정
						location.href="main.do"
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
	
	<c:choose>
		<c:when test="${sessionId != null}">
			<h2> 네이버 아이디 로그인 성공하셨습니다!! </h2>
			<h3>'${sessionId}'님 </h3>
			<h3><a href="logout">로그아웃</a></h3>
		</c:when>
		<c:otherwise>

			<div class="box-body">
				<div class="form-group">
					<input type="text" id="memberid" 
						class="form-control" placeholder="아이디를 입력해주세요" />
				</div>
				<div class="form-group">
					<input type="password" id="memberpw" 
						class="form-control" placeholder="패스워드를 입력해주세요"/>
				</div>
			</div> 
			<div class="box-footer">
			  <input type="button" value="login" onclick="login();" />
			  <input type="button" value="register" onclick="location.href='registform.do'" />
			</div>
			<div class="text-center">
		 	  <a href="${naverUrl}"><img width="150" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
		 	  <a href="${kakaoUrl}"><img width="150" src="" />카카오로그인</a>
			</div>
		</c:otherwise>
	</c:choose>
	

</body>
</html>