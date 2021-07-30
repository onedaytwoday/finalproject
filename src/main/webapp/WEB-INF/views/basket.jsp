<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Cart</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="resources/js/basket.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<main class="container my-0">
      <section class="cart_area section_padding">
      	<div class="slider-area" style="margin-bottom: 150px;">
			<div class="single-slider slider-height2 d-flex align-items-center">
				<div class="container">
					<div class="row">
						<div class="col-xl-12">
							<div class="hero-cap text-center">
								<h2>Basket</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
        <div class="container">
          <div class="cart_inner">
            <div class="table-responsive">
              <table class="table">
                <thead>
                  <tr>
                    <th scope="col">상품</th>
                    <th scope="col">가격</th>
                    <th scope="col">수량</th>
                    <th scope="col">Total</th>
                  </tr>
                </thead>
                <tbody>
                	<c:choose>
						<c:when test="${empty bList }">
							
						</c:when>
						<c:otherwise>
							<c:forEach items="${bList }" var="dto" varStatus="status">
								<tr>
				                    <td>
				                      <div class="media">
				                        <div class="d-flex">
				                          <img src="resources/upload/${dto.file_new_name }" alt="상품" />
				                        </div>
				                        <div class="media-body">
				                          <span style="cursor:pointer;" onclick="location.href='store_select.do?product_no=${pList[status.index].product_no }'">${pList[status.index].product_name }</span>
				                        </div>
				                      </div>
				                    </td>
				                    <td>
				                      <fmt:parseNumber integerOnly="true" value="${pList[status.index].product_price * (pList[status.index].product_sale / 100) }" var="sale"/>
				                      <h5>${pList[status.index].product_sale > 0 ? (pList[status.index].product_price - sale) : pList[status.index].product_price }원</h5>
				                    </td>
				                    <td>
				                      <div class="product_count">
				                        <fmt:parseNumber integerOnly="true" value="${sale > 0 ? pList[status.index].product_price - sale : pList[status.index].product_price}" var="price"/>
				                        <span class="input-number-decrement"> <i class="ti-minus" style="padding:5px" onclick="updateBasket(${dto.basket_no}, ${price},'decrease')"></i></span>
                          				<input id="${dto.basket_no }" class="input-number" type="text" value="${dto.basket_num > 0 ? dto.basket_num : 0}" readonly>
                          				<span class="input-number-increment"> <i class="ti-plus" style="padding:5px" onclick="updateBasket(${dto.basket_no}, ${price},'increase')"></i></span>
				                      </div>
				                    </td>
				                    <td>
				                      <h5 id="${dto.basket_no }_price">${dto.basket_price > 0 ? dto.basket_price : 0}원</h5>
				                    </td>
				                    <td>
				                    	<i onclick="location.href='deleteBasket.do?basket_no=${dto.basket_no}'" class="bi bi-trash" style="font-size:1.5rem; cursor:pointer;"></i>
				                    </td>
				                  </tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>                  
                  
                  <tr>
                  	<td></td>
                    <td><h5>수량</h5></td>
                    <td><h5 id="num"></h5></td>
                    <td>
                      <h5>Total</h5>
                    </td>
                    <td><h5 id="total"></h5></td>
                  </tr>
                </tbody>
              </table>
              
              <c:if test="${bList.size() > 0 }">
	              <div class="checkout_btn_inner float-right">
	                
	                <form action="payment.do" method="post">
						<input type="hidden" id="total_num" name="payment_num" />
						<input type="hidden" id="total_price" name="payment_price" />
						
						<input type="hidden" name="basket_group" value="${basket_group }" />
						<input type="hidden" name="product_name" value="장바구니에서 구매" />
						<input type="hidden" name="type" value="basket" />
						
						<input class="btn_1 checkout_btn_1" type="submit" value="결제 하기" />
					</form>
	              </div>
              </c:if>
            </div>
          </div>
          </div>
      </section>
	</main>
	
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>