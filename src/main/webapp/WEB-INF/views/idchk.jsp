<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
		onload = function() {
			var memberid = opener.document.getElementsByName("member_id")[0].value;
			document.getElementsByName("member_id")[0].value = memberid;
		}
		
		function confirmId(bool) {
			if(bool == "true") {
				opener.document.getElementsByName("member_id")[0].title = "y";
				opener.document.getElementsByName("member_pw")[0].focus();
			
			} else {
				opener.document.getElementsByName("member_id")[0].focus();	
			}
			
			self.close();
		}
	</script>
	
</head>
<body>
	<table border="1">
		<tr>
			<td><input type="text" name="member_id" /></td>
		</tr>
		<tr>
			<td>${idnotused ? "아이디 생성 가능" : "중복된 아이디 존재"  }</td>
		</tr>
		<tr>
			<td>
				<input type="button" value="확인" onclick="confirmId('${idnotused}')">
			</td>		
		</tr>
	</table>
</body>
</html>