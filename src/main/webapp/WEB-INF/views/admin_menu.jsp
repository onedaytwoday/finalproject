<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
 <style>
      ul li {
        padding: 2rem 3rem;
        margin-bottom: 2rem;
        border-radius: 10px;
      }

      ul li:hover {
        background-color: olive;
        cursor: pointer;
      }
</style>
</head>
<body>
	<div style="width: fit-content; padding: 2rem; margin: 5rem 2rem">
        <ul style="list-style-type: none">
          <li onclick="location.href='main.do'"><i class="bi bi-house-fill" style="font-size: 2rem; cursor:pointer;"></i>메인으로</li>
          <li onclick="location.href='adminMember.do'">회원 관리</li>
          <li onclick="location.href='adminProClass.do'">상품 / 클래스 관리</li>
          <li onclick="location.href='adminBoard.do?nowPage=1'">게시물 관리</li>
          <li onclick="location.href='adminPayment.do'">주문 관리</li>
        </ul>
     </div>
</body>
</html>