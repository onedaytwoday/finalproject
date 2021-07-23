<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
	<link href="resources/admin/css/sb-admin-2.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="resources/js/admin.js"></script>
</head>
<body>
<!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-light sidebar sidebar-light accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="main.do">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="bi bi-emoji-smile"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Admin</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item ${path eq 'dashboard' ? 'active' : '' }">
                <a class="nav-link" href="adminMain.do">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                회원
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item ${path eq 'member' ? 'active' : '' }">
                <a class="nav-link" href="adminMember.do?nowPage=1">
                    <i class="bi bi-people-fill"></i>
                    <span>회원 관리</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider" />

            <!-- Heading -->
            <div class="sidebar-heading">
                콘텐츠
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item ${path eq 'product' ? 'active' : '' }">
                <a class="nav-link" href="adminProduct.do?nowPage=1">
                    <i class="bi bi-bag"></i>
                    <span>상품 관리</span></a>
            </li>
            
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item ${path eq 'class' ? 'active' : '' }">
                <a class="nav-link" href="adminClass.do?nowPage=1">
                    <i class="bi bi-archive"></i>
                    <span>클래스 관리</span></a>
            </li>
            
            <!-- Divider -->
            <hr class="sidebar-divider" />
            
            <!-- Heading -->
            <div class="sidebar-heading">
                게시물
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item ${path eq 'board' ? 'active' : '' }">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#board"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="bi bi-table"></i>
                    <span>게시물 관리</span>
                </a>
                <div id="board" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="adminBoard.do?nowPage=1">상품문의 관리</a>
                        <a class="collapse-item" href="adminEvent.do?nowPage=1">이벤트 관리</a>
                        <a class="collapse-item" href="adminPayment.do?nowPage=1">주문내역 관리</a>
                    </div>
                </div>
            </li>

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