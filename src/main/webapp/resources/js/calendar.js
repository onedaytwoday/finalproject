document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		locale: 'ko',
		initialView: 'dayGridMonth',
		contentHeight: 500,
		dayMaxEvents: true,		
		events: function(arg, successCallback, failureCallback) {
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
					var events = [];
					if (result.list != null) {
						$.each(result.list, function(index, element) {
							events.push({
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
		}
		
	});
	calendar.render();
});
