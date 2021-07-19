<%@ page import="com.project.one.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

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
	
</script>

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<main class="container">
		<h1>회원가입</h1>
		
		<form action="signupRes.do" method="post">
			<input type="radio" name="member_grade" value="일반회원" checked />일반회원
			<input type="radio" name="member_grade" value="강사회원" />강사회원
			<input type="hidden" id="member_ip" name="member_ip" />
			<input type="hidden" name="member_join" value="Y" />
			<input type="hidden" name="member_face" value="N" />
			<input type="hidden" name="member_auto" value="Y" />
		<%
			if(request.getAttribute("mDto")==null){
		%>
		
			<table border="1">
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="member_id" title="n" required="required">
						<input type="button" value="중복체크" onclick="idCheck();" />
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="text" name="member_pw" required="required" onclick="idCheckConfirm();"></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="text" name="member_pw_chk" required="required" onclick="idCheckConfirm();"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="member_name" required="required" onclick="idCheckConfirm();"></td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td><input type="text" name="member_nicname" required="required" onclick="idCheckConfirm();"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="member_email" required="required" onclick="idCheckConfirm();"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="member_phone" required="required" onclick="idCheckConfirm();"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
					<input type="hidden" name="member_addr" value="">
					<input type="text" id="postcode" placeholder="우편번호" readonly="readonly">
					<input type="button" onclick="address();" value="우편번호 찾기">
					<br>
					<input type="text" name="member_addr" id="addr_1" placeholder="기본주소" readonly="readonly">
					<input type="text" name="member_addr" id="addr_2" placeholder="상세주소" required="required" onclick="idCheckConfirm();">
					</td>
				</tr>
				<tr>
					<th>알림</th>
					<td>
						<input type="radio" name="member_notify" value="Y" onclick="notificationOn()" />
						<label for="member_notify">허용</label>
						
						<input type="radio" name="member_notify" value="N" />
						<label for="member_notify">거부</label>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="회원가입" />
						<input type="button" value="취소" onclick="" />
					</td>
				</tr>
			</table>
		<%}else{
			MemberDto mDto = (MemberDto)request.getAttribute("mDto");	
		%>
			<table border="1">
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="member_id" title="n" required="required" value="${mDto.member_id }">
						<input type="button" value="중복체크" onclick="idCheck();" />
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="text" name="member_pw" required="required" onclick="idCheckConfirm();"></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="text" name="member_pw_chk" required="required" onclick="idCheckConfirm();"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="member_name" required="required" onclick="idCheckConfirm();" value="${mDto.member_name }"></td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td><input type="text" name="member_nicname" required="required" onclick="idCheckConfirm();" value="${mDto.member_nicname }"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="member_email" required="required" onclick="idCheckConfirm();" value="${mDto.member_email }"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="member_phone" required="required" onclick="idCheckConfirm();" value="${mDto.member_phone }"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="member_addr" required="required" onclick="idCheckConfirm();"></td>
				</tr>
				<tr>
					<th>알림</th>
					<td>
						<input type="radio" name="member_notify" value="Y" onclick="notificationOn()" />
						<label for="member_notify">허용</label>
						
						<input type="radio" name="member_notify" value="N" />
						<label for="member_notify">거부</label>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="회원가입"/>
						<input type="button" value="취소" onclick="main.do" />
					</td>
				</tr>
			</table>		
		<%} %>
		</form>
	</main>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>