<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){

    $('#class').on('change', function() {
		//클래스 카테고리 선택시에 이동할 경로 수정
		//카테고리 value는 추후 controller에 맞춰서 수정
		var cate = this.value;
		
		if(cate == "cate01"){
			 alert("카테고리 01"); 
		}else if(cate == "cate02"){
			alert("카테고리 02"); 
		}else if(cate == "cate03"){
			alert("카테고리 03"); 
		}

    });
    
    $('#shop').on('change', function() {
		//쇼핑 카테고리 선택시에 이동할 경로 수정
		//카테고리 value는 추후 controller에 맞춰서 수정
		var cate = this.value;
		
		if(cate == "cate01"){
			alert("카테고리 01");
			 //location.href = 'store.do'; 
		}else if(cate == "cate02"){
			alert("카테고리 02"); 
		}else if(cate == "cate03"){
			alert("카테고리 03"); 
		}

    });
    
    
});


</script>
<style type="text/css">
header{
	border: 1px solid skyblue;
	width: 100%;
	height: 100px;
}

main{
	border: 1px solid red;
	width: 100%;
	height: 1000px;
}

footer{
	border: 1px solid yellow;
	width: 100%;
	height: 100px;
}



ul {
	list-style-type: none;
}

li {
	display: inline;
	margin-left: 10px;
}

#logo{
	float: left;
	margin-right: 1000px;
}

.login{
	margin: 0;
	padding: 0;
	float: right;
}

.headernav{
	margin: 0;
	padding: 0;
	float: right;
	
}
</style>
</head>
<body>

<jsp:forward page="WEB-INF/views/main.jsp"></jsp:forward>

</body>
</html>