<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>My Page</title>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript" src="resources/js/kakaoLink.js"></script>
	
	<script type="text/javascript">
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
		
		function check() {
			var member_phone = $('input[name=member_phone_1]').val()
					+ $('input[name=member_phone_2]').val()
					+ $('input[name=member_phone_3]').val();
			$('input[name=member_phone]').attr('value', member_phone);
			
			var member_addr = $('input[name=member_addr_1]').val()
					+ $('input[name=member_addr_2]').val();
			$('input[name=member_addr]').attr('value', member_addr);
		}
		
		function delOk() {
			if (confirm("회원탈퇴를 하시면 복구할 수 없습니다. \n 정말로 탈퇴하시겠습니까?")) {
				location.href = "mypage_del.do?member_id=${mDto.member_id}"
				alert("회원탈퇴가 완료되었습니다.");
			} else {
				location.href = "mypage_update.do?member_id=${mDto.member_id}"
			}
		}
	</script>
	
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	
	<!-- Page Wrapper -->
    <div id="wrapper">
		<jsp:include page="mypage_menu.jsp"></jsp:include>
        
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
        	<!-- Main Content -->
            <div id="content">
                <!-- Begin Page Content -->
                <div class="container-fluid mt-3">
                	<h1 class="h3 mb-4 text-gray-800">개인정보 관리</h1>
                	
                	<!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">내 정보</h6>
                        </div>
                        <div class="card-body">
                            <div class="section-top-border w-50 mx-auto">
								<form action="mypage_updateres.do" method="post">
									<div class="d-flex justify-content-around">
										<div class="switch-wrap d-flex justify-content-start">
											<div class="confirm-radio mr-1">
												<input type="radio" id="confirm-radio" name="member_grade" value="일반회원" ${mDto.member_grade eq '일반회원' ? "checked" : ""}>
												<label for="confirm-radio"></label>
											</div>
											<p>일반회원</p>
										</div>
												
										<div class="switch-wrap d-flex justify-content-start">
											<div class="confirm-radio mr-1">
												<input type="radio" id="confirm-radio1" name="member_grade" value="강사회원" ${mDto.member_grade eq '강사회원' ? "checked" : ""}>
												<label for="confirm-radio1"></label>
											</div>
											<p>강사회원</p>
										</div>
									</div>
												
									<div class="mt-10">
										<input type="text" name="member_id" title="n" placeholder="아이디" class="single-input" value="${mDto.member_id}" onfocus="this.placeholder = ''" onblur="this.placeholder = '아이디'" readonly>
									</div>
													
									<div class="mt-10">
										<input type="password" name="member_pw" placeholder="비밀번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호'" class="single-input" value="${mDto.member_pw}" required>
									</div>
									
									<div class="mt-10">
										<input type="text" name="member_name" placeholder="이름" class="single-input" value="${mDto.member_name}" onfocus="this.placeholder = ''" onblur="this.placeholder = '이름'" readonly>
									</div>
									
									<div class="mt-10">
										<input type="text" name="member_nicname" placeholder="닉네임" class="single-input" value="${mDto.member_nicname}" onfocus="this.placeholder = ''" onblur="this.placeholder = '닉네임'" required>
									</div>
									
									<div class="mt-10">
										<input type="email" name="member_email" placeholder="이메일 주소" class="single-input" value="${mDto.member_email}" onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일 주소'" required>
									</div>
									
									<div class="mt-10 d-flex flex-row justify-content-between">
										<c:set var="phone" value="${mDto.member_phone}"/>
										<input type="hidden" name="member_phone" value="">
										<input type="text" name="member_phone_1" maxlength="3" class="single-input" value="${fn:substring(phone,0,3)}" required> <i class="bi bi-dash-lg mt-2 px-1"></i>
										<input type="text" name="member_phone_2" maxlength="4" class="single-input" value="${fn:substring(phone,3,7)}" required> <i class="bi bi-dash-lg mt-2 px-1"></i>
										<input type="text" name="member_phone_3" maxlength="4" class="single-input" value="${fn:substring(phone,7,11)}" required>
									</div>
									
									<div class="mt-10">
										<input type="hidden" name="member_addr" value="">
										<div class="d-flex">
											<input type="text" id="postcode" placeholder="우편번호" readonly class="single-input">
											<input type="button" class="genric-btn primary-border circle" onclick="address();" value="우편번호 찾기">				
										</div>
										
										<div class="mt-2 d-flex flex-row">
											<input type="text" name="member_addr_1" id="addr_1" placeholder="기본주소" value="${mDto.member_addr }" required class="single-input">
											<input type="text" name="member_addr_2" id="addr_2" placeholder="상세주소" class="single-input ml-2">				
										</div>
									</div>
									
									<div class="mt-10 ml-3 d-flex align-items-center">
										<div class="switch-wrap d-flex">
											<div class="primary-radio mr-1">
												<input type="radio" id="default-radio" name="member_notify" value="Y" ${mDto.member_notify eq 'Y' ? "checked" : ""} onclick="notificationOn()">
												<label for="default-radio"></label>
											</div>
											<p>알림 허용</p>
										</div>
										
										<div class="switch-wrap d-flex ml-5">	
											<div class="primary-radio mr-1">
												<input type="radio" id="default-radio1" name="member_notify" value="N" ${mDto.member_notify eq 'N' ? "checked" : ""} >
												<label for="default-radio1"></label>
											</div>
											<p>알림 거부</p>
										</div>
									</div>
									
									<div class="float-right mt-30">
										<input class="genric-btn primary radius" type="submit" value="업데이트" onclick="check()" />
										<input class="genric-btn danger radius" type="button" value="회원 탈퇴" onclick="delOk()" />
									</div>
								</form>					
							</div>
                        </div>
                    </div>
                </div>
             </div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>