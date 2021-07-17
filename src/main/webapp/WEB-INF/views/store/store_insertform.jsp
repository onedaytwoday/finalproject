<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>상품 등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

	<main class="container">
		<h1>상품 등록</h1>
		<form method="post">
			<table border="1">
				<tr>
					<th>상품 카테고리</th>
					<td><select name="product_category">
							<option value="cate01">카테고리1</option>
							<option value="cate02">카테고리2</option>
							<option value="cate03">카테고리3</option>
					</select></td>
				</tr>
				<tr>
					<th>상품명</th>
					<td><input type="text" name="product_name" value=""></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="text" name="product_price" value=""></td>
				</tr>
				<tr>
					<th>할인율</th>
					<td><input type="text" name="product_sale" value=""></td>
				</tr>
				<tr>
					<th>위치</th>
					<td><input type="text" name="product_loc" value=""></td>
				</tr>
				<tr>
					<th>배송 여부</th>
					<td>
						<input type="radio" name="product_del" value="배송가능" />배송가능
					 	<input type="radio" name="product_del" value="배송불가능" />배송불가능
					</td>
				</tr>
				<tr>
					<th>상품 상세 설명</th>
					<td><textarea name="product_desc" rows="10" cols="60"></textarea></td>
				</tr>
			</table>
			<button id="btn-upload" type="button"
				style="border: 1px solid #ddd; outline: none; cursor: pointer;">파일
				추가</button>
			<input id="input_file" multiple="multiple" type="file" accept="image/*" style="display: none;"> 
			<span style="font-size: 10px; color: gray;">※첨부파일은 최대 10개까지 등록이 가능합니다.</span>
			<div class="data_file_txt" id="data_file_txt" style="margin: 40px;">
				<span>첨부 파일</span> <br />
				<div id="articlefileChange"></div>
			</div>
			<input type="button" value="등록하기" onclick="registerAction()"/> 
			<input type="button" value="목록" onclick="location.href='store.do?nowPage=1'" />
		</form>
	</main>
	
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
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
   	      url: "productInsertRes.do",
       	  data : formData,
       	  processData: false,
   	      contentType: false,
   	      success: function (data) {
   	    	if(JSON.parse(data)['result'] == "OK"){
   	    		alert("파일업로드 성공");
   	    		$(location).attr('href',"store.do?nowPage=1");
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

</body>
</html>