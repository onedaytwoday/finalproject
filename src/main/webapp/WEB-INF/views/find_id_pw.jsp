<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>  
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="resources/js/findIdPw.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="slider-area">
        <div class="single-slider slider-height2 d-flex align-items-center">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center">
                            <h2>아이디/비밀번호 찾기</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
	<main class="container mt-5">
	
		  <div class="billing_details">
	          <div class="returning_custome">
	           	  <div class="check_title mb-2">
		          	<h2>아이디 찾기</h2>
		       	  </div>
                  
                  <div class="col-md-12 form-group">
                    <input type="text" class="form-control" id="member_name" placeholder="이름" />
                  </div>
                    
                  <div class="col-md-12 form-group">
                    <div class="d-md-flex align-items-center justify-content-md-between">
                      	<div class="flex-fill mr-10">
		                    <input type="text" class="form-control" name="member_phone" placeholder="핸드폰 번호 숫자만 입력" />
                      	</div>
                                            
    					<button name="confirm" class="genric-btn primary-border mb-md-3 mt-sm-3" onclick="checkUserName()">인증번호 보내기</button>
  				 	</div>
                 </div>
                    
                 <div class="col-md-12 form-group">
                    <div class="d-md-flex align-items-center justify-content-md-between">
                      	<div class="flex-fill mr-10">
		                    <input type="text" class="form-control" name="confirmNum" placeholder="인증번호 입력" />
                      	</div>
                                            
    					<button class="genric-btn primary-border mb-md-3 mt-sm-3" onclick="confirmed('id')">확인</button>
  					</div>
                </div>
                    
            	<p class="ml-3" id="msg"></p>
         	</div>
         </div>
         
         <div class="billing_details">
	          <div class="returning_custome">
	           	  <div class="check_title mb-2">
		          	<h2>비밀번호 찾기</h2>
		       	  </div>
                  
                  <div class="col-md-12 form-group">
                    <input type="text" class="form-control" id="member_id" placeholder="아이디" />
                  </div>
                    
                  <div class="col-md-12 form-group">
                    <div class="d-md-flex align-items-center justify-content-md-between">
                      	<div class="flex-fill mr-10">
		                    <input type="text" class="form-control" name="member_phone" placeholder="핸드폰 번호 숫자만 입력" />
                      	</div>
                                            
    					<button name="confirm" class="genric-btn primary-border mb-md-3 mt-sm-3" onclick="checkUserId()">인증번호 보내기</button>
  				 	</div>
                 </div>
                    
                 <div class="col-md-12 form-group">
                    <div class="d-md-flex align-items-center justify-content-md-between">
                      	<div class="flex-fill mr-10">
		                    <input type="text" class="form-control" name="confirmNum" placeholder="인증번호 입력" />
                      	</div>
                                            
    					<button class="genric-btn primary-border mb-md-3 mt-sm-3" onclick="confirmed('pw')">확인</button>
  					</div>
                </div>
                    
            	<p class="ml-3" id="msg_pw"></p>
         	</div>
         </div>
         
         <div id="change_pw" class="billing_details" style="display:none;">
	          <div class="returning_custome">
	           	  <div class="check_title mb-2">
		          	<h2>비밀번호 변경</h2>
		       	  </div>
                  
                  <form class="row contact_form px-3" action="updatePw.do" method="post" novalidate="novalidate">
                  	  <input type="hidden" id="h_member_id" name="member_id" />
					  <input type="hidden" id="h_member_phone" name="member_phone" />
					  
	                  <div class="col-md-12 form-group p_star">
	                    <input type="password" class="form-control" id="newPw" name="member_pw" placeholder="새 비밀번호" />
	                  </div>
	                    
	                  <div class="col-md-12 form-group p_star">
			          	<input type="password" class="form-control" id="checkNewPw" type="password" placeholder="비밀번호 확인" />
	                 </div>
	    				
	    				<button type="submit" class="genric-btn primary-border ml-3 mt-sm-3">비밀번호 변경</button>
                  </form>
                  
         	</div>
         </div>
	</main>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>