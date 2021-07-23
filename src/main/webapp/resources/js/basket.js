$(function(){
	getTotalBasket();
});

function getTotalBasket(){
	$.ajax({
			type: "post",
			url: "getTotalBasket.do",
			dataType: "json",
			success: function(res) {
				$("#total").text(String(res.total_price)+"원");
				$("#num").text(String(res.total_num)+"개");
				$("#total_num").val(String(res.total_num));
				$("#total_price").val(String(res.total_price));
			},
			error: function() {
				alert("통신 실패!");
			}
	});
};

function updateBasket(basket_no, price, type){
		basket_num = $("#"+ basket_no).val();
		
		if(type == 'increase') {
			$("#"+ basket_no).val(Number(basket_num) + 1);		
			
		} else if(type == 'decrease') {
			if(basket_num > 0) {
				$("#"+ basket_no).val(Number(basket_num) - 1);			
			} else {
				$("#"+ basket_no).val(0);			
			}
		}
		
		basket_num = $("#"+ basket_no).val();
		
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