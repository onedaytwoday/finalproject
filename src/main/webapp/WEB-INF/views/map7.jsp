<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>지도 이동시키기</title>
    
</head>
<body>
<%-- 
	<c:forEach items="${list }" var="dto">
		<div>${dto.class_title }</div>
		<a href="#">${dto.class_loc } </a>
	</c:forEach>
--%>
<div id="map" style="width:100%;height:350px;"></div>
<p>
    <button onclick="setCenter()">지도 중심좌표 이동시키기</button> 
    <button onclick="panTo()">지도 중심좌표 부드럽게 이동시키기</button> 
</p>
<%--- --%>

<div>
	<select id="selected" name="where" onclick="selected()">
		<option value="1111" label="장소1"></option>
		<option value="2222" label="장소2"></option>
		<option value="3333" label="장소3"></option>
		<option value="4444" label="장소4"></option>
		<option value="5555" label="장소5"></option>
	</select>	
	<div><input id="select_button" type="submit" value="장소 선택" ></div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b09278ee8c0d306e4d38397589fed58d"></script>
<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
function setCenter() {
	
	var latitude = '33.452613';
	var longitude = '126.570888';
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new kakao.maps.LatLng(latitude, longitude);
    
    // 지도 중심을 이동 시킵니다
    map.setCenter(moveLatLon);
}

function panTo() {
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new kakao.maps.LatLng(33.450580, 126.574942);
    
    // 지도 중심을 부드럽게 이동시킵니다
    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
    map.panTo(moveLatLon);            
}        
</script>
</body>
</html>