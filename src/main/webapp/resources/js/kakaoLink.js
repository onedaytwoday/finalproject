Kakao.init('631052c93235de2b2e8dd802fb5c5f6f');

function getEvents() {
	$.ajax({
		type: "get",
		url: "getEvents.do",
		dataType: "json",
		success: function(result) {
			let list = result.list;
			let events = $.makeArray(list);
			sendEvent(events);
		},
		error: function() {
			alert("통신실패");
		}
	})
}

function notificationOn() {
	Kakao.Auth.login({
		scope: 'TALK_MESSAGE',
		success: function() {
			Kakao.API.request({
				url: '/v2/api/talk/memo/send',
				data: {
					template_id: 56416,
					template_args: {
						title: "환영합니다!!",
						description: "${description}"
					},
				}, success: function(res) {
					alert('success: ' + JSON.stringify(res))
				},
				fail: function(err) {
					alert('error: ' + JSON.stringify(err))
				},
			})
		},
		fail: function(err) {
			alert('failed to login: ' + JSON.stringify(err))
		},
	})
}

function checkIP() {
	Kakao.Auth.login({
		scope: 'TALK_MESSAGE',
		success: function() {
			Kakao.API.request({
				url: '/v2/api/talk/memo/send',
				data: {
					template_id: 56417,
					template_args: {
						title: "${title}",
						description: "${description}"
					},
				}, success: function(res) {
					alert('success: ' + JSON.stringify(res))
				},
				fail: function(err) {
					alert('error: ' + JSON.stringify(err))
				},
			})
		},
		fail: function(err) {
			alert('failed to login: ' + JSON.stringify(err))
		},
	})
}

function sendEvent(events) {
	console.log(events);
	$.map(events, function(event, i) {

		let discounted = Math.round(event.original_price * (event.event_sale / 100));
		let newPrice = event.original_price - discounted
		
		sendKakao(event, newPrice)
		
	})
}

function sendKakao(event, newPrice){
	Kakao.Auth.login({
			scope: 'TALK_MESSAGE',
			success: function() {
				Kakao.API.request({
					url: '/v2/api/talk/memo/send',
					data: {
						template_id: 56492,
						template_args: {
							//이미지 추가해야함
							'${event_title}': event.event_title,
							'${event_desc}': event.event_desc,
							'${original_price}': event.original_price,
							'${sale_rate}': event.event_sale,
							'${new_price}': newPrice
						},
					}, success: function(res) {
						alert('success: ' + JSON.stringify(res))
					},
					fail: function(err) {
						alert('error: ' + JSON.stringify(err))
					},
				})
			},
			fail: function(err) {
				alert('failed to login: ' + JSON.stringify(err))
			},
		});
}
