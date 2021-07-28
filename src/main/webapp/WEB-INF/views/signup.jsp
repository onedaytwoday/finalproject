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
<script type="text/javascript" src="resources/js/signup.js"></script>

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<main class="container">
		<div class="section-top-border w-50 mx-auto">
		
			<form action="signupRes.do" method="post" id="needs-validation" novalidate>
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
							
				<div class="form-group mt-10">
					<input type="text" minlength="4" name="member_id" title="n" placeholder="아이디" class="d-inline single-input w-75 form-control" value="${mDto != null ? mDto.member_id : ''}" required>
					<input type="button" class="ml-2 genric-btn primary-border circle small" value="중복체크" onclick="idCheck();" />				
					
					<div class="mt-2 valid-feedback">
			        	Looks good!
			      	</div>
			      	<div class="mt-2 invalid-feedback">
			        	아이디는 4자 이상 입력해야 합니다.
			      	</div>
				</div>
								
				<div class="form-group mt-10">
					<input type="password" pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d~!@#$%^&*()+|=]{6,20}$" name="member_pw" placeholder="비밀번호" required class="single-input w-75 form-control" onclick="idCheckConfirm()">
				
					<div class="mt-2 valid-feedback">
			        	Looks good!
			      	</div>
			      	<div class="mt-2 invalid-feedback">
			        	비밀번호는 최소 6자 이상 20자 이하로 영문 최소 하나, 숫자, 특수문자 포함하여 입력해야 합니다.
			      	</div>
				</div>
				
				<div class="form-group mt-10">
					<input type="password" name="member_pw_chk" pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d~!@#$%^&*()+|=]{6,20}$" placeholder="비밀번호 확인" required class="single-input w-75 form-control" onclick="idCheckConfirm()">
				
					<div class="mt-2 valid-feedback">
			        	Looks good!
			      	</div>
			      	<div class="mt-2 invalid-feedback">
			        	비밀번호를 확인해 주세요.
			      	</div>
				</div>
				
				<div class="form-group mt-10">
					<input type="text" pattern="^[가-힣]{2,5}$" name="member_name" placeholder="이름" class="single-input w-75 form-control" value="${mDto != null ? mDto.member_name : ''}" required onclick="idCheckConfirm()">
					<div class="mt-2 valid-feedback">
			        	Great!
			      	</div>
			      	<div class="mt-2 invalid-feedback">
			        	한글로 시작하는 2~5 이내로 입력하세요.
			      	</div>
				</div>
				
				<div class="form-group mt-10">
					<input type="text" name="member_nicname" minlength="2" placeholder="닉네임" class="single-input w-75 form-control" value="${mDto != null ? mDto.member_nicname : ''}" required onclick="idCheckConfirm()">
				
					<div class="mt-2 valid-feedback">
			        	Looks good!
			      	</div>
			      	<div class="mt-2 invalid-feedback">
			        	닉네임은 2자 이상 입력해야 합니다.
			      	</div>
				</div>
				
				<div class="form-group mt-10">
					<input type="email" name="member_email" placeholder="이메일 주소" class="single-input w-75 form-control" value="${mDto != null ? mDto.member_email : ''}" required onclick="idCheckConfirm()">
				
					<div class="mt-2 valid-feedback">
			        	Looks good!
			      	</div>
			      	<div class="mt-2 invalid-feedback">
			        	이메일 형식으로 입력해야 합니다.
			      	</div>
				</div>
				
				<div class="form-group mt-10">
					<c:set var="phone" value="${mDto != null ? mDto.member_phone : ''}"/>
					<input type="hidden" name="member_phone" value="">
					<input type="text" name="member_phone_1" maxlength="3" class="d-inline w-25 single-input form-control" value="${mDto != null ? fn:substring(phone,0,3) : '' }" onclick="idCheckConfirm()" required> <i class="d-inline bi bi-dash-lg mt-2 px-1"></i>
					<input type="text" name="member_phone_2" maxlength="4" class="d-inline w-25 single-input form-control" value="${mDto != null ? fn:substring(phone,3,7) : '' }" onclick="idCheckConfirm()" required> <i class="d-inline bi bi-dash-lg mt-2 px-1"></i>
					<input type="text" name="member_phone_3" maxlength="4" class="d-inline w-25 single-input form-control" value="${mDto != null ? fn:substring(phone,7,11) : '' }" onclick="idCheckConfirm()" required>
				
					<div class="mt-2 valid-feedback">
			        	Looks good!
			      	</div>
			      	<div class="mt-2 invalid-feedback">
			        	핸드폰 번호를 입력해 주세요.
			      	</div>
				</div>
				
				<div class="form-group mt-10">
					<input type="hidden" name="member_addr" value="">
					<div class="d-flex justify-content-between">
						<input type="text" id="postcode" placeholder="우편번호" readonly class="single-input w-50">
						<input type="button" class="genric-btn primary-border circle small" onclick="address();" value="주소찾기" />	
					</div>
					
					<div class="mt-2">
						<input type="text" name="member_addr_1" id="addr_1" placeholder="기본주소" readonly class="d-inline single-input w-50">
						<input type="text" name="member_addr_2" id="addr_2" placeholder="상세주소" required class="d-inline single-input w-25 form-control" onclick="idCheckConfirm();">				
						
						<div class="mt-2 valid-feedback">
			        		Looks good!
			      		</div>
						<div class="mt-2 invalid-feedback">
			        		주소를 입력해 주세요.
			      		</div>
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
							<input type="radio" id="default-radio1" name="member_notify" value="N" checked>
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