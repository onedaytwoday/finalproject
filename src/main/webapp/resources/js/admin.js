// 상품/클래스 관리
let checked_list = new Array();

$(function() {
	$('input[name=chk_product]').click(function() {
		checked_list.push($(this).val());
	});
	
	$('input[name=chk_class]').click(function() {
		checked_list.push($(this).val());
	});
	
	$('input[name=chk_qna]').click(function() {
		checked_list.push($(this).val());
	});
	
});

// 회원 관리
function manageMember(member_id) {
	let member = {
		"member_id": member_id,
	}

	$.ajax({
		type: "post",
		url: "manageMember.do",
		data: JSON.stringify(member),
		contentType: "application/json",
		dataType: "json",
		success: function(result) {
			$("#" + member_id).val(result.msg);
		},
		error: function() {
			alert("통신 실패!");
		}
	});
};


function allCheck(bool, type) {
	$('input[name=chk_'+type+']').each(function() {
			$(this).prop('checked', bool);
	});
}

// 상품 & 클래스 & 게시물 관리
function deleteChecked(type) {
	let Type = new Array();
	Type.push(type);
	
	let listVal = {
		"type": Type,
		"checked_list": checked_list
	};
	
	let url;
	
	type == 'product' ? url = 'adminProduct.do?nowPage=1' : type == 'class' ? url = 'adminClass.do?nowPage=1' : url = 'adminBoard.do?nowPage=1';
	
	$.ajax({
		type: "post",
		url: "deleteChecked.do",
		data: JSON.stringify(listVal),
		contentType: "application/json",
		dataType: "json",
		success: function(result) {
			alert(result.msg);
			
			if(result.msg == '성공') {location.href = url};
		},
		error: function() {
			alert("통신 실패!");
		}
	})
}

// 결제 관리
function updateStatus(payment_no) {
	let updateStatus = {
		"payment_no": Number(payment_no)
	}

	$.ajax({
		type: "post",
		url: "updateStatus.do",
		data: JSON.stringify(updateStatus),
		contentType: "application/json",
		dataType: "json",
		success: function(result) {
			if (result.msg == '성공') {
				$("#" + payment_no).text(result.status);
			}
		},
		error: function() {
			alert("통신 실패!");
		}
	});
};