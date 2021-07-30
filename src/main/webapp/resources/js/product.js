$(function() {
	let autoChecked = $("#member_auto").val();

	let category = "${category}";
	if (category == "handmade") {
		$('#nav-handmade-tab').addClass("active");
	} else if (category == "cooking") {
		$('#nav-cooking-tab').addClass("active");
	} else if (category == "flower") {
		$('#nav-flower-tab').addClass("active");
	} else if (category == "drawing") {
		$('#nav-drawing-tab').addClass("active");
	} else if (category == "music") {
		$('#nav-music-tab').addClass("active");
	} else if (category == "yoga") {
		$('#nav-yoga-tab').addClass("active");
	} else if (category == "") {
		$('#nav-home-tab').addClass("active");
	}

	if (autoChecked === 'Y') {
		$("#default-switch").attr('checked', true);
		getAutoCompleted();
	}

	let onoff = $("[name=onoff]");
	onoff.click(function() {
		$("[name=on_off]").toggle();
		getAutoCompleted();
	});

	$("#close").click(function() {
		$("#auto_result").empty();
		$("[name=search_keyword]:eq(0)").val("");
	});

});

function getAutoCompleted() {
	$("[name=search_keyword]:eq(0)").change(function() {
		if ($("#on").is(":visible")) {
			$.ajax({
				type: "post",
				url: "auto_product.do",
				data: JSON.stringify({ "keyword": $("[name=search_keyword]:eq(0)").val() }),
				contentType: "application/json",
				dataType: "json",
				success: function(result) {
					let list = result.list;
	
					for (let i = 0; i < list.length; i++) {
						let input = $(`<input id=${i} type='text' class='form-control bg-white border-right' style="cursor:pointer;" value= ${list[i]} readonly />`);
						$("#auto_result").append(input);
	
						$(`#${i}`).click(function() {
							let newInput = $(`#${i}`).val();
							$("[name=search_keyword]:eq(0)").val(newInput);
						});
					}
	
				},
				error: function() {
					alert("통신 실패!");
				}
			});
		} else if(!$("#on").is(":visible")){
			$("#auto_result").empty();
		}
	});
}
