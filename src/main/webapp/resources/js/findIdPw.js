let confirm_num = "";
let memberId = "";
let memberPhone = "";
let id_pw = "id";
let confirmNum = "";

function checkUserName(){
	const member_name = $("#member_name").val();
	const member_phone = $("input[name='member_phone']:eq(0)").val();
	
	if(member_name == "" || member_phone == "") {
		$("#msg").text("입력칸에 입력해주세요");
		$("#msg").css("color", "red");
	} else {
		var checkUser = {
				"member_name" : member_name,
				"member_phone" : member_phone
		}
		
		$.ajax({
			url: "findIdPw.do",
			type: "post",
			data: JSON.stringify(checkUser), 
			contentType: "application/json",
			success: function(result) {
				$("#msg").text(result.msg);
				
				confirm_num = result.msg;
				memberId = result.member_id;
			},
			error: function(msg) {
				console.log("실패", msg);
			}
		});
	}
	
	$("#member_name").val("");
	$("input[name='member_phone']:eq(0)").val("");
	$("#msg").text("");
}

function checkUserId(){
	id_pw = "pw";
	
	memberId = $("#member_id").val();
	memberPhone = $("input[name='member_phone']:eq(1)").val();
	
	if(memberId == "" || memberPhone == "") {
		$("#msg_pw").text("입력칸에 입력해주세요");
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
				$("#msg_pw").text("인증번호 ", result.msg);				
				confirm_num = result.msg;
			},
			error: function(msg) {
				console.log("실패", msg);
			}
		});
	}
	
	$("#member_id").val("");
	$("input[name='member_phone']:eq(1)").val("");
	$("#msg_pw").text("");
}

function confirm(){
	if(id_pw == "id") {
		confirmNum = $("input[name='confirmNum']:eq(0)").val();
	
		if(confirmNum == confirm_num) {
			$("#msg").text(`아이디는 ${memberId}입니다.`);
		} else {
			$("#msg").text('인증번호가 다릅니다.');
		}
		
		$("input[name='confirmNum']:eq(0)").val("");
		
	} else if(id_pw == 'pw') {
		confirmNum = $("input[name='confirmNum']:eq(1)").val();
	
		if(confirmNum == confirm_num) {
			$("#msg_pw").text('인증되었습니다.');
			
			$("#changePw").css("display", "block");
			$("#h_member_id").val(memberId);
			$("#h_member_phone").val(memberPhone);
		} else {
			$("#msg_pw").text('인증번호가 다릅니다.');
		}
		
		$("input[name='confirmNum']:eq(1)").val("");
	}
}
