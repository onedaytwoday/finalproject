<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" referrerpolicy="no-referrer"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	
	<!-- Page Wrapper -->
    <div id="wrapper">
		<jsp:include page="admin_menu.jsp"></jsp:include>
        
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
                <!-- Begin Page Content -->
                <div class="container-fluid mt-3">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="row">

                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                TOTAL 회원 수</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${mCount }명</div>
                                        </div>
                                        <div class="col-auto">
                                        	<i class="bi bi-people-fill text-gray-300" style="font-size:2rem;"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                TOTAL 클래스 수</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${cCount }</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="bi bi-archive text-gray-300" style="font-size:2rem;"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                TOTAL 상품 수</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${proCount }</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="bi bi-bag text-gray-300" style="font-size:2rem;"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                TOTAL 결제 수</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${pCount }</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="bi bi-credit-card text-gray-300" style="font-size:2rem;"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->
				
				<div class="w-75 h-75 mx-auto">
				  <c:forEach items="${chart }" var="c">
				  	<input type="hidden" name="prices" value="${c.payment_price}" />
				  	<input type="hidden" name="dates" value="${c.payment_date}" />
				  </c:forEach>
				  
				  <canvas id="myChart"></canvas>
				</div>
				
            </div>
            <!-- End of Main Content -->
           </div>
		</div>

    <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
    
    
    
</body>
</html>