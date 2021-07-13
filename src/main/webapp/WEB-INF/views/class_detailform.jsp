<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	let nums = new Array();
	let dates = new Array();
	let times = new Array();
	
	$(function(){
		let detail_member_num;
		let detail_time;
		let detail_date;
		let count=0;
	
		$("#detail_member_num").change(function(){
			detail_member_num = $("#detail_member_num").val();			
		});
		
		$("#detail_time").change(function(){
			detail_time = $("#detail_time").val();			
		});
		
		$("#detail_date").change(function(){
			let confirmed = confirm("이 날짜를 추가 하시겠습니까?");
			let div = $("<div id="+count+"></div>");
			$("#panels").append(div)
			
			if(confirmed){
				detail_date = $("#detail_date").val();		
			
				let num = $("<p></p>").text("모집인원 : " + detail_member_num);
				let date = $("<p></p>").text("날짜 : " + detail_date);
				let time = $("<p></p>").text("시간 : " + detail_time);
				let deleteBtn = $("<input onclick='deletePanel("+count+")' type='button' />").val("삭제");
				
				$("#"+count).append(num, date, time, deleteBtn);
				$("#"+count).css("border", "1px solid lightgray");
				
				nums.push(detail_member_num);
				dates.push(detail_date);
				times.push(detail_time);
			}
			
			count++;
			$("#detail_member_num").val("");
			$("#detail_time").val("");
			$("#detail_date").val("");
		
			
		});
	});
	
	function deletePanel(count){
		$("#"+count).remove();
	}
	
	function addToDetail(){
		let detailVal = {
				"nums": nums,
				"dates": dates,
				"times": times
		}
		console.log(detailVal)
		
		
		$.ajax({
			type: "post",
			url: "classDetailRes.do?class_no="+${class_no},
			data: JSON.stringify(detailVal),
			contentType: "application/json",
			dataType: "json",
			success: function(result) {
				if(result.msg == '성공') {
					location.href='classList.do';
				} else {
					alert("저장 실패!");
				}
			},
			error: function() {
				alert("통신 실패!");
			}
		});
	}
</script>

</head>
<body>

	<div class="container">
		<h1>클래스 상세 입력 페이지</h1>

			<div class="form-group row">
				<label for="detail_member_num" class="col-sm-2 col-form-label">모집인원</label>
				
				<div class="col-sm-10">
					<input type="text" id="detail_member_num" name="detail_member_num" class="form-control" />명
				</div>
			</div>
			
			<div class="form-group row">
				<label for="detail_time" class="col-sm-2 col-form-label">가능한 시간</label>
				<div class="col-sm-10">
					<input type="time" class="form-control" id="detail_time" />
				</div>
			</div>
			
			<div class="form-group row">
				<label for="detail_date" class="col-sm-2 col-form-label">가능한 날짜</label>
				<div class="col-sm-10">
					<input type="date" class="form-control" id="detail_date" />
				</div>
			</div>
			
			<div id="panels"></div>
			
			<div class="form-group row">
				<div class="col-sm-10">
					<button onclick="addToDetail()" class="btn btn-primary">추가</button>
				</div>
			</div>
		
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>