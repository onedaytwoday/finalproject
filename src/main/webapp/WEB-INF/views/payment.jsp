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
            //가맹점 식별코드
            IMP.init('imp68789439');
            IMP.request_pay({
                pg: 'kakaopay',
                pay_method: 'card',
                merchant_uid: 'merchant_' + new Date().getTime(),
                name: '${dto.class_title}', //결제창에서 보여질 이름
                amount: '${dto.class_price}', //실제 결제되는 가격
                buyer_email: '${member.member_email}',
                buyer_name: '${dto.member_id}',
                buyer_tel: '${member.member_phone}',
                buyer_addr: '${member.member_addr}',
                buyer_postcode: '123-456',
                m_redirect_url : 'http://localhost:8787/one_war/orderCompleteMobile'
            }, function (rsp) {
                if(rsp.success){
                	alert("결제 성공");
                	location.href="paymentSuccess.do";
                }
            });

        });
    </script>  

</head>
<body>
	<h1>결제 대기 페이지</h1>

</body>
</html>