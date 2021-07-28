window.onload = function() {
	document.getElementById("member_ip").value = ip();

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

function address() {
	new daum.Postcode(
		{
			oncomplete: function(data) {
				var roadAddr = data.roadAddress;
				var extraRoadAddr = '';

				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}

				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
						+ data.buildingName : data.buildingName);
				}

				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}

				document.getElementById('postcode').value = data.zonecode;
				document.getElementById("addr_1").value = roadAddr;
				document.getElementById("addr_1").value = data.jibunAddress;

				if (data.autoRoadAddress) {
					document.getElementById("addr_1").value = roadAddr;
				} else if (data.autoJibunAddress) {
					document.getElementById("addr_1").value = data.jibunAddress;
				} else {
				}
			}
		}).open();
}

function idCheckConfirm() {
	var chk = document.getElementsByName("member_id")[0].title;
	if (chk == "n") {
		alert("id 중복체크를 먼저 해주세요.");
		document.getElementsByName("member_id")[0].focus();
	}
}

function idCheck() {
	var doc = document.getElementsByName("member_id")[0];
	if (doc.value.trim() == "" || doc.value == null) {
		alert("id를 입력해 주세요");
	} else {
		open("idcheck.do?member_id=" + doc.value, "", "width=200, height=200");
	}
}

function check() {
	var member_phone = $('input[name=member_phone_1]').val()
		+ $('input[name=member_phone_2]').val()
		+ $('input[name=member_phone_3]').val();
	$('input[name=member_phone]').attr('value', member_phone);

	var member_addr = $('input[name=member_addr_1]').val()
		+ $('input[name=member_addr_2]').val();
	$('input[name=member_addr]').attr('value', member_addr);
}