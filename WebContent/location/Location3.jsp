<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>지역별매장</title>
<link rel="icon" href="../img/favicon.png">
<!-- css파일 link -->
<link href="../css/menu.css" rel="stylesheet" type="text/css">
<!-- 지도 스타일 지정 -->

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
				<li><a href="../location/Location2.bbq">내주변</a></li>
				<li><a href="../location/Location3.bbq">지역별매장</a></li>
				<li><a href="../changeinfo/changeUserInfo.bbq">마이페이지</a></li>
			</ul>
			<c:if test="${sessionScope.user == null }">
			<li id="login" ><a href="../login/login_user.bbq">로그인</a></li>
			</c:if>
			<c:if test="${sessionScope.user != null }">
			<li id="login" ><a href="../logout/Userlogout.bbq">로그아웃</a></li>
			</c:if>
		</ul>
	</header>

	<section>
		<div class="content">
			<!-- 상세페이지 제목 -->
			<h2 id="content_title">내주변</h2>

			<div class="inner">

			<div id="map"></div>

			<script>
				var map;
				var locations;
				function initMap() {
					map = new google.maps.Map(document.getElementById('map'), {
						center : {lat : 37.490259,lng : 126.916320},
						zoom : 15
					});
					
				var labels = '123456789';
					
				var markers = locations.map(function(location, i) {
					return new google.maps.Marker({
						position: location,
						label: labels[i % labels.length]
					});
				});
					
					
				/*	var marker = new google.maps.Marker({
						  position: {
							lat : 37.490259,
							lng : 126.916320
							},
						  map: map
						});*/
				
				
				var markerCluster = new MarkerClusterer(map, markers,
				            {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'}
				 	);
				    
				} // end initMap()
				
				
				var locationssssssssssssss = [
					{lat : 37.490259,lng : 126.916320},
					{lat : 37.491253,lng : 126.936320}
				];
				
				
				///////////////////위는 지도관련(마커포함)/////////////아래는 사용자 위치 및 주변매장 불러오기////////////////////////////////////////
				

				// 사용자의 위치 받아오기 + JSON 
			navigator.geolocation.getCurrentPosition(function(position) {
					
				var pos = {
					lat : position.coords.latitude,
					lng : position.coords.longitude
					};
				var userlat = pos.lat;
				var userlng = pos.lng;
				
				var url = "http://localhost:8082/hairshop/shop.loc?lat="
						+ userlat + "&lng=" + userlng;

				$.ajax({
					url : url,
					type : "GET",
					cache : false,
					success : function(data, status) {
						if (status == "success") {
						parseJSON(data);
						};
					}
				});//end ajax

				function parseJSON(jsonObj) {
					var row = jsonObj.datalist;
					var i;
					var arr = new Array();
					var table = "<tr><th>매장명</th><th>매장위치</th><th>매장Lat</th><th>매장Lng</th></tr>";
					for (i = 0; i < row.length; i++) {
						table += "<tr>";
						table += "<td>" + row[i].name + "</td>";
						table += "<td>" + row[i].location + "</td>";
						table += "<td>" + row[i].locationLat;
						+"</td>";
						table += "<td>" + row[i].locationLng;
						+"</td>";
						table += "</tr>";
						arr[i] = row[i].name;
					}
					$("#shoplist").html(table);
					// 여기안에는 데이터 값 남아있어 여기서 지지고 볶아야 할꺼같은데 !ㅏ!ㅜ!ㅟㅜㅏㅣㅁㄴ우리ㅏ
					alert(arr[0]);
					alert(arr[1]);
					alert(arr[2]);
					alert(arr[3]);
				
					locations = [
						{lat : 37.490259,lng : 126.916320},
						{lat : 37.491253,lng : 126.936320}
					];
					
					initMap();
				} //end parseJSON
					
				});// 위치 받아오기 종료?

		
				
			
		
				
			</script>

			<!-- 화살표버튼 -->
			<div id="go_top">
				<a><i class="fas fa-arrow-circle-up"></i></a>
			</div>
		</div>
		</div>
	</section>


	<!-- javascript 링크 -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="../js/public.js" type="text/javascript"></script>
	<script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCFDCbB-7P2BDLp9LuwLHHp7e-yHfrq438&callback=initMap"
		async defer></script>
	
</body>
</html>