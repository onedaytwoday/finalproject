$(function() {
	$.ajax({
		type: 'get',
		url: 'getEvents.do',
		dataType: "json",
		success: function(result) {
			let list = $.makeArray(result.list);
			$.map(list, function(event, i) {
				slider(i);
				banner(i, event.file_new_name, event.event_title, event.event_desc)
			})

		},
		error: function(err) {
			console.log(err)
		}
	})
})


function slider(i){
	let btn;
	if(i==0){
		btn = "<button type='button' data-bs-target='#carouselExampleCaptions' data-bs-slide-to='0' class='active' aria-current='true' aria-label='Slide 1'></button>"
	} else {
		btn = `<button type='button' data-bs-target='#carouselExampleCaptions' data-bs-slide-to=${i} aria-label='Slide ${i+1}'></button>`
	}
	
	
	$("#indicator").append(btn);
}

function banner(i, file_name, event_title, event_desc){
	let div;
	let src;
	
	if(i == 0) {
		div = "<div class='carousel-item active'></div>"
	} else {
		div = "<div class='carousel-item'></div>"
	}
	
	if(file_name == null || file_name == ""){
		src="resources/images/event.jpg"	
	} else {
		src="/upload/"+file_name
	}
	
	let img = `<img src=${src} class='d-block w-100' style='height:500px; object-fit:cover;' alt='...'>`;
	
	let divCap = "<div class='carousel-caption d-none d-md-block'></div>";
	let title = "<h5>"+event_title+"<h5>";
	let desc = "<p>"+event_desc+"</p>"
	let caption = $(divCap).append(title).append(desc)
	
	let image = $(div).append(img).append(caption);
	
	$("#banner").append(image)
}



