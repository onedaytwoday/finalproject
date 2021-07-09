$(function(){
	getTotalBasket();
});

function getTotalBasket(){
	$.ajax({
			type: "post",
			url: "getTotalBasket.do",
			dataType: "json",
			success: function(res) {
				$("#total_num").text(String(res.total_num));
				$("#total_price").text(String(res.total_price));
			},
			error: function() {
				alert("통신 실패!");
			}
	});
};

function updateBasket(basket_no, price, type){
		basket_num = $("#"+ basket_no).text();
		
		if(type == 'increase') {
			$("#"+ basket_no).text(Number(basket_num) + 1);		
			
		} else if(type == 'decrease') {
			if(basket_num > 0) {
				$("#"+ basket_no).text(Number(basket_num) - 1);			
			} else {
				$("#"+ basket_no).text(0);			
			}
		}
		
		basket_num = $("#"+ basket_no).text();
		
		basket_price = Number(price * basket_num);
		
		$("#"+basket_no+"_price").text(basket_price+"원");
				
		let basketVal = {
				"basket_no" : Number(basket_no),
				"basket_num" : Number(basket_num),
				"basket_price" : Number(basket_price)
		}

		$.ajax({
			type: "post",
			url: "updateBasket.do",
			data: JSON.stringify(basketVal),
			contentType: "application/json",
			dataType: "json",
			success: function(msg) {
				if(msg.result == '성공') {
					getTotalBasket();
				}
			},
			error: function() {
				alert("통신 실패!");
			}
		});
}