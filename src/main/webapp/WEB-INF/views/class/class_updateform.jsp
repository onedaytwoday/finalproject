<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Class 수정</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>  
<script type="text/javascript">
	function address() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
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
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<div class="slider-area">
		<div class="single-slider slider-height2 d-flex align-items-center">
			<div class="container">
				<div class="row">
					<div class="col-xl-12">
						<div class="hero-cap text-center">
							<h2>Class Update</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="comment-form"
		style="padding-left: 60px; padding-right: 60px">
		<form class="form-contact comment_form" action="classUpdateRes.do" method="post" id="classUpdateRes">
			<input type="hidden" name="class_no" value="${dto.class_no }">
			<div class="row">
			<div class="col-12">
					<div class="form-group">
						<input class="form-control" type="text" name="member_id" value="${mDto.member_id}" readonly >
					</div>
				</div>
				<div class="col-12">
					<div class="form-group">
						<input class="form-control" name="class_title" type="text"
							value="${dto.class_title }" >
					</div>
				</div>
				<div class="col-12">
					<div class="form-group">
						<textarea class="form-control w-100" rows="10" cols="60"
							name="class_desc">${dto.class_desc }</textarea>
					</div>
				</div>
				<div class="col-2">
					<div class="form-group">
					<input class="form-control" type="text" id="postcode" placeholder="Post Code" readonly="readonly">
					</div>
				</div>
				<div class="col-6">
					<div class="form-group">
					<input type="button" class="button button-contactForm btn_1 boxed-btn" onclick="address();" value="우편번호 찾기">
					</div>
				</div>
				<div class="col-6">
					<div class="form-group">
					<input class="form-control" type="text" name="class_loc" id="addr_1" value="${dto.class_loc }" readonly="readonly">
					</div>
				</div>
				<div class="col-6">
					<div class="form-group">
					<input class="form-control" type="text" name="class_loc_2" id="addr_2" placeholder="Detail Address" required="required">
					</div>
				</div>
				<div class="col-12">
					<div class="form-group">
						<input class="form-control" name="class_category" type="text"
							value="${dto.class_category }">
					</div>
				</div>
				<div class="col-12">
					<div class="form-group">
						<input class="form-control" name="class_price"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" type="text"
							value="${dto.class_price }">
					</div>
				</div>
			</div>
			<div class="form-group" align="right">
				<button type="submit" class="button button-contactForm btn_1 boxed-btn" form="classUpdateRes">Send</button>
				<button type="button" class="button button-contactForm btn_1 boxed-btn" onclick="location.href='classDetail.do?class_no=${dto.class_no}'">Cancle</button>
			</div>
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
		
</body>
</html>