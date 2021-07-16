<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	
	<main class="container">
		<div style="display: flex">
	      <!-- Side Menu -->
	      <jsp:include page="admin_menu.jsp"></jsp:include>
	
	      <!-- Content -->
	      <div style="margin: 5rem 0; width: 80%">
	        <div>
	        	<p>총 회원 수 : <span>${mCount }</span></p>
	        	
	        	<p>총 클래스 수 : <span>${cCount }</span></p>
	        	
	        	<p>총 상품 수 : <span>${proCount }</span></p>
	        	
	        </div>
	      </div>
	    </div>
    </main>
    
    <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>