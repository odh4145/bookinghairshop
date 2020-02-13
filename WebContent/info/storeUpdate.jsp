<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:choose>
	<c:when test="${empty info || fn:length(info) == 0 }">
		<script>
			alert("매장의 정보가 없습니다.");
			history.back();
		</script>
	</c:when>
	<c:when test="${sessionScope.shop != null }">
<!------ html 시작 ------>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>지역별매장</title>
<link rel="icon" href="../img/favicon.png">

<!-- css파일 link -->
<link href="../css/menu.css" rel="stylesheet" type="text/css">
<link href="../css/storeupdate.css" rel="stylesheet" type="text/css">
</head>

<script>
function infoSubmit(frm) {
	var sh_telephone = frm.sh_telephone.value.trim();
	var sh_location = frm.sh_location.value.trim();
	var sh_starttime = frm.sh_starttime.value.trim();
	var sh_endtime = frm.sh_endtime.value.trim();

	if (sh_telephone == "" && sh_location == "" && sh_starttime == ""
			&& sh_endtime == "") {
		alert("빈 칸이 존재합니다.");
		return false;
	}
	return true;
}
</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sh_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                
                document.getElementById("sh_roadAddr").value = roadAddr;
                

            }
        }).open();
    }
</script>

<script>
$(document).ready(function(){
	
	$("#chklocation").click(function(){
		
		frm = document.forms['frm'];
		
		var sh_roadAddr = frm['sh_roadAddr'].value.trim();
		var sh_detailAddress = frm['sh_detailAddress'].value.trim();
		
		if(sh_roadAddr == ""){
			alert("도로명주소를 입력해주세요");
			frm["sh_roadAddr"].focus();
			return false;
		}
		
		if(sh_detailAddress == ""){
			alert("상세주소를 입력해주세요");
			frm["sh_detailAddress"].focus();
			return false;
		}
		
		var addr = frm['sh_roadAddr'].value.trim();
		
		//alert(addr);
		
		var url = "https://maps.googleapis.com/maps/api/geocode/json?address="+ addr +"&key=AIzaSyCFDCbB-7P2BDLp9LuwLHHp7e-yHfrq438";
		//alert(url);
		
		$.ajax({
			url : url,
			type : "GET",
			cache : false,
			success : function(data, status){
				if(status == "success") parseJSON(data);
			}
		});
		
	});
});

function parseJSON(jsonObj){
	var location_lat = jsonObj.results[0].geometry.location.lat;
	var location_lng = jsonObj.results[0].geometry.location.lng;
	
//	alert(location_lat)
//	alert(location_lng)
	
	document.getElementById('sh_location_lat').value = location_lat;
	document.getElementById('sh_location_lng').value = location_lng;
	
	frm = document.forms['frm'];
	
	var sh_roadAddr = frm['sh_roadAddr'].value.trim();
	var sh_detailAddress = frm['sh_detailAddress'].value.trim();
	
	document.getElementById("sh_location").value = sh_roadAddr + " " + sh_detailAddress;
}
</script>
<body>
	<header>
		<ul id="top_menu">
			<li id="logo"><a href="../index.jsp">Booking<span>HairShop</span></a></li>
			<ul id="menu_list">
				<c:choose>
					<c:when test="${sessionScope.shop != null }">
					<li><a href="../hj/shlist.bbq?sh_uid=${sessionScope.shop }">후기</a></li>
					</c:when>	
					<c:when test="${sessionScope.shop == null }">
					<li><a href="../hj/shlist.bbq?sh_uid=0">후기</a></li>
					</c:when>	
				</c:choose>
				<c:choose>
					<c:when test="${sessionScope.shop != null }">
					<li><a href="../book/shop.bbq?sh_uid=${sessionScope.shop }">예약내역</a></li>
					</c:when>	
					<c:when test="${sessionScope.shop == null }">
					<li><a href="../book/shop.bbq?sh_uid=0">예약내역</a></li>
					</c:when>	
				</c:choose>
				<c:choose>
					<c:when test="${sessionScope.shop != null }">
					<li><a>마이페이지</a></li>
					</c:when>
					<c:when test="${sessionScope.shop == null }">
					<li><a href="../info/storeUpdate.bbq?sh_uid=0">마이페이지</a></li>
					</c:when>
				</c:choose>
			</ul>
			<c:if test="${sessionScope.shop == null }">
				<li id="login"><a href="../login/login_shop.bbq">로그인</a></li>
			</c:if>
			<c:if test="${sessionScope.shop != null }">
				<li id="login"><a href="../logout/Shoplogout.bbq">로그아웃</a></li>
			</c:if>
			<li><a id="btn_menu"><i class="fas fa-ellipsis-h"></i></a></li>
		</ul>
			<ul id="mo_menu">
				<li><a href="../hj/shlist.bbq?sh_uid=${sessionScope.shop }">후기</a></li>
				<li><a href="../book/shop.bbq?sh_uid=${sessionScope.shop }">예약내역</a></li>
				<li><a id="mypage">마이페이지</a></li>
				<ul id="mo_sub">
					<c:if test="${sessionScope.shop != null }">
						<li><a>매장정보변경</a></li>
					</c:if>				
					<c:if test="${sessionScope.shop == null }">
						<li><a href="../info/storeUpdate.bbq?sh_uid=0">매장정보변경</a></li>
					</c:if>				
					<c:if test="${sessionScope.shop != null }">
						<li><a href="../info/storepicList.bbq?sh_uid=${sessionScope.shop }">매장사진관리</a></li>
					</c:if>				
					<c:if test="${sessionScope.shop == null }">
						<li><a href="../info/storepicList.bbq?sh_uid=0">매장사진관리</a></li>
					</c:if>				
					<c:if test="${sessionScope.shop != null }">
						<li><a>개인정보수정</a></li>
					</c:if>				
					<c:if test="${sessionScope.shop == null }">
						<li><a href="../changeinfo/changeShopInfo.bbq">개인정보수정</a></li>
					</c:if>				
				</ul>
			<c:if test="${sessionScope.shop == null }">
				<li><a href="../login/login_shop.bbq">로그인</a></li>
			</c:if>
			<c:if test="${sessionScope.shop != null }">
				<li><a href="../logout/Shoplogout.bbq">로그아웃</a></li>
			</c:if>			
			</ul>
	</header>

<section>
		<div class="content">
			<!-- 상세페이지 제목 -->
			<h2 id="content_title">매장정보변경</h2>
			<div class="box clear">
				<!------------- 세부메뉴 ----------마이페이지아닌 분들은 세부메뉴 지우세요------------->
				<div class="submenu">
					<h4 class="selected"><a>매장정보변경</a></h4>
					<h4><a href="../info/storepicList.bbq?sh_uid=${sessionScope.shop }">매장사진관리</a></h4>
					<h4><a href="../changeinfo/changeShopInfo.bbq">개인정보수정</a></h4>
				</div>
	
				<!------------- 세부메뉴 ----------class="inner" 지우세요------------->
				<div class="inner">
					<div class="info">	
						<div class="store_pic">
							<img src="${info[0].sh_picture1 }" />
							<img src="${info[0].sh_picture2 }" />
							<img src="${info[0].sh_picture3 }" />
						</div>
					<div class="store_info">			
					<h2>${info[0].sh_name }</h2>
				
				<!-- 매장 기본정보 -->
				<form name="frm" action="storeInfoUpdate.bbq" method="post" onsubmit="return infoSubmit(this)">					
					<ul class="information">
					<h3>기본정보</h3>
						<input type="hidden" name="sh_uid" value="${info[0].sh_uid }">
						<li>번호 
							<input type="text" name="sh_telephone" value="${info[0].sh_telephone }" /> 
							<span>* 번호는 - 포함하여 적어주세요.</span>
						</li>
						<li>주소 </li>
						<li>
							<input id="btn2" class="addressBtn" type="button" onclick="sh_execDaumPostcode()" value="주소찾기">
							<input class="addressBtn" id="chklocation" type="button" value="주소확정">
						</li>
						<li>
							<input class="address" id="sh_roadAddr" type="text" name="sh_roadAddr"  value="${info[0].sh_location } ">		
							<input id="sh_detailAddress" type="text" name="sh_detailAddress" placeholder="상세주소"><br>
							<input id="sh_location" type="hidden" name="sh_location" value="${info[0].sh_location } ">
							<input id="sh_location_lat" type="hidden" name="sh_location_lat" placeholder="위도"value="${info[0].sh_location_lat } ">
							<input id="sh_location_lng" type="hidden" name="sh_location_lng" placeholder="경도"value="${info[0].sh_location_lng } ">		
						</li>
						<li>시간
							<input class="time" type="text" name="sh_starttime" value="${info[0].sh_starttime }" /> : 00 - 
							<input class="time" type="text" name="sh_endtime" value="${info[0].sh_endtime }" /> : 00
						</li>
						<li>인사말<br>
							<textarea class="himessage" name="sh_hello">${info[0].sh_hello }"
							</textarea>
						</li>
						<input class="update" type="submit" value="기본정보수정" />
					</ul>				
				</form>
					
				<!-- 매장 가격정보 -->
				<div class="information">
					<h3>스타일 정보</h3>
					<h4>경과시간은 시간 단위로만 적어주세요. ex) 1시간이면 1이라고 입력</h4>
					<c:forEach var="dto1" items="${service }">
						<form name="serfrm" method="post" >		
							<ul class="service_info">
								<input type="hidden" name="sh_uid" value="${dto1.sh_uid}"/>
								<input type="hidden" name="ser_uid" value="${dto1.ser_uid}">
								<li>이름 <input type="text" name="ser_name" value="${dto1.ser_name }" /></li>
								<li>가격 <input type="text" name="ser_price" value="${dto1.ser_price }" /></li>
								<li>시간 <input class="time" type="text" name="ser_time" value="${dto1.ser_time }" /></li>
								<div class="btnbox">
									<input class="p_btn" type="submit" value="수정" formaction="serviceUpdate.bbq"/>
									<input id="go_delete" class="p_btn" type="submit" value="삭제" formaction="serviceDelete.bbq"/>
								</div>
							</ul>																	
						</form>
					</c:forEach>			
					
					<input class="update" type="button"  value="스타일추가"
						onClick="location.href='serviceAdd.bbq?sh_uid=${param.sh_uid}'" />
				</div>									
				
				<!-- 디자이너 목록 -->
				<div class="information">
					<h3>디자이너 정보</h3>
					<c:forEach var="dto2" items="${designer }">
						<form name="defrm" method="post" enctype="Multipart/form-data">
							<ul class="designer">
								<input type="hidden" name="sh_uid" value="${dto2.sh_uid }" />
								<input type="hidden" name="de_uid" value="${dto2.de_uid }" />
								<li id="imgbox"><img src="${dto2.de_picture }"></li>							
								<li>이름 <input type="text" name="de_name" value="${dto2.de_name }" /></li>
								<li>직책 <input type="text" name="de_position" value="${dto2.de_position }" /></li>
								<li>경력 <input type="text" name="de_career" value="${dto2.de_career }" /></li>
								<li>전공 <input type="text" name="de_major" value="${dto2.de_major }"></li>
								<li><input class="insert_dpic" type="file" name="de_picture" size=40></li>
								<div class="btnbox">
									<input class="p_btn d_btn" type="submit" value="수정" formaction="designerUpdate.bbq"/>
									<input id="go_delete" class="p_btn d_btn" type="submit" value="삭제" formaction="designerDelete.bbq"/>
								</div>
							</ul>
						</form>
					</c:forEach>
					<input class="update" type="button" value="디자이너추가"
						onClick="location.href='designerAdd.bbq?sh_uid=${param.sh_uid}'" />
				</div>
			</div>
		</div>			
	</div>
		
	<!-- 화살표버튼 -->
	<div id="go_top">
		<a><i class="fas fa-arrow-circle-up"></i></a>
	</div>
</div>
</section>

<!-- javascript 링크 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="../js/public.js" type="text/javascript"></script>
</body>
</html>
	
	</c:when>

</c:choose>
