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

    <script type="text/javascript" src="resources/js/findIdPw.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<main class="container">
		<div class="border p-3 rounded-3 mb-3">
		  <h3>아이디 찾기</h3>
		  
		  <div class="mb-3 row">
		    <label for="member_name" class="col-sm-2 col-form-label">이름</label>
		    <div class="col-auto">
		      <input type="text" class="form-control" id="member_name" >
		    </div>
		  </div>
		  
		  <div class="mb-3 row">
		    <label for="member_phone" class="col-sm-2 col-form-label">핸드폰 번호</label>
		    <div class="col-auto">
		      <input type="text" class="form-control" name="member_phone" placeholder="숫자만 입력">
		    </div>
		    <div class="col-auto">
    			<button class="btn btn-primary" onclick="checkUserName()">인증번호 보내기</button>
  			</div>
		  </div>
		  
		  <div class="mb-3 row">
		    <label for="confirmNum" class="col-sm-2 col-form-label">인증번호</label>
		    <div class="col-auto">
		      <input type="text" class="form-control" name="confirmNum">
		    </div>
		    <div class="col-auto">
    			<button name="confirm" class="btn btn-primary" onclick="confirmed()">확인</button>
  			</div>
		  </div>
		  
		  <p id="msg"></p>
		</div>
		
		<div class="border p-3 rounded-3">
		  <h3>비밀번호 찾기</h3>
		  
		  <div class="mb-3 row">
		    <label for="member_id" class="col-sm-2 col-form-label">아이디</label>
		    <div class="col-auto">
		      <input type="text" class="form-control" id="member_id" >
		    </div>
		  </div>
		  
		  <div class="mb-3 row">
		    <label for="member_phone" class="col-sm-2 col-form-label">핸드폰 번호</label>
		    <div class="col-auto">
		      <input type="text" class="form-control" name="member_phone" placeholder="숫자만 입력">
		    </div>
		    <div class="col-auto">
    			<button class="btn btn-primary" onclick="checkUserId()">인증번호 보내기</button>
  			</div>
		  </div>
		  
		  <div class="mb-3 row">
		    <label for="confirmNum" class="col-sm-2 col-form-label">인증번호</label>
		    <div class="col-auto">
		      <input type="text" class="form-control" name="confirmNum">
		    </div>
		    <div class="col-auto">
    			<button name="confirm" class="btn btn-primary" onclick="confirmed()">확인</button>
  			</div>
		  </div>
		  
		  <p id="msg_pw"></p>
		 </div>
		
		 <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			 <div class="modal-dialog modal-dialog-centered">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">비밀번호 변경</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <form action="updatePw.do" method="post">
			          <input type="hidden" id="h_member_id" name="member_id" />
					  <input type="hidden" id="h_member_phone" name="member_phone" />
			          
			          <div class="mb-3">
			            <label for="newPw" class="col-form-label">새 비밀번호</label>
			            <div class="col-auto">
				      		<input id="newPw" name="member_pw" type="password" class="form-control" required>
				    	</div>
			          </div>
			          
			          <div class="mb-3">
			            <label for="checkNewPw" class="col-form-label">비밀번호 확인</label>
			            <div class="col-auto">
					      <input id="checkNewPw" type="password" class="form-control" required>
					    </div>
			          </div>
			          
			          <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				        <button type="submit" class="btn btn-primary">변경하기</button>
				      </div>
			        </form>
			      </div>
			    </div>
			</div>
		</div>
	</main>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>