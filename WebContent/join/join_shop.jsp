<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>지역별매장</title>
<link rel="icon" href="../img/favicon.png">

<!-- css파일 link -->
<link href="../css/menu.css" rel="stylesheet" type="text/css">
<link href="../css/join.css" rel="stylesheet" type="text/css">
</head>

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
                document.getElementById('sh_postcode').value = data.zonecode;
                document.getElementById("sh_roadAddr").value = roadAddr;
                

            }
        }).open();
    }
</script>

<!-- form 검증 -->
<script>
function chkShopSubmit(){
	frm = document.forms['frm_shop'];
	
	var sh_id = frm['sh_id'].value.trim();
	var sh_pw = frm['sh_pw'].value.trim();
	var sh_no_id = frm['sh_no_id'].value.trim();
	var sh_name = frm['sh_name'].value.trim();
	var sh_telephone = frm['sh_telephone'].value.trim();
	var sh_postcode = frm['sh_postcode'].value.trim();
	var sh_roadAddr = frm['sh_roadAddr'].value.trim();
	var sh_detailAddress = frm['sh_detailAddress'].value.trim();
	var sh_location = frm['sh_roadAddr'].value.trim() + " " + frm['sh_detailAddress'].value.trim();
	var sh_location_lat = frm['sh_location_lat'].value.trim();
	
	if(sh_id == ""){
		alert("아이디를 입력해주세요");
		frm["sh_id"].focus();
		return false;
	}
	if(sh_pw == ""){
		alert("비밀번호 입력해주세요");
		frm["sh_pw"].focus();
		return false;
	}
	if(sh_no_id == ""){
		alert("사업자 번호를 입력해주세요");
		frm["sh_no_id"].focus();
		return false;
	}
	if(sh_name == ""){
		alert("매장 이름을 입력해주세요");
		frm["sh_name"].focus();
		return false;
	}
	if(sh_telephone == ""){
		alert("매장 전화번호를 입력해주세요");
		frm["sh_telephone"].focus();
		return false;
	}
	if(sh_postcode == ""){
		alert("우편번호를 입력해주세요");
		frm["sh_postcode"].focus();
		return false;
	}
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
	if(sh_location_lat == ""){
		alert("주소 입력 확인을 눌러주세요");
		return false;
	}
	
	//주소 합치기
	var add1 = frm.sh_add1.value;
	var add2 = frm.sh_add2.value;
	var add3 = add1 + " " + add2;
	frm.sh_location.value = add3;
	
	return true;
}

$(document).ready(function(){
	
	$("#chklocation").click(function(){
		
		frm = document.forms['frm_shop'];
		
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
		
		var addr_ok = sh_roadAddr + ", " + sh_detailAddress;
		alert("주소 : " + addr_ok + " 확인 완료")
	});
});

function parseJSON(jsonObj){
	var location_lat = jsonObj.results[0].geometry.location.lat;
	var location_lng = jsonObj.results[0].geometry.location.lng;
	
//	alert(location_lat)
//	alert(location_lng)
	
	document.getElementById('sh_location_lat').value = location_lat;
	document.getElementById('sh_location_lng').value = location_lng;
	
	frm = document.forms['frm_shop'];
	
	var sh_roadAddr = frm['sh_roadAddr'].value.trim();
	var sh_detailAddress = frm['sh_detailAddress'].value.trim();
	
	document.getElementById("sh_location").value = sh_roadAddr + " " + sh_detailAddress;
}






</script>
<script>
</script>

<body>
<header>
		<ul id="top_menu">
			<li id="logo"><a href="../index.jsp">Booking<span>HairShop</span></a></li>
			<ul id="menu_list">
			<c:choose>
			<c:when test="${sessionScope.shop != null}">
				<li><a href="../hj/shlist.bbq?sh_uid=${sessionScope.shop }">후기</a></li>
			</c:when>
			<c:when test="${sessionScope.shop == null }">
				<li><a href="../hj/shlist.bbq?sh_uid=0">후기</a></li>
			</c:when>
			</c:choose>
			<c:choose>
				<c:when test="">
				<li><a href="../book/shop.bbq?sh_uid=${sessionScope.shop }">예약내역</a></li>
				</c:when>
			</c:choose>
				<c:choose>
				<c:when test="${sessionScope.shop != null }">
				<li><a href="../info/storeUpdate.bbq?sh_uid=${sessionScope.shop }">마이페이지</a></li>
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
						<li><a href="../info/storeUpdate.bbq?sh_uid=${sessionScope.user }">매장정보 변경</a></li>
					</c:if>				
					<c:if test="${sessionScope.shop == null }">
						<li><a href="../info/storeUpdate.bbq?sh_uid=0">매장정보 변경</a></li>
					</c:if>				
					<c:if test="${sessionScope.user != null }">
						<li><a href="../info/storepicList.bbq?sh_uid=${sessionScope.shop }">매장 사진 관리</a></li>
					</c:if>				
					<c:if test="${sessionScope.user == null }">
						<li><a href="../info/storepicList.bbq?sh_uid=0">매장 사진 관리</a></li>
					</c:if>				
					<c:if test="${sessionScope.user != null }">
						<li><a href="">개인정보수정</a></li>
					</c:if>				
					<c:if test="${sessionScope.user == null }">
						<li><a href="">개인정보수정</a></li>
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

		<!-- 회원가입  -->
			<div id="join_shop">
			<h3>Sign Up</h3>
				
			<hr>
				
				<form name="frm_shop" action="join_shop_ok.bbq" method="post" onsubmit="return chkShopSubmit()">
				
					<input id="sh_id" type="text" name="sh_id" placeholder="ID"><br>
					<input id="sh_pw" type="password" name="sh_pw" placeholder="PASSWORD"><br>
					<input id="sh_no_id" type="text" name="sh_no_id" placeholder="BUSINESS NUMBER"><br>
					<input id="sh_name" type="text" name="sh_name" placeholder="STORE NAME"><br>
					<input id="sh_telephone" type="text" name="sh_telephone" placeholder="PHONE"><br>
					
					<input id="sh_postcode" type="text" placeholder="POST CODE">
					
					<input id="btn2" type="button" onclick="sh_execDaumPostcode()" value="FIND"><br>
					<input id="sh_roadAddr" type="text" name="sh_roadAddr" placeholder="ADDRESS LINE 1"><br>
					<input id="sh_detailAddress" type="text" name="sh_detailAddress" placeholder="ADDRESS LINE 2"><br>
					<input id="sh_location" type="hidden" name="sh_location">
					<input id="chklocation" type="button" value="Address Check "><br>
				
					<input type="hidden" name="sh_location">
					<input id="sh_location_lat" type="hidden" name="sh_location_lat" placeholder="위도">
					<input id="sh_location_lng" type="hidden" name="sh_location_lng" placeholder="경도">

					

					<input type="submit" id="btn" value="Sign Up">
				
				</form>
		
	</div>
</section>
<!-- 

<input id="sh_postcode" type="text" name="sh_postcode" placeholder="우편번호">
<input type="button" onclick="sh_execDaumPostcode()" value="주소 찾기"><br>
<input id="sh_location" type="text" name="sh_location" placeholder="도로명주소">
<input id="sh_detailAddress" type="text" name="sh_detailAddress" placeholder="상세주소">

 -->

<!-- javascript 링크 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="../js/public.js" type="text/javascript"></script>

</body>
</html>