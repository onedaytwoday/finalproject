<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="height: 100vh; display: flex">
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
</body>
</html>