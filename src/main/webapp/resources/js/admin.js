function manageMember(type, member_id){
	let member = {
		"member_id": member_id,
		"type": type
	}

	$.ajax({
		type: "post",
		url: "manageMember.do",
		data: JSON.stringify(member),
		contentType: "application/json",
		dataType: "json",
		success: function(result) {
			console.log(result.msg);
		},
		error: function() {
			alert("통신 실패!");
		}
	});
};

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
				console.log(result.status);
				$("#" + payment_no).text(result.status);
			}
		},
		error: function() {
			alert("통신 실패!");
		}
	});
};