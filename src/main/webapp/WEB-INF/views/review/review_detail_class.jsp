<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>	
	
	<main class="container">
		<h1>Review Detail</h1>
	
			<table border="1">
			<tr>
				<th>작성자</th>
				<td>${dto.member_id }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${dto.review_title }</td>
			</tr>
			<tr>
				<th>평점</th>
				<td>${dto.review_rate }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="60" readonly="readonly">${dto.review_content }</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="button" value="수정" onclick="location.href=''"/>
					<input type="button" value="삭제" onclick="location.href=''"/>
					<input type="button" value="목록" onclick="location.href=''"/>
				</td>
			</tr>
		</table>
	</main>
	
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>