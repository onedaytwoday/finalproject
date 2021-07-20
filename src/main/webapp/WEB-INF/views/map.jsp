<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>주소로 장소 표시하기</title>
    
</head>
<body>

<div id="staticMap" style="width:600px;height:350px;"></div> 
<%--아래 api코드 두개쓴것 둘중하나라도 지우면 안됨(지도api두가지를 합친것!) --%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b09278ee8c0d306e4d38397589fed58d&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b09278ee8c0d306e4d38397589fed58d"></script>
<script>

//클래스 주소
var classadd = '경기도 화성시 남양읍 시청로202번길 74-27';//나중에 클래스에서 주소값을 받기로 한다.

//클래스명
var classname= '클래스의 이름입니다.';//나중에 클래스에서 클래스명을 받기로 한다...

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
//주소로 좌표를 검색합니다
geocoder.addressSearch(classadd, function(result, status) {

// 이미지 지도에 표시할 마커입니다
// 이미지 지도에 표시할 마커를 아래와 같이 배열로 넣어주면 여러개의 마커를 표시할 수 있습니다 
var markers = [
    {
        position: new kakao.maps.LatLng(result[0].y, result[0].x)
    },
    {
        position: new kakao.maps.LatLng(result[0].y, result[0].x), 
        text: classname // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다     
    }
];

var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
    staticMapOption = { 
        center: new kakao.maps.LatLng(result[0].y, result[0].x), // 이미지 지도의 중심좌표
        level: 3, // 이미지 지도의 확대 레벨
        marker: markers // 이미지 지도에 표시할 마커 
    };    

// 이미지 지도를 생성합니다
var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
}); 



</script>
</body>
</html>