<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<style type="text/css">
.lab{
	font-size: 10pt;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('input[name="event"]').change(function() {
			var id = $('input[name="event"]:checked').attr('id');
			if(id == 'sale') {
				$("#sale_rate").next().removeClass("disabled");
			} else {
				$("#sale_rate").next().addClass("disabled");
			}
		});
		
		$('input[name="category"]').change(function() {
			var id = $('input[name="category"]:checked').attr('id');
			if(id == 'class') {
				$("#class_no").next().removeClass("disabled");
				$("#product_no").next().addClass("disabled");
			} else {
				$("#product_no").next().removeClass("disabled");
				$("#class_no").next().addClass("disabled");
			}
		});
	})
</script>
</head>
<body>
<jsp:include page="header.jsp" />
	<div class="comment-form" style="padding-left: 60px; padding-right: 60px">
		<div class="slider-area" style="margin-bottom: 150px;">
			<div class="single-slider slider-height2 d-flex align-items-center">
				<div class="container">
					<div class="row">
						<div class="col-xl-12">
							<div class="hero-cap text-center">
								<h2>Event Insert</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<form class="form-contact comment_form">
		<input type="hidden" name="member_id" value="${mDto.member_id }" />
			<div class="row">
				<div class="col-2" style="margin-bottom: 30px;">
					<div class="switch-wrap d-flex justify-content-start">
						<div class="primary-radio mr-1">
							<input type="radio" id="new" name="event" value="NEW">
							<label for="new"></label>
						</div>
						<span class="lab">New</span>
					</div>
					
				</div>
				<div class="col-1" style="margin-bottom: 30px;">
					<div class="switch-wrap d-flex justify-content-start">
						<div class="primary-radio mr-1">
							<input type="radio" id="sale" name="event" value="할인" checked>
							<label for="sale"></label>
						</div>
						<span class="lab">Sale</span>
					</div>				
				</div>	
				<div class="col-2" style="margin-bottom: 30px;">
					<select name="sale_rate" id="sale_rate">
						<option value="0">0%</option>
		                <option value="10">10%</option>
		                <option value="20">20%</option>
		                <option value="30">30%</option>
		                <option value="40">40%</option>
		                <option value="50">50%</option>
		                <option value="60">60%</option>
		                <option value="70">70%</option>
		                <option value="80">80%</option>
		                <option value="90">90%</option>
					</select>
				</div>
				<div class="col-1" style="margin-bottom: 30px;">
					<div class="switch-wrap d-flex justify-content-start">
						<div class="confirm-radio mr-1">
							<input type="radio" id="class" name="category" value="class" checked>
							<label for="class"></label>
						</div>
						<span class="lab">Class</span>
					</div>
				</div>
				<div class="col-2" style="margin-bottom: 30px;">
					<div id="class_sel" >
						<select name="class_no" id="class_no">
		                  <c:forEach items="${cList }" var="cDto">
		                    <option value="${cDto.class_no }">
		                      ${cDto.class_title }
		                    </option>
		                  </c:forEach>
		                </select>
					</div>
				</div>
				<div class="col-1" style="margin-bottom: 30px;">
					<div class="switch-wrap d-flex justify-content-start">
						<div class="confirm-radio mr-1">
							<input type="radio" id="product" name="category" value="product" >
							<label for="product"></label>
						</div>
						<span class="lab">product</span>
					</div>
				</div>
				<div class="col-2" style="margin-bottom: 30px;">
					<div id="product_sel" >
						<select name="product_no" id="product_no" disabled="disabled">
		                  <c:forEach items="${pList }" var="pDto">
		                    <option value="${pDto.product_no }">
		                      ${pDto.product_name }
		                    </option>
		                  </c:forEach>
		                </select>
		            </div>
				</div>
				<div class="col-12">
					<div class="form-group">
					<input class="form-control" type="text" name="event_title" placeholder="Event Title" required="required">
					</div>
				</div>
				<div class="col-12">
					<div class="form-group">
						<textarea class="form-control w-100" rows="10" cols="60"
							name="event_desc"></textarea>
					</div>
				</div>
				<div class="col-4">
					<div class="form-group">
					<input class="form-control" type="date" name="start" placeholder="Detail Address" required="required">
					</div>
				</div>
				~
				<div class="col-4">
					<div class="form-group">
					<input class="form-control" type="date" name="end" placeholder="Detail Address" required="required">
					</div>
				</div>
			</div>
			<button id="btn-upload" type="button" style="border: 1px solid #ddd; outline: none; cursor: pointer;">파일추가</button>
			<input id="input_file" multiple="multiple" type="file" accept="image/*" style="display: none;">
			<span style="font-size: 10px; color: gray;">※첨부파일은 최대 10개까지 등록이 가능합니다.</span>
			<div class="data_file_txt" id="data_file_txt" style="margin: 40px;">
				<span>첨부 파일</span> <br />
				<div id="articlefileChange"></div>
			</div>
			<div class="form-group" align="right">
				<button type="button" class="button button-contactForm btn_1 boxed-btn" onclick="registerAction()">Send</button>
				<button type="button" class="button button-contactForm btn_1 boxed-btn" onclick="location.href='main.do'">Cancle</button>
			</div>
		</form>
	</div>
	
<script>
$(document).ready(function()
		// input file 파일 첨부시 fileCheck 함수 실행
		{
			$("#input_file").on("change", fileCheck);
		});
/**
 * 첨부파일로직
 */
$(function () {
    $('#btn-upload').click(function (e) {
        e.preventDefault();
        $('#input_file').click();
    });
});
// 파일 현재 필드 숫자 totalCount랑 비교값
var fileCount = 0;
// 해당 숫자를 수정하여 전체 업로드 갯수를 정한다.
var totalCount = 10;
// 파일 고유넘버
var fileNum = 0;
// 첨부파일 배열
var content_files = new Array();
function fileCheck(e) {
    var files = e.target.files;
    
    // 파일 배열 담기
    var filesArr = Array.prototype.slice.call(files);
    
    // 파일 개수 확인 및 제한
    if (fileCount + filesArr.length > totalCount) {
      alert('파일은 최대 '+totalCount+'개까지 업로드 할 수 있습니다.');
      return;
    } else {
    	 fileCount = fileCount + filesArr.length;
    }
    
    // 각각의 파일 배열담기 및 기타
    filesArr.forEach(function (f) {
      var reader = new FileReader();
      reader.onload = function (e) {
        content_files.push(f);
        $('#articlefileChange').append(
       		'<div id="file' + fileNum + '" onclick="fileDelete(\'file' + fileNum + '\')">'
       		+ '<font style="font-size:12px">' + f.name + '</font>'  
       		+ '<img src="resources/images/minus.png" style="width:20px; height:auto; vertical-align: middle; cursor: pointer;"/>' 
       		+ '<div/>'
		);
        fileNum ++;
      };
      reader.readAsDataURL(f);
    });
    console.log(content_files);
    //초기화 한다.
    $("#input_file").val("");
  }
// 파일 부분 삭제 함수
function fileDelete(fileNum){
    var no = fileNum.replace(/[^0-9]/g, "");
    content_files[no].is_delete = true;
	$('#' + fileNum).remove();
	fileCount --;
    console.log(content_files);
}
/*
 * 폼 submit 로직
 */
	function registerAction(){
		
	var form = $("form")[0];        
 	var formData = new FormData(form);
		for (var x = 0; x < content_files.length; x++) {
			// 삭제 안한것만 담아 준다. 
			if(!content_files[x].is_delete){
				 formData.append("files", content_files[x]);
			}
		}
	
   /*
   * 파일업로드 multiple ajax처리
   */    
	$.ajax({
   	      type: "POST",
   	   	  enctype: "multipart/form-data",
   	      url: "eventInsertRes.do",
       	  data : formData,
       	  processData: false,
   	      contentType: false,
   	      success: function (data) {
   	    	if(JSON.parse(data)['result'] == "OK"){
   	    		alert("파일업로드 성공");
   	    		$(location).attr('href','index.do');
			} else
				alert("파일을 업로드 해주세요");
   	    		return false;
   	      },
   	      error: function (xhr, status, error) {
   	    	alert("서버오류로 지연되고있습니다. 잠시 후 다시 시도해주시기 바랍니다.");
   	     return false;
   	      }
   	    });
   	    return false;
	}
</script>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>