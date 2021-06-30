<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            referrerpolicy="no-referrer"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  	<script>
        $(function () {
            // var IMP = window.IMP;
            //가맹점 식별코드
            IMP.init('imp68789439');
            IMP.request_pay({
                pg: 'kakaopay',
                pay_method: 'card',
                merchant_uid: 'merchant_' + new Date().getTime(),
                name: '상품1', //결제창에서 보여질 이름
                amount: 100, //실제 결제되는 가격
                buyer_email: 'iamport@siot.do',
                buyer_name: '구매자이름',
                buyer_tel: '010-1234-5678',
                buyer_addr: '서울 강남구 도곡동',
                buyer_postcode: '123-456',
                m_redirect_url : 'http://localhost:8787/one_war/orderCompleteMobile'
            }, function (rsp) {
                console.log("rsp : ", rsp);
				alert("결제 성공!!");
                location.href="/one";
            });

        });
    </script>  
    
</head>
<body>
</body>
</html>