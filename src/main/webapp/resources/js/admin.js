// 상품/클래스 관리
let product_list = new Array();
let class_list = new Array();
let qna_list = new Array();

$(function() {
	$('input[name=chk_product]').click(function() {
		product_list.push($(this).val());
	});
	
	$('input[name=chk_class]').click(function() {
		class_list.push($(this).val());
	});
	
	$('input[name=chk_qna]').click(function() {
		qna_list.push($(this).val());
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
			console.log(result.msg);
			$("#" + member_id).val(result.msg);
		},
		error: function() {
			alert("통신 실패!");
		}
	});
};

// 상품/클래스 관리
function allCheck(bool, type) {
	$('input[name=chk_'+type+']').each(function() {
			$(this).prop('checked', bool);
	});
	
}

// 상품/클래스 관리
function deleteChecked() {
	let listVal = {
		"product_list": product_list,
		"class_list": class_list
	};
	
	$.ajax({
		type: "post",
		url: "deleteChecked.do",
		data: JSON.stringify(listVal),
		contentType: "application/json",
		dataType: "json",
		success: function(result) {
			alert(result.msg);
			location.href = 'adminProClass.do';
		},
		error: function() {
			alert("통신 실패!");
		}
	})
}

// 게시물 관리
function deleteQna(){
	let qnaVal = {
		"qna_list": qna_list
	};
	
	$.ajax({
		type: "post",
		url: "deleteQna.do",
		data: JSON.stringify(qnaVal),
		contentType: "application/json",
		dataType: "json",
		success: function(result) {
			alert(result.msg);
			location.href = 'adminBoard.do?nowPage=1';
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