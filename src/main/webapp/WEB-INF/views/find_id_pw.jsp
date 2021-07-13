<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="resources/css/findIdPw.css">
    
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="resources/js/findIdPw.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="find">
			<h2>아이디/비밀번호 찾기</h2>

			<div class="findIdPw">
				<span>아이디 찾기</span>
				
				<input id="member_name" placeholder="이름" />
				
				<div class="row">
					<input name="member_phone" placeholder="숫자만 입력" />
					<button id="send" onclick="checkUserName()">인증번호 보내기</button>	
				</div>
				
				<div class="row">
					<input name="confirmNum" />
					<button name="confirm" onclick="confirm()">확인</button>	
				</div>
				
				<p id="msg"></p>
			</div>
			
			<div class="findIdPw">
				<span>비밀번호 찾기</span>
				
				<input id="member_id" placeholder="아이디" required />
				
				<div class="row">
					<input name="member_phone" placeholder="숫자만 입력" />
					<button onclick="checkUserId()">인증번호 보내기</button>	
				</div>
				
				<div class="row">
					<input name="confirmNum" />
					<button name="confirm" onclick="confirm()">확인</button>	
				</div>
				
				<p id="msg_pw"></p>
				
				<form action="updatePw.do" method="post" id="changePw">
					<input type="hidden" id="h_member_id" name="member_id" />
					<input type="hidden" id="h_member_phone" name="member_phone" />
				
					<!-- TODO: 두번의 비밀번호 입력이 같은 지 확인 기능 추가해야함 -->
					<input id="newPw" type="password" name="member_pw" placeholder="새 비밀번호" required />
					<input id="checkNewPw" type="password" placeholder="새 비밀번호 확인" required />
					
					<input type="submit" value="비밀번호 변경" />
				</form>
				
			</div>
		</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>