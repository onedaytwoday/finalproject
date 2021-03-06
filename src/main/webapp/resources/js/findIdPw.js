let confirm_num = "";
let memberId = "";
let memberPhone = "";
let confirmNum = "";

window.onload = function() {
	let form = document.getElementById("needs-validation");
	form.addEventListener("submit", function(event) {
		if (form.checkValidity() == false) {
			event.preventDefault();
			event.stopPropagation();
			form.classList.add("was-validated");
		}

		// 서버 연동 처리
	}, false);

}

function checkUserName(){
	let member_name = $("#member_name").val();
	let member_phone = $("[name='member_phone']:eq(0)").val();
	
	if(member_name == '' || member_phone == '') {
		$("#msg").text("입력창에 입력해 주세요!");
		$("#msg").css("color", "red");
	
	} else {
		let checkUser = {
				"member_name" : member_name,
				"member_phone" : member_phone
		}
		
		$.ajax({
			url: "findIdPw.do",
			type: "post",
			data: JSON.stringify(checkUser), 
			contentType: "application/json",
			success: function(result) {
				if(result.msg){
					$("#msg").text(result.msg);
					$("#msg").css("color", "red");
				} else {
					console.log("인증번호 : ", result.num);
				
					confirm_num = result.num;
					memberId = result.member_id;	
				}
			},
			error: function(msg) {
				console.log("실패", msg);
			}
		});
	}
	
	$("#member_name").val("");
	$("[name='member_phone']:eq(0)").val("");
}

function checkUserId(){
	memberId = $("#member_id").val();
	memberPhone = $("[name='member_phone']:eq(1)").val();
	
	if(memberId == "" || memberPhone == "") {
		$("#msg_pw").text("입력칸에 입력해주세요!");
		$("#msg_pw").css("color", "red");
		
	} else {
		var checkUser = {
				"member_id" : memberId,
				"member_phone" : memberPhone
		}
		
		$.ajax({
			url: "findIdPw.do",
			type: "post",
			data: JSON.stringify(checkUser), 
			contentType: "application/json",
			success: function(result) {
				if(result.msg){
					$("#msg_pw").text(result.msg);
					$("#msg_pw").css("color", "red");
				} else {
					console.log("인증번호 : ", result.num);
				
					confirm_num = result.num;
				}
			},
			error: function(msg) {
				console.log("실패", msg);
			}
		});
	}
	
	$("#member_id").val("");
	$("input[name='member_phone']:eq(1)").val("");
}

function confirmed(type){
	if(type == "id") {
		confirmNum = $("input[name='confirmNum']:eq(0)").val();
		
		if(confirmNum == '') {
			$("#msg").text('인증번호를 입력해 주세요.');
			$("#msg").css("color", "red");
		
		} else if(confirmNum == confirm_num) {
			$("#msg").text(`아이디는 ${memberId}입니다.`);
		} else {
			$("#msg").text('인증번호가 다릅니다.');
			$("#msg").css("color", "red");
		}
		
		$("[name='confirmNum']:eq(0)").val("");
		
	} else if(type == 'pw') {
		confirmNum = $("[name='confirmNum']:eq(1)").val();
	
		if(confirmNum == '') {
			$("#msg_pw").text('인증번호를 입력해 주세요.');
			$("#msg_pw").css("color", "red");
		
		} else if(confirmNum == confirm_num) {
			$("#msg_pw").text('인증되었습니다.');
			
			$("#change_pw").css("display", "block");
			
			$("#h_member_id").val(memberId);
			$("#h_member_phone").val(memberPhone);
		} else {
			$("#msg_pw").text('인증번호가 다릅니다.');
			$("#msg").css("color", "red");
		}
		
		$("[name='confirmNum']:eq(1)").val("");
	}
}