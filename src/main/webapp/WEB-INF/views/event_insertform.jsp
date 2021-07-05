<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('input[name="event"]').change(function() {
			var id = $('input[name="event"]:checked').attr('id');
			if(id == 'sale') {
				$("#sale_rate").css("display", "inline");
			} else {
				$("#sale_rate").css("display", "none");
			}
		});
		
		$('input[name="category"]').change(function() {
			var id = $('input[name="category"]:checked').attr('id');
			if(id == 'class') {
				$("#class_sel").css("display", "inline");
				$("#product_sel").css("display", "none");
				$("#product_no").attr("name", "");
				
			} else {
				$("#class_sel").css("display", "none");
				$("#product_sel").css("display", "inline");
				$("#class_no").attr("name", "");
			}
		});
	})
</script>
</head>
<body>
	<form action="eventInsertRes.do" method="post">
		<input type="hidden" name="member_id" value="${mDto.member_id }" />
		
		<table border="1">
			<tr>
				<th>이벤트 제목</th>
				<td><input type="text" name="event_title" required /></td>
			</tr>
			
			<tr>
				<th>이벤트 내용</th>
				<td><textarea rows="10" cols="60" name="event_desc" required></textarea></td>
			</tr>
			
			<tr>
				<th>시작 날짜</th>
				<td><input type="date" name="start" required /></td>
			</tr>
			
			<tr>
				<th>종료 날짜</th>
				<td><input type="date" name="end" required /></td>
			</tr>

			<tr>
				<th>이벤트 카테고리</th>
				<td>
					<input type="radio" id="sale" name="event" value="할인" />
					<label for="sale">할인</label>
					
					
					<select style="display:none;" name="sale_rate" id="sale_rate">
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
		             
		             <input type="radio" id="new" name="event" value="NEW" />
					<label for="new">NEW</label>
				</td>
			</tr>
			
			<tr>
				<th>이벤트</th>
				<td>
					<input type="radio" id="class" name="category" value="클래스" />
					<label for="class">클래스</label>
					
					<input type="radio" id="product" name="category" value="상품" />
					<label for="product">상품</label>
				
				
					<div id="class_sel" style="display:none;">
						<select name="class_no" id="class_no">
		                  <c:forEach items="${cList }" var="cDto">
		                    <option value="${cDto.class_no }">
		                      ${cDto.class_title }
		                    </option>
		                  </c:forEach>
		                </select>
					</div>
					
					<div id="product_sel" style="display:none;">
						<select name="product_no" id="product_no">
		                  <c:forEach items="${pList }" var="pDto">
		                    <option value="${pDto.product_no }">
		                      ${pDto.product_name }
		                    </option>
		                  </c:forEach>
		                </select>
					</div>
				
				</td>
			</tr>

			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="등록하기" />
					<input type="button" value="취소" onclick="location.href='main.do'" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>