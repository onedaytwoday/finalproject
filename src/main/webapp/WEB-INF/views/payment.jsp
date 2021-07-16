<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
	$(function() {
		//가맹점 식별코드
		IMP.init('imp68789439');
		IMP.request_pay({
			pg : 'kakaopay',
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '${pDto.product_name}', //결제창에서 보여질 이름
			amount : '${pDto.payment_price}', //실제 결제되는 가격
			buyer_email : '${mDto.member_email}',
			buyer_name : '${mDto.member_id}',
			buyer_tel : '${mDto.member_phone}',
			buyer_addr : '${mDto.member_addr}',
		}, function(rsp) {
			if (rsp.success) {
				let paymentVal = {
						payment_del : '결제완료',
						payment_num : '${pDto.payment_num}',
						payment_price: rsp.paid_amount,
						member_id: rsp.buyer_name,
						payment_uid: rsp.imp_uid,
						detail_no: '${pDto.detail_no}',
						product_no: '${pDto.product_no}',
						basket_group: '${pDto.basket_group}'
				}
				
				$.ajax({
					url : 'paymentComplete.do',
					method : 'POST',
					data: JSON.stringify(paymentVal),
					contentType: "application/json",
					dataType: "json",
					success: function(res){
						alert("결제 " + res.msg);
						
						if(res.msg == '성공' && res.basket == 'basket') {
							location.href="deleteAll.do";
						} else {
							location.href="main.do";						
						}
						
					},
					error: function(err){
						alert("통신 실패!");
						location.href="main.do";
					}
				})
				
			}
		});

	});
</script>

</head>
<body>
	<h1>결제 대기 페이지</h1>

</body>
</html>