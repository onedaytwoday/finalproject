<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="lang/summernote-ko-KR.js"></script>
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
<jsp:include page="header.jsp"></jsp:include>
	<h1>INSERT</h1>
	
	<form action="board_insertRes.do" method="post">
		카테고리 : <select name="board_category">
			<c:choose>
				<c:when test="${board_category eq 'N' }">
					<option  value="N" selected="selected">공지사항</option>
				</c:when>
				<c:when test="${board_category eq 'Q' }">
					<option value="Q" selected="selected">상품문의</option>
				</c:when>
			</c:choose>
		</select>
		<input type="hidden" name="member_id" value="${mDto.member_id }" />
		<table border="1">
			<tr>
				<th>제목</th>
				<td><input type="text" name="board_title" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea id="summernote" name="board_content"></textarea></td>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<td><input type="text" size="4" name="board_pw" /></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="글작성" />
					<input type="button" value="취소" onclick="">
				</td>
			</tr>
		</table>
	</form>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>