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

	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="resources/js/basket.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<main class="container my-0">
      <section class="cart_area section_padding">
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
				                          <img src="resources/assets/img/gallery/card1.png" alt="" />
				                        </div>
				                        <div class="media-body">
				                          <span style="cursor:pointer;" onclick="location.href='store_select.do?product_no=${pList[status.index].product_no }'">${pList[status.index].product_name }</span>
				                        </div>
				                      </div>
				                    </td>
				                    <td>
				                      <h5>${pList[status.index].product_price }원</h5>
				                    </td>
				                    <td>
				                      <div class="product_count">
				                        <span class="input-number-decrement" onclick="updateBasket(${dto.basket_no}, ${pList[status.index].product_price},'decrease')"> <i class="ti-minus"></i></span>
                          				<input id="${dto.basket_no }" class="input-number" type="text" value="${dto.basket_num > 0 ? dto.basket_num : 0}" readonly>
                          				<span class="input-number-increment" onclick="updateBasket(${dto.basket_no}, ${pList[status.index].product_price},'increase')"> <i class="ti-plus"></i></span>
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