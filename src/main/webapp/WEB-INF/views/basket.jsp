<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
	<link rel="stylesheet" href="resources/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="resources/assets/css/owl.carousel.min.css">
	<link rel="stylesheet" href="resources/assets/css/flaticon.css">
    <link rel="stylesheet" href="resources/assets/css/slicknav.css">
    <link rel="stylesheet" href="resources/assets/css/animate.min.css">
    <link rel="stylesheet" href="resources/assets/css/magnific-popup.css">
    <link rel="stylesheet" href="resources/assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="resources/assets/css/themify-icons.css">
    <link rel="stylesheet" href="resources/assets/css/slick.css">
    <link rel="stylesheet" href="resources/assets/css/nice-select.css">
    <link rel="stylesheet" href="resources/assets/css/style.css">
	<link rel="stylesheet" href="resources/assets/css/basket.css">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="resources/js/basket.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<main class="container">
	
		<!-- Shopping Cart Section Begin -->
    <section class="shopping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="cart-table">
                        <table>
                            <thead>
                                <tr>
                                    <th>Image</th>
                                    <th class="p-name">Product Name</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th><i class="ti-close"></i></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="cart-pic first-row"><img src="img/cart-page/product-1.jpg" alt=""></td>
                                    <td class="cart-title first-row">
                                        <h5>Pure Pineapple</h5>
                                    </td>
                                    <td class="p-price first-row">$60.00</td>
                                    <td class="qua-col first-row">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text" value="1">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="total-price first-row">$60.00</td>
                                    <td class="close-td first-row"><i class="ti-close"></i></td>
                                </tr>
                                <tr>
                                    <td class="cart-pic"><img src="img/cart-page/product-2.jpg" alt=""></td>
                                    <td class="cart-title">
                                        <h5>American lobster</h5>
                                    </td>
                                    <td class="p-price">$60.00</td>
                                    <td class="qua-col">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text" value="1">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="total-price">$60.00</td>
                                    <td class="close-td"><i class="ti-close"></i></td>
                                </tr>
                                <tr>
                                    <td class="cart-pic"><img src="img/cart-page/product-3.jpg" alt=""></td>
                                    <td class="cart-title">
                                        <h5>Guangzhou sweater</h5>
                                    </td>
                                    <td class="p-price">$60.00</td>
                                    <td class="qua-col">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text" value="1">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="total-price">$60.00</td>
                                    <td class="close-td"><i class="ti-close"></i></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="cart-buttons">
                                <a href="#" class="primary-btn continue-shop">Continue shopping</a>
                                <a href="#" class="primary-btn up-cart">Update cart</a>
                            </div>
                        </div>
                        <div class="col-lg-4 offset-lg-4">
                            <div class="proceed-checkout">
                                <ul>
                                    <li class="subtotal">Subtotal <span>$240.00</span></li>
                                    <li class="cart-total">Total <span>$240.00</span></li>
                                </ul>
                                <a href="#" class="proceed-btn">PROCEED TO CHECK OUT</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shopping Cart Section End -->
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		<h1>장바구니</h1>
		
		<table border="1">
			<col width="100" />
			<col width="100" />
			<col width="150" />
			<col width="100" />
			<tr>
				<th>상품</th>
				<th>상품명</th>
				<th>수량</th>
				<th>가격</th>
				<th></th>
			</tr>
			<c:choose>
				<c:when test="${empty bList }">
					<tr>
						<th colspan="4">------------장바구니가 비었습니다.------------</th>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${bList }" var="dto" varStatus="status">
						<tr>
							<td>상품사진</td>
							<td><a href="store_select.do?product_no=${pList[status.index].product_no }">${pList[status.index].product_name }</a></td>
							<td>
								<i onclick="updateBasket(${dto.basket_no}, ${pList[status.index].product_price},'increase')" class="bi bi-plus-square" style="font-size:1.5rem; margin-right: 0.5rem; cursor:pointer;"></i>
									
									<span id="${dto.basket_no }">${dto.basket_num > 0 ? dto.basket_num : 0}</span>
								
								<i onclick="updateBasket(${dto.basket_no}, ${pList[status.index].product_price},'decrease')" class="bi bi-dash-square" style="font-size:1.5rem; margin-left: 0.5rem; cursor:pointer;"></i>
							</td>
							<td id="${dto.basket_no }_price">${dto.basket_price > 0 ? dto.basket_price : 0}원</td>
							
							<td><i onclick="location.href='deleteBasket.do?basket_no=${dto.basket_no}'" class="bi bi-trash" style="font-size:1.5rem; cursor:pointer;"></i></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	
		<div style="border: 1px solid lightgray; width: fit-content; margin-top: 2rem; padding: 2rem;">
			<h3>Total</h3>
			
			<form action="payment.do" method="post" style="display:flex; flex-direction:column;">
				<p style="margin-bottom: 1rem;">총 수량 : <input type="text" id="total_num" name="payment_num" readonly /></p> 
				<p style="margin-bottom: 1rem;">총 가격 : <input type="text" id="total_price" name="payment_price" readonly />원</p>
				
				<input type="hidden" name="basket_group" value="${basket_group }" />
				<input type="hidden" name="product_name" value="장바구니에서 구매" />
				<input type="hidden" name="type" value="basket" />
				
				<input type="submit" value="결제 하기" />
			</form>
		</div>
	</main>
	
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>