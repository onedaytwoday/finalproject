let checked = false;
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

	$("#search_category").change(function() {
		let category = $("select > option:selected").val();

		if (category == 'title+desc+category') {
			checked = true;
		}
	});

	if (autoChecked === 'Y') {
		$("#default-switch").attr('checked', true);
		getAutoCompleted();
	}

	let onoff = $("[name=onoff]");
	onoff.click(function() {
		$("[name=on_off]").toggle();
		getAutoCompleted();
	});

	$("#close").click(function(){
		$("#auto_result").empty();
		$("[name=search_keyword]:eq(0)").val("");
	});
});


function getAutoCompleted() {
	$("[name=search_keyword]:eq(0)").change(function() {
		if ($("#on").is(":visible") && checked) {
			$.ajax({
				type: "post",
				url: "auto_class.do",
				data: JSON.stringify({ "keyword": $("[name=search_keyword]:eq(0)").val() }),
				contentType: "application/json",
				dataType: "json",
				success: function(result) {
					let list = result.list;

					let ul = $("<ul id='results' class='mb-2'></ul>");
					for (let i = 0; i < list.length; i++) {
						let li = $(`<li id=${i} class='border border-light text-muted py-2 px-3' style="cursor:pointer;">${list[i]}</li>`);
						ul.append(li);
					}
					
					$('#auto_result').append(ul);
					
					$('ul').on('click', 'li', function(){
						$("[name=search_keyword]:eq(0)").val($(this).text());
					});
					
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