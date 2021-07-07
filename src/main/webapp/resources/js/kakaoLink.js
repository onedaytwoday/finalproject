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