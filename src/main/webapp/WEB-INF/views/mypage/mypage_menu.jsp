<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/admin/css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

</head>
<body>
	<!-- Sidebar -->
	<ul
		class="navbar-nav bg-gradient-light sidebar sidebar-light accordion"
		id="accordionSidebar">

		<!-- Sidebar - Brand -->
		<a
			class="sidebar-brand d-flex align-items-center justify-content-center"
			href="main.do">
			<div class="sidebar-brand-icon rotate-n-15">
				<i class="bi bi-emoji-smile"></i>
			</div>
			<div class="sidebar-brand-text mx-3">${mDto.member_id }</div>
		</a>

		<!-- Divider -->
		<hr class="sidebar-divider">

		<!-- Heading -->
		<div class="sidebar-heading">내 정보</div>

		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item ${path eq 'update' ? 'active' : '' }"><a
			class="nav-link" href="mypage_update.do"> 
			<i class="bi bi-person"></i> <span>개인정보 관리</span></a>
		</li>
				
		<!-- Divider -->
		<hr class="sidebar-divider" />

		<c:choose>
			<c:when test="${mDto.member_grade eq '강사회원' }">
				<!-- Heading -->
				<div class="sidebar-heading">내가 쓴 글</div>
				
				<!-- Nav Item - Pages Collapse Menu -->
				<li class="nav-item ${path eq 'class' ? 'active' : '' }"><a
					class="nav-link" href="mypage_class.do?nowPage=1"> <i
						class="bi bi-bag"></i> <span>클래스</span></a></li>
						
			</c:when>
		
			<c:otherwise>
				<!-- Heading -->
				<div class="sidebar-heading">결제 내역</div>
		
				<!-- Nav Item - Pages Collapse Menu -->
				<li class="nav-item ${path eq 'payment' ? 'active' : '' }"><a
					class="nav-link" href="mypage_payment.do?nowPage=1"> <i
						class="bi bi-bag"></i> <span>상품 / 클래스</span></a></li>
						
				<!-- Divider -->
				<hr class="sidebar-divider" />
		
				<!-- Heading -->
				<div class="sidebar-heading">게시판</div>
		
				<!-- Nav Item - Pages Collapse Menu -->
				<li class="nav-item ${path eq 'board' ? 'active' : '' }">
					<a
						class="nav-link collapsed" href="#" data-toggle="collapse"
						data-target="#board" aria-expanded="true"
						aria-controls="collapsePages"> <i class="bi bi-table"></i> <span>내가 쓴 글</span>
					</a>
					<div id="board" class="collapse" aria-labelledby="headingPages"
						data-parent="#accordionSidebar">
						<div class="bg-white py-2 collapse-inner rounded">
							<a class="collapse-item" href="mypage_board.do?nowPage=1">상품 문의</a>
							<a class="collapse-item" href="mypage_review.do?nowPage=1">후기</a>
						</div>
					</div>
				</li>	
			
			</c:otherwise>
		
		</c:choose>


		

		<!-- Divider -->
		<hr class="sidebar-divider d-none d-md-block">

		<!-- Sidebar Toggler (Sidebar) -->
		<div class="text-center d-none d-md-inline">
			<button class="rounded-circle border-0" id="sidebarToggle"></button>
		</div>

	</ul>
	<!-- End of Sidebar -->

	<script src="resources/admin/js/sb-admin-2.min.js"></script>
</body>
</html>