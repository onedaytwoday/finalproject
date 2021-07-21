document.addEventListener('DOMContentLoaded', function() {
	let calendarEl = document.getElementById('calendar');
	let calendar = new FullCalendar.Calendar(calendarEl, {
		locale: 'ko',
		initialView: 'dayGridMonth',
		contentHeight: 500,
		dayMaxEvents: true,		
		events: function(arg, successCallback) {
			let eventVal = {
				"start": arg.startStr,
				"end": arg.endStr
			}
			$.ajax({
				type: 'post',
				url: 'getSchedules.do',
				data: JSON.stringify(eventVal),
				contentType: "application/json",
				dataType: 'json',
				success: function(result) {
					let events = [];
					if (result.list != null) {
						$.each(result.list, function(index, element) {							
							events.push({
								id: element.detail_no,
								title: element.detail_member_num + '명',
								start: element.detail_date,
								allDay: false,
								eventColor: "#6937a1"
							}); 
						});
					}
					successCallback(events);
				}
			});
		},
		eventClick: function(arg) {
			let date = moment(arg.event.start).format('yyyy-MM-DD HH:mm')
			if (confirm(date +'으로 예약하시겠습니까?')) {
				$("[name='detail_no']").val(arg.event.id);
				$("[name='detail_date']").val(date);
			}
		},
	});
	calendar.render();
});
