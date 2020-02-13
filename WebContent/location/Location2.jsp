<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내주변</title>
<link rel="icon" href="../img/favicon.png">
<!-- css파일 link -->
<link href="../css/menu.css" rel="stylesheet" type="text/css">
<!-- 지도 스타일 지정 -->
<link href="../css/location.css" rel="stylesheet" type="text/css">

<style>
#map {
   height: 400px;
   width: 100%;
   background-color: grey;
}
table,th,td {
   width: 800px;
   border : 1px solid black;
   border-collapse: collapse;
}
th,td {
   padding: 15px;
}
</style>
</head>

<body>
   <header>
      <ul id="top_menu">
         <li class="logo"><a href="../index.bbq">Booking<span>HairShop</span></a></li>
         <ul id="menu_list">
            <li><a>내주변</a></li>
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
         <li><a>내주변</a></li>
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
      <div class="content">
         <!-- 상세페이지 제목 -->
         <h2 id="content_title">내주변</h2>
         <div class="inner">
            <div id="map"></div>
            <script>
               var map;
               var labels = new Array();
               var locations = new Array();
               var pos;
               function initMap() {
                  map = new google.maps.Map(document.getElementById('map'), {
                     center : pos,
                     zoom : 13
                  });
                              
               var markers = locations.map(function(location, i) {
                  console.log(location);
                  return new google.maps.Marker({
                     position: location,
                     label: labels[i % labels.length]
                  });
               });
         
               var markerCluster = new MarkerClusterer(map, markers,
                           {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'}
                   );
                   
               } // end initMap()
            
         
            
            
            ///////////////////위는 지도관련(마커포함)/////////////아래는 사용자 위치 및 주변매장 불러오기////////////////////////////////////////
            

            // 사용자의 위치 받아오기 + JSON 
         navigator.geolocation.getCurrentPosition(function(position) {
               
            pos = {
               lat : position.coords.latitude,
               lng : position.coords.longitude
               };
            var userlat = pos.lat;
            var userlng = pos.lng;
            
            var url = "http://localhost:8090/portfolio/shop.bbq?lat="
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
               var arrLat = new Array();
               var arrLng = new Array();
               var ul = "";
               for (i = 0; i < row.length; i++) {
                  ul += "<div class='sh_list' OnClick = location.href='../info/storeInfo.bbq?sh_uid="+ row[i].sh_uid+"'>";
                  ul += "<a id='list_pic'><img src='" + row[i].picture1 + "'></a>";
                  ul += "<ul id='list_info'><li><a href='../info/storeInfo.bbq?sh_uid="+ row[i].sh_uid+"'>"+ row[i].name + "</a></li>";
                  ul += "<li><span>★</span>" + row[i].star + "</li>";
                  ul += "<li>" + row[i].location + "</li>";
                  ul += "<li>" + row[i].telephone + "</li>";
                  ul += "</ul></div>"
               }
               $("#shoplist").html(ul);
               // 여기안에는 데이터 값 남아있어 여기서 지지고 볶아야 할꺼같은데 !ㅏ!ㅜ!ㅟㅜㅏㅣㅁㄴ우리ㅏ
               
               for(i = 0; i < row.length; i++) {
                  
                  
                  locations.push(
                     {lat : parseFloat(row[i].locationLat), lng : parseFloat(row[i].locationLng)}
                  );
                  console.log(locations[i]);
                  
                  labels.push(
                        row[i].name
                  );
                  }
               
               //이형식으로는 마커가 되는데
               //locations = [
               //   {lat : 37.5434924,lng : 127.0733933}
               //];
                //출력해보면 obj,obj*/
               
            } //end parseJSON
               
            });// 위치 받아오기 종료?

</script>
         <br>
         <div id="shoplist">
         </div>
         <!-- 화살표버튼 -->
         <div id="go_top">
            <a><i class="fas fa-arrow-circle-up"></i></a>
         </div>
      </div>
   </div>
</section>


   <!-- javascript 링크 -->
   
      
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <script src="../js/public.js" type="text/javascript"></script>
   <script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
   <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCFDCbB-7P2BDLp9LuwLHHp7e-yHfrq438&callback=initMap"
      async defer></script>
   
</body>
</html>