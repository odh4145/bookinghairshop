<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.location.beans.*"%>




<!-- 자기위치를 로드하는 지도 생성 -->
<script>
	var arr = [];
	var locLat = [];
	var locLng = [];
	var map;
	var infoWindow;

	function initMap() {
		// 지도 초기화 생성  <기초 좌표값 서울시청> <zoom값 13>
		map = new google.maps.Map(document.getElementById('map'), {
			center : {
				lat : 37.566287,
				lng : 126.978094
			},
			zoom : 13
		});

		// 사용자 위치 받아오는 지오코드 .
		if (navigator.geolocation) {
			navigator.geolocation
					.getCurrentPosition(
							function(position) {
								// 사용자 위치 좌표 저장하는 변수
								var pos = {
									lat : position.coords.latitude,
									lng : position.coords.longitude
								};
								var userlat = pos.lat;
								var userlng = pos.lng;

								infoWindow.open(map);
								map.setCenter(pos);

								var url = "${pageContext.request.contextPath}/shop.loc?lat="
										+ userlat + "&lng=" + userlng;

								$.ajax({
									url : url,
									type : "GET",
									cache : false,
									success : function(data, status) {
										if (status == "success") {
											parseJSON(data);
											plz(data);
										}
										;
									}
								});

								function parseJSON(jsonObj) {
									var row = jsonObj.datalist;
									var i;
									var table = "<tr><th>매장명</th><th>매장위치</th><th>매장Lat</th><th>매장Lng</th></tr>";
									for (i = 0; i < row.length; i++) { // 매장 리스트 나열용 for문
										table += "<tr>";
										table += "<td>" + row[i].name + "</td>";
										table += "<td>" + row[i].location
												+ "</td>";
										table += "<td>" + row[i].locationLat;
										+"</td>";
										table += "<td>" + row[i].locationLng;
										+"</td>";
										table += "</tr>";

									}
									$("#shoplist").html(table);

								} //end parseJSON

								function plz(jsonObj) {
									var row = jsonObj.datalist;
									var i;

									for (i = 0; i < row.length; i++) {
										locLat[i] = row[i].locationLat;
										locLng[i] = row[i].locationLng;
										//var Loc = {lat:locLat[i] ,lng:locLng[i]}; 
										//var marker = Loc.map(function(location,i) {
										//return new google.maps.Marker({
										//position:Loc
										//map:map
										//});
										//});
									}

									var Loc = {
										lat : locLat[0],
										lng : locLng[0]
									};

									var marker = new google.maps.Marker({
										position : Loc,
										map : map
									});
									//marker.addListener('click', function() {
									//infowindow.open(map, marker);
									// });

									//var Loc1= {lat:111.11111,lng:37.111111};	 

									//var marker1 =  new google.maps.Marker({position:Loc1,map:map});

								}//end plz

								//var Loc2 = {lat:37.5434924,lng:127.0733933};
								//var marker = new google.maps.Marker({position:Loc2,map:map});
								//var marker2 = new google.maps.Marker({position:Loc2,map:map});

								var Mname = "품격미용실 2호점"
								var Star = "5.0"
								var contentString = '<div id="content">'
										+ '<div id="siteNotice">'
										+ '</div>'
										+ '<h1 id="firstHeading" class="firstHeading">품격미용실</h1>'
										+ '<div id="bodyContent">'
										+ '<p>별점은 5.0</p>'
										+ '<p>휴일: 금요일, <a href="https://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194">'
										+ '상세보기 페이지로 이동</a> ' + '</p>'
										+ '</div>' + '</div>';
								// 상세정보창으로 사용자의 추정위치를 센터로 잡아줌

								infowindow = new google.maps.InfoWindow({
									content : contentString
								});
								//  marker.addListener('click', function() {
								//	    infowindow.open(map, marker);
								//  });

							}, // 사용자 위치받아오는 함수 끝

							// 사용자의 정보를 못불러올 경우 
							function() {
								handleLocationError(true, infoWindow, map
										.getCenter());
							});
		} else {
			// 브라우저가 지오코드를 지원 못하는경우 
			handleLocationError(false, infoWindow, map.getCenter());
			alert("죄송합니다. 내 위치 서비스를 지원하지 않는 브라우저입니다.");
		}

	} // end initmap

	function handleLocationError(browserHasGeolocation, infoWindow, pos) {
		infoWindow.setPosition(pos);
		infoWindow
				.setContent(browserHasGeolocation ? 'Error: The Geolocation service failed.'
						: 'Error: Your browser doesn\'t support geolocation.');
		infoWindow.open(map);
	}
</script>








<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내 주변 매장찾기</title>
<link rel="icon" href="img/favicon.png">

<!-- css파일 link -->
<link href="../css/menu.css" rel="stylesheet" type="text/css">
<!-- 마이페이지 아닌분들은 sub.css 지우세요 -->
<link href="../css/sub.css" rel="stylesheet" type="text/css">
<style>
#map {
	height: 400px;
	width: 100%;
	background-color: grey;
}
</style>
</head>

<body>
	<header>
		<ul id="top_menu">
			<li id="logo"><a href="index.jsp">Booking<span>HairShop</span></a></li>
			<ul id="menu_list">
				<li><a href="#">내주변</a></li>
				<li><a href="#">지역별매장</a></li>
				<li><a href="#">마이페이지</a></li>
			</ul>
			<li id="login"><a href="#">로그아웃</a></li>
		</ul>
	</header>

	<section>
		<div class="content">
			<!-- 상세페이지 제목 -->
			<h2 id="content_title">내 주변 매장찾기</h2>
			<h5>웹 기반 위치서비스는 부정확 할 수 있습니다.</h5>
			<div id="map"></div>

			<div>
				<table id="shoplist"></table>
			</div>

			<!-- 화살표버튼 -->
			<div id="go_top">
				<a><i class="fas fa-arrow-circle-up"></i></a>
			</div>
		</div>
	</section>





	<!-- javascript 링크 -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="../js/public.js" type="text/javascript"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCFDCbB-7P2BDLp9LuwLHHp7e-yHfrq438&callback=initMap"
		async defer></script>
</body>
</html>