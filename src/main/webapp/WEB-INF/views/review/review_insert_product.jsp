<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<h1>${pDto.product_name }(${pDto.product_no }) 리뷰 작성</h1>
		<form method="post">
		<input type="hidden" name="product_no_str" value="${pDto.product_no }">
		<table border="1">
			<tr>
				<th>ID</th>
				<td><input type="text" name="member_id"value="${mDto.member_id}" readonly /></td>
			</tr>

			<tr>
				<th>제목</th>
				<td><input type="text" name="review_title" /></td>
			</tr>
			<tr>
				<th>평점</th>
				<td><input type="text" name="review_rate" /></td>
			</tr>
					
			<tr>
				<th>작성내용</th>
				<td><textarea rows="10" cols="60" name="review_content"></textarea></td>
			</tr>
		</table>
		<button id="btn-upload" type="button" style="border: 1px solid #ddd; outline: none; cursor: pointer;">파일추가</button>
		<input id="input_file" multiple="multiple" type="file" style="display: none;">
		<span style="font-size: 10px; color: gray;">※첨부파일은 최대 10개까지 등록이 가능합니다.</span>
		<div class="data_file_txt" id="data_file_txt" style="margin: 40px;">
			<span>첨부 파일</span> <br />
			<div id="articlefileChange"></div>
		</div>
		<input type="button" value="리뷰등록" onclick="registerAction()"/> 
		<input type="button" value="취소" onclick="location.href='store_select.do?product_no=${cDto.product_no }'" />
		
	</form>
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
	for (var pair of formData.entries()) {
		//alert(pair[0]+ ', ' + pair[1]); 
	}
   /*
   * 파일업로드 multiple ajax처리
   */    
	$.ajax({
   	      type: "POST",
   	   	  enctype: "multipart/form-data",
   	      url: "review_insertres_product.do",
       	  data : formData,
       	  processData: false,
   	      contentType: false,
   	      success: function (data) {
   	    	if(JSON.parse(data)['result'] == "OK"){
   	    		alert("파일업로드 성공");
   	    		$(location).attr('href',"review_list_product.do");
			} else
				alert("서버내 오류로 처리가 지연되고있습니다. 잠시 후 다시 시도해주세요");
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
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>