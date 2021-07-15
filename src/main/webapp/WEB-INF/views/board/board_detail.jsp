<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        $('#summernote').summernote("disable");
    });
  </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<h1>Detail</h1>
	
	<table border="1">
		<tr>
			<th>작성자</th>
			<td>${dto.member_id }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${dto.board_title }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea id="summernote" name="board_content" >${dto.board_content }</textarea></td>
		</tr>
		<tr>
			<td colspan="3" align="right">
				<input type="button" value="수정" onclick="location.href='board_updateform.do?board_no=${dto.board_no}'" />
				<input type="button" value="삭제" onclick="location.href='board_delete.do?board_no=${dto.board_no}&board_category=${board_category}'" />
				<c:choose>
				<c:when test="${dto.board_category eq 'N' }">
				<input type="button" value="목록" onclick="location.href='board_notice_list.do?nowPage=1'" />
				</c:when>
				<c:when test="${dto.board_category eq 'Q' }">
				<input type="button" value="목록" onclick="location.href='board_qna_list.do?nowPage=1'" />
				</c:when>
				</c:choose>
			</td>
		</tr>
	</table>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>