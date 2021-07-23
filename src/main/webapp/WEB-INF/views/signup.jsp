<%@ page import="com.project.one.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- IP주소 얻기 -->
<script type="text/javascript" src="http://jsgetip.appspot.com"></script>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="resources/js/kakaoLink.js"></script>

<script type="text/javascript">
	window.onload = function(){
		document.getElementById("member_ip").value = ip();				
	}
	
	function address() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var roadAddr = data.roadAddress;
						var extraRoadAddr = '';

						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}

						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}

						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						document.getElementById('postcode').value = data.zonecode;
						document.getElementById("addr_1").value = roadAddr;
						document.getElementById("addr_1").value = data.jibunAddress;

						if (data.autoRoadAddress) {
							document.getElementById("addr_1").value = roadAddr;
						} else if (data.autoJibunAddress) {
							document.getElementById("addr_1").value = data.jibunAddress;
						} else {
						}
					}
				}).open();
	}
	
	function idCheckConfirm() {
		var chk = document.getElementsByName("member_id")[0].title;
		if (chk == "n") {
			alert("id 중복체크를 먼저 해주세요.");
			document.getElementsByName("member_id")[0].focus();
		}
	}
		
	function idCheck() {
		var doc = document.getElementsByName("member_id")[0];
		if (doc.value.trim() == "" || doc.value == null) {
			alert("id를 입력해 주세요");
		} else {
			open("idcheck.do?member_id="+doc.value, "", "width=200, height=200");
		}
	}
	
	function check() {
		var member_phone = $('input[name=member_phone_1]').val()
				+ $('input[name=member_phone_2]').val()
				+ $('input[name=member_phone_3]').val();
		$('input[name=member_phone]').attr('value', member_phone);
		
		var member_addr = $('input[name=member_addr_1]').val()
				+ $('input[name=member_addr_2]').val();
		$('input[name=member_addr]').attr('value', member_addr);
	}
</script>

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<main class="container">
		<div class="section-top-border w-50 mx-auto">
			<form action="signupRes.do" method="post">
				<div class="d-flex justify-content-around">
					<div class="switch-wrap d-flex justify-content-start">
						<div class="confirm-radio mr-1">
							<input type="radio" id="confirm-radio" name="member_grade" value="일반회원" checked>
							<label for="confirm-radio"></label>
						</div>
						<p>일반회원</p>
					</div>
							
					<div class="switch-wrap d-flex justify-content-start">
						<div class="confirm-radio mr-1">
							<input type="radio" id="confirm-radio1" name="member_grade" value="강사회원" >
							<label for="confirm-radio1"></label>
						</div>
						<p>강사회원</p>
					</div>
				</div>
				<input type="hidden" id="member_ip" name="member_ip" />
				<input type="hidden" name="member_join" value="Y" />
				<input type="hidden" name="member_face" value="N" />
				<input type="hidden" name="member_auto" value="Y" />
							
				<div class="mt-10 d-flex flex-row justify-content-between">
					<input type="text" name="member_id" title="n" placeholder="아이디" class="single-input" value="${mDto != null ? mDto.member_id : ''}" onfocus="this.placeholder = ''" onblur="this.placeholder = '아이디'" required>
					<input type="button" class="genric-btn primary-border circle" value="중복체크" onclick="idCheck();" />
				</div>
								
				<div class="mt-10">
					<input type="text" name="member_pw" placeholder="비밀번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호'" required class="single-input" onclick="idCheckConfirm()";>
				</div>
				
				<div class="mt-10">
					<input type="text" name="member_pw_chk" placeholder="비밀번호 확인" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호 확인'" required class="single-input" onclick="idCheckConfirm()">
				</div>
				
				<div class="mt-10">
					<input type="text" name="member_name" placeholder="이름" class="single-input" value="${mDto != null ? mDto.member_name : ''}" onfocus="this.placeholder = ''" onblur="this.placeholder = '이름'" required onclick="idCheckConfirm()">
				</div>
				
				<div class="mt-10">
					<input type="text" name="member_nicname" placeholder="닉네임" class="single-input" value="${mDto != null ? mDto.member_nicname : ''}" onfocus="this.placeholder = ''" onblur="this.placeholder = '닉네임'" required onclick="idCheckConfirm()">
				</div>
				
				<div class="mt-10">
					<input type="email" name="member_email" placeholder="이메일 주소" class="single-input" value="${mDto != null ? mDto.member_email : ''}" onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일 주소'" required onclick="idCheckConfirm()">
				</div>
				
				<div class="mt-10 d-flex flex-row justify-content-between">
					<c:set var="phone" value="${mDto != null ? mDto.member_phone : ''}"/>
					<input type="hidden" name="member_phone" value="">
					<input type="text" name="member_phone_1" maxlength="3" class="single-input" value="${mDto != null ? fn:substring(phone,0,3) : '' }" onclick="idCheckConfirm()" required> <i class="bi bi-dash-lg mt-2 px-1"></i>
					<input type="text" name="member_phone_2" maxlength="4" class="single-input" value="${mDto != null ? fn:substring(phone,3,7) : '' }" onclick="idCheckConfirm()" required> <i class="bi bi-dash-lg mt-2 px-1"></i>
					<input type="text" name="member_phone_3" maxlength="4" class="single-input" value="${mDto != null ? fn:substring(phone,7,11) : '' }" onclick="idCheckConfirm()" required>
				</div>
				
				<div class="mt-10">
					<input type="hidden" name="member_addr" value="">
					<div class="d-flex">
						<input type="text" id="postcode" placeholder="우편번호" readonly class="single-input">
						<input type="button" class="genric-btn primary-border circle" onclick="address();" value="우편번호 찾기">				
					</div>
					
					<div class="mt-2 d-flex flex-row">
						<input type="text" name="member_addr_1" id="addr_1" placeholder="기본주소" readonly class="single-input">
						<input type="text" name="member_addr_2" id="addr_2" placeholder="상세주소" required class="single-input ml-2" onclick="idCheckConfirm();">				
					</div>
				</div>
				
				<div class="mt-10 ml-3 d-flex align-items-center">
					<div class="switch-wrap d-flex">
						<div class="primary-radio mr-1">
							<input type="radio" id="default-radio" name="member_notify" value="Y" onclick="notificationOn()">
							<label for="default-radio"></label>
						</div>
						<p>알림 허용</p>
					</div>
					
					<div class="switch-wrap d-flex ml-5">	
						<div class="primary-radio mr-1">
							<input type="radio" id="default-radio1" name="member_notify" value="N">
							<label for="default-radio1"></label>
						</div>
						<p>알림 거부</p>
					</div>
				</div>
				
				<div class="float-right mt-30">
					<input class="genric-btn danger radius" type="submit" value="회원가입" onclick="check()" />
					<input class="genric-btn default radius" type="button" value="취소" onclick="location.href='main.do'" />
				</div>
			</form>					
		</div>
	</main>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>