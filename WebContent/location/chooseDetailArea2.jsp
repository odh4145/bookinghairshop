<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>지역별 매장</title>
<link rel="icon" href="../img/favicon.png">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="../css/menu.css" rel="stylesheet" type="text/css">
<link href="../css/location.css" rel="stylesheet" type="text/css">
<link href="../css/chooseDetailArea.css" rel="stylesheet" type="text/css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="../js/public.js" type="text/javascript"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<style>
#map {
   height: 400px;
   width: 100%;
   background-color: grey;
}

table, th, td {
   width: 800px;
   border: 1px solid black;
   border-collapse: collapse;
}

th, td {
   padding: 15px;
}
</style>

</head>


<body onload="initialize()">
   <header>
      <ul id="top_menu">
         <li class="logo"><a href="../index.bbq">Booking<span>HairShop</span></a></li>
         <ul id="menu_list">
            <li><a href="../location/Location2.bbq">내주변</a></li>
            <li><a href="../location/chooseArea.bbq">지역별매장</a></li>
            <c:choose>
               <c:when test="${sessionScope.user != null }">
                  <li><a href="../book/user.bbq?use_uid=${sessionScope.user }">마이페이지</a></li>
               </c:when>
               <c:when test="${sessionScope.user == null }">
                  <li><a href="../book/user.bbq?use_uid=0">마이페이지</a></li>
               </c:when>            
            </c:choose>            
         </ul>
         <c:if test="${sessionScope.user == null }">
            <li id="login"><a href="../login/login_user.bbq">로그인</a></li>
         </c:if>
         <c:if test="${sessionScope.user != null }">
            <li id="login"><a href="../logout/Userlogout.bbq">로그아웃</a></li>
         </c:if>
         <li><a id="btn_menu"><i class="fas fa-ellipsis-h"></i></a></li>
      </ul>
         <ul id="mo_menu">
            <li><a href="../location/Location2.bbq">내주변</a></li>
            <li><a href="../location/chooseArea.bbq">지역별매장</a></li>
            <li><a id="mypage">마이페이지</a></li>
            <ul id="mo_sub">
               <c:if test="${sessionScope.user != null }">
                  <li><a href="../book/user.bbq?use_uid=${sessionScope.user }">예약내역</a></li>
               </c:if>            
               <c:if test="${sessionScope.user == null }">
                  <li><a href="../book/user.bbq?use_uid=0">예약내역</a></li>
               </c:if>            
               <c:if test="${sessionScope.user != null }">
                  <li><a href="../jm/uselist.bbq?use_uid=${sessionScope.user }">내가 쓴 글</a></li>
               </c:if>            
               <c:if test="${sessionScope.user == null }">
                  <li><a href="../jm/uselist.bbq?use_uid=0">내가 쓴 글</a></li>
               </c:if>            
               <c:if test="${sessionScope.user != null }">
                  <li><a href="../changeinfo/changeUserInfo.bbq">개인정보수정</a></li>
               </c:if>            
               <c:if test="${sessionScope.user == null }">
                  <li><a href="../changeinfo/changeUserInfo.bbq">개인정보수정</a></li>
               </c:if>            
            </ul>
         <c:if test="${sessionScope.user == null }">
            <li><a href="../login/login_user.bbq">로그인</a></li>
         </c:if>
         <c:if test="${sessionScope.user != null }">
            <li><a href="../logout/Userlogout.bbq">로그아웃</a></li>
         </c:if>         
         </ul>
   </header>   

   <section>
      <div class="content pb">
         <!-- 상세페이지 제목 -->
         <h2 id="content_title">지역별매장 - 서울</h2>

         <!---------------------- content ---------------------->
         <div class="inner">
               <form action="#">
                  <fieldset>
                     <div class="sel_menu">
                        <label for="speed">지역</label> <select name="speed" id="speed" onchange=codeAddress(this.value)>
                           <option selected="selected">서울특별시</option>
                           <option>광주광역시</option>
                           <option>대구광역시</option>
                           <option>대전광역시</option>
                           <option>부산광역시</option>
                           <option>울산광역시</option>
                           <option>인천광역시</option>
                           <option>강원도</option>
                           <option>경기도</option>
                           <option>경상남도</option>
                           <option>경상북도</option>
                           <option>전라남도</option>
                           <option>전라북도</option>
                           <option>충청남도</option>
                           <option>충청북도</option>
                        </select>
                     </div>
                     <div class="sel_menu m2">
                        <label for="files">상세 지역</label> <select name="files" id="files"
                           onchange=codeAddress(this.value)>
                           <option disabled selected>상세지역</option>
                           <optgroup label="ㄱ">
                              <option id="address">강북구</option>
                              <option id="address">관악구</option>
                              <option id="address">강남구</option>
                              <option id="address">강동구</option>
                              <option id="address">광진구</option>
                              <option id="address">강서구</option>
                              <option id="address">구로구</option>
                              <option id="address">금천구</option>
                           </optgroup>
                           <optgroup label="ㄴ">
                              <option id="address">노원구</option>
                           </optgroup>
                           <optgroup label="ㄷ">
                              <option id="address">동작구</option>
                              <option id="address">동대문구</option>
                           </optgroup>
                           <optgroup label="ㅁ">
                              <option id="address">마포구</option>
                           </optgroup>
                           <optgroup label="ㅅ">
                              <option id="address">송파구</option>
                              <option id="address">성동구</option>
                              <option id="address">서초구</option>
                              <option id="address">성북구</option>
                              <option id="address">서대문구</option>
                           </optgroup>
                           <optgroup label="ㅇ">
                              <option id="address">용산구</option>
                              <option id="address">은평구</option>
                              <option id="address">양천구</option>
                              <option id="address">영등포구</option>
                           </optgroup>
                           <optgroup label="ㅈ">
                              <option id="address">종로구</option>
                              <option id="address">중구</option>
                              <option id="address">중랑구</option>
                           </optgroup>
                        </select>
                     </div>
                  </fieldset>
               </form>
            </div>

            <div id="map"></div>
            
<!---------------------- script----------------------->
<script>
var geocoder;
var map;
var labels = new Array();
var locations = new Array();
var pos;
var url

function initialize() {
	geocoder = new google.maps.Geocoder();
	var latlng = new google.maps.LatLng(37.5325896, 126.9900429);
   
	// 초기 지도값은 서울이 한눈에 보이는 그정도 ? 
   	var mapOptions = {
		zoom: 11,
		center: latlng
	}
  	map = new google.maps.Map(document.getElementById('map'), mapOptions);
	
	var markers = locations.map(function(location, i) {
		console.log(location);		
		return new google.maps.Marker({
			position : location,
			label : labels[i % labels.length]
		});
	});

    var markerCluster = new MarkerClusterer(
    	map,
        markers,
        {
    		imagePath : 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'
        }
    );             
} // 맵 리로딩 하는 펑션 end initialize
             
///////////////////위는 지도관련(마커포함)/////////////아래는 사용자 위치 및 주변매장 불러오기////////////////////////////////////////
// 사용자의 위치 받아오기 + JSON 
navigator.geolocation.getCurrentPosition(function(position) {
	pos = {
	   lat : position.coords.latitude,
	   lng : position.coords.longitude
	};
	var userlat = pos.lat;
	var userlng = pos.lng;
	var url = "${pageContext.request.contextPath}/shopSelect.bbq?lat=" + userlat + "&lng=" + userlng;

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
        var arrLat = new Array();
        var arrLng = new Array();
        var ul = "";
        for (i = 0; i < row.length; i++) {
           ul += "<div class='sh_list' OnClick = location.href='../info/storeInfo.bbq?sh_uid="+ row[i].sh_uid+"'>";
           if(row[i].pickture1 == "0"){
        	   ul += "<a id='list_pic'><img src='http://placehold.it/150x150'></a>";
           }else{
        	   ul += "<a id='list_pic'><img src='${pageContext.request.contextPath}/img/" + row[i].pickture1 + "'></a>";
           }
          
           ul += "<ul id='list_info'><li><a href='../info/storeInfo.bbq?sh_uid="+ row[i].sh_uid+"'>"+ row[i].name + "</a></li>";
           ul += "<li><span>★ </span>" + row[i].star + "</li>";
           ul += "<li>" + row[i].location + "</li>";
           ul += "<li>" + row[i].telephone + "</li>";
           ul += "</ul></div>"
        }
        $("#shoplist").html(ul);
        
        for (i = 0; i < row.length; i++) {
        	locations.push({
        		lat : parseFloat(row[i].locationLat),
                lng : parseFloat(row[i].locationLng)
            });
        	console.log(locations[i]);
        	labels.push(row[i].name);
        }
    } //end parseJSON
});// 위치 받아오기 종료 end navigator
                                                      
                           
function codeAddress(a) {
	var address = a;
    var userlat;
    var userlng;
  
    var url = "https://maps.googleapis.com/maps/api/geocode/json?address="+ address +"&key=AIzaSyCFDCbB-7P2BDLp9LuwLHHp7e-yHfrq438";
    //alert(url);
    
    $.ajax({
       url : url,
       type : "GET",
       cache : false,
       success : function(data, status){
          if(status == "success"){ parseJSO(data);}
       }
    });
    
    function parseJSO(jsonObj){
        userlat = jsonObj.results[0].geometry.location.lat;
        userlng = jsonObj.results[0].geometry.location.lng;
     
        var url = "${pageContext.request.contextPath}/shop.bbq?lat="
          + userlat + "&lng=" + userlng;
       //alert(url);
       
       $.ajax({
          url : url,
          type : "GET",
          cache : false,
          success : function(data, status){
             if(status == "success")parseJSON(data);
          }
       });
       
       function parseJSON(jsonObj) {
           var row = jsonObj.datalist;
           var i;
           var arrLat = new Array();
           var arrLng = new Array();
           var ul = "";
           for (i = 0; i < row.length; i++) {
              ul += "<div class='sh_list' OnClick = location.href='../info/storeInfo.bbq?sh_uid="+ row[i].sh_uid+"'>";
              if(row[i].pickture1 == "0"){
           	   ul += "<a id='list_pic'><img src='http://placehold.it/150x150'></a>";
              }else{
           	   ul += "<a id='list_pic'><img src='${pageContext.request.contextPath}/img/" + row[i].pickture1 + "'></a>";
              }
              ul += "<ul id='list_info'><li><a href='../info/storeInfo.bbq?sh_uid="+ row[i].sh_uid+"'>"+ row[i].name + "</a></li>";
              ul += "<li><span>★ </span>" + row[i].star + "</li>";
              ul += "<li>" + row[i].location + "</li>";
              ul += "<li>" + row[i].telephone + "</li>";
              ul += "</ul></div>"
           }
           $("#shoplist").html(ul);
       } //end parseJSON    
    }
 
    geocoder.geocode( { 'address': address}, function(results, status) {
      if (status == 'OK') {
        map.setCenter(results[0].geometry.location);
        map.setZoom(13);           
      } else {
        alert('Geocode was not successful for the following reason: ' + status);
      }
    });
};
</script>

         <div id="shoplist">
         </div>
         
         <!-- 화살표버튼 -->
         <div id="go_top">
            <a><i class="fas fa-arrow-circle-up"></i></a>
         </div>       
      </div>      
   </section>


   <%--
   <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   <script src="../js/public.js" type="text/javascript"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   <script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
   <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCFDCbB-7P2BDLp9LuwLHHp7e-yHfrq438&callback=initMap"
      async defer></script>
       --%>


   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <script src="../js/public.js" type="text/javascript"></script>
   <script
      src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
   <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCFDCbB-7P2BDLp9LuwLHHp7e-yHfrq438"
      async defer></script>
</body>
</html>