<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="resources/js/summernote-ko-KR.js"></script>
<script>
    $(document).ready(function() {
        $('#summernote').summernote({
        height: 300,
        lang: 'ko-KR',
        toolbar: [
            ['Font Style', ['fontname']],
            ['style', ['bold', 'italic', 'underline']],
            ['font', ['strikethrough']],
            ['fontsize', ['fontsize']],
            ['color', ['color']],
            ['para', ['paragraph']],
            ['height', ['height']],
            ['Misc', ['fullscreen']]
         ]
        });
    });
  </script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	
	<main class="container">
		<h1>UPDATE</h1>
		
		<form action="board_updateRes.do" method="post">
			<input type="hidden" name="board_no" value="${dto.board_no }" />
			<table border="1">
				<tr>
					<th>작성자</th>
					<td><input type="text" name="member_id" value="${dto.member_id }"
						readonly="readonly" /></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="board_title" value="${dto.board_title }"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea id="summernote" name="board_content">${dto.board_content }</textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="수정" />
						<input type="button" value="취소" onclick="location.href='board_detail.do?board_no=${dto.board_no}'" />
					</td>
				</tr>
			</table>
		</form>
	</main>
	
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>