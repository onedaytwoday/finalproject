<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
	pageEncoding="UTF-8"%>
<%--아래 확인용 코드 --%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>주소로 장소 표시하기</title>
    
</head>
<body>
	<input type="hidden" value="">
	<c:forEach items="${list }" var="dto">
		<div>${dto.class_title }>	
		<a href="#">${dto.class_loc } </a>
	</c:forEach>
<%-----------위 바디태그 전까지 확인용 코드----------- --%>
<p style="margin-top:-12px">

</p>
<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b09278ee8c0d306e4d38397589fed58d&libraries=services"></script>
<script>

var data = '${list }';
var class_title = '${dto.class_title }'//이건 왜 값이 안뜰까?
var list = new Array(data);
alert(data);
//alert('${dto.class_title }');
//alert('${list }');
//alert("["+data+"]");

//alert(list);//값없음

for(var i = 0; i<data.length;i++){//리스트가 뭔지 정의되어있지 않다?무슨에러지...
		list[i] = new Array();
		list[i][0] = data[i].class_loc;
		list[i][1] = data[i].class_title;
}
var listData = "["+list+"]";
//alert(listData);
var name = '어딘가'
var addr = '서울 강남구 삼성동 112-1'


var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
=======
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:400px;margin:10px 0 30px 10px;padding:5px;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
.minus:hover{
	cursor: pointer
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b09278ee8c0d306e4d38397589fed58d&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b09278ee8c0d306e4d38397589fed58d"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="slider-area" style="margin-bottom: 100px">
        <div class="single-slider slider-height2 d-flex align-items-center">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center">
                            <h2>Map</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white" style="height:350px;">
    <div style="height: 50px"><img class="minus" src="resources/images/minus.png" width="20px" height="20px" style="float:right"></div>    
        <ul id="placesList">
        <c:set value="1" var="tmp" />
        <c:forEach items="${list }" var="dto">
        <li class="item">
	        <span class="markerbg marker_${tmp }"></span>
	        <div class="info">   
		        <h5>${dto.class_title }</h5>    
		        <span >${dto.class_loc }</span>   
		        <input type="hidden" class="title${tmp }" value="${dto.class_title }">
		        <input type="hidden" class="lat${tmp }" value="${dto.class_lat }">
		        <input type="hidden" class="lng${tmp }" value="${dto.class_lng }">
	        </div>
        </li>
        <c:set value="${tmp+1}" var="tmp" />
        </c:forEach>
        </ul>
       			 <div style="width: 100%; text-align: center;">
					<jsp:include page="/WEB-INF/views/paging.jsp">
						<jsp:param value="M" name="map_category" />
						<jsp:param value="${pDto.nowBlock}" name="nowBlock" />
						<jsp:param value="${pDto.blockBegin }" name="blockBegin" />
						<jsp:param value="${pDto.blockEnd }" name="blockEnd" />
						<jsp:param value="${pDto.nowPage}" name="nowPage" />
						<jsp:param value="${pDto.blockBegin}" name="blockBegin" />
						<jsp:param value="${pDto.blockEnd}" name="blockEnd" />
						<jsp:param value="${pDto.totalBlock}" name="totalBlock" />
					</jsp:include>
					</div>
    </div>
</div>

<script>
// 마커를 담을 배열입니다
$('.info').click(function(){
	var i = $(this).children(":eq(3)").val();
	var j = $(this).children(":eq(4)").val();
	var moveLatLon = new kakao.maps.LatLng(i,j);
	    
	    // 지도 중심을 부드럽게 이동시킵니다
	    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
	map.panTo(moveLatLon);  
})
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 1 // 지도의 확대 레벨
>>>>>>> 8aed2efd405f2a335ea2287fa6c5081c61e8a5a9
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

<<<<<<< HEAD
// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch(addr, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+name+'</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
=======
// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  
var positions = [
    {
        content: '<div>' + $('.title1').val() + '</div>', 
        latlng: new kakao.maps.LatLng($('.lat1').val(), $('.lng1').val())
    },
    {
        content: '<div>' + $('.title2').val() + '</div>', 
        latlng: new kakao.maps.LatLng($('.lat2').val(), $('.lng2').val())
    },
    {
        content: '<div>' + $('.title3').val() + '</div>', 
        latlng: new kakao.maps.LatLng($('.lat3').val(), $('.lng3').val())
    },
];

for (var i = 0; i < positions.length; i ++) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng // 마커의 위치
    });

    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new kakao.maps.InfoWindow({
        content: positions[i].content // 인포윈도우에 표시할 내용
    });

    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
}

// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}
	
	$('.minus').click(function(){
		$("#menu_wrap").css('display','none');
	});
</script>
<jsp:include page="footer.jsp"></jsp:include>
>>>>>>> 8aed2efd405f2a335ea2287fa6c5081c61e8a5a9
</body>
</html>