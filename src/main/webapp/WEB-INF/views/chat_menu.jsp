<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
ul {
	list-style-type: none;
}

li {
	display: inline;
	margin: 10px 30px 10px 30px;
	font-size: 12pt;
}

ul li:hover {
	background-color: olive;
	cursor: pointer;
}
</style>
</head>
<body>
	<div>
		<ul style="list-style-type: none">
			<li onclick="location.href='chat_main.do?member_id=${mDto.member_id }'">기존 채팅</li>
			<li onclick="location.href='chat_newlist.do'">새 채팅</li>
		</ul>
	</div>
</body>
</html>