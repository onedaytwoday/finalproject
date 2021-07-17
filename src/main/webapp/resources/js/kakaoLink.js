Kakao.init('631052c93235de2b2e8dd802fb5c5f6f');

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
					console.log('success: ' + JSON.stringify(res))
				},
				fail: function(err) {
					console.log('error: ' + JSON.stringify(err))
				},
			})
		},
		fail: function(err) {
			console.log('failed to login: ' + JSON.stringify(err))
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
					console.log('success: ' + JSON.stringify(res))
				},
				fail: function(err) {
					console.log('error: ' + JSON.stringify(err))
				},
			})
		},
		fail: function(err) {
			console.log('failed to login: ' + JSON.stringify(err))
		},
	})
}

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

function sendEvent(events) {
	let i = 0;
	let val = setInterval(function(){
		if(i == events.length) {
			clearInterval(val);
		} else {
			let discounted = Math.round(events[i].original_price * (events[i].event_sale / 100));
			let newPrice = events[i].original_price - discounted
			sendKakao(events[i], newPrice);
			i++
		}
	}, 1000)
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
						console.log('success: ' + JSON.stringify(res))
					},
					fail: function(err) {
						console.log('error: ' + JSON.stringify(err))
					},
				})
			},
			fail: function(err) {
				console.log('failed to login: ' + JSON.stringify(err))
			},
		});
}


