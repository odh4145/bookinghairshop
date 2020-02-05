<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>개인정보수정</title>
<link rel="icon" href="../img/favicon.png">

<!-- css파일 link -->
<link href="../css/menu.css" rel="stylesheet" type="text/css">
<!-- 마이페이지 아닌분들은 sub.css 지우세요 -->
<link href="../css/sub.css" rel="stylesheet" type="text/css">
<link href="../css/changeUserInfo.css" rel="stylesheet" type="text/css">

</head>

<!--  form 검증  -->
<script>
function chkUserPw(){
frm = document.forms["frm_chk_shop_pw"];
	
	var sh_pw = frm["sh_pw"].value.trim();
	
	if(sh_pw == ""){
		alert("비밀번호를 입력해주세요");
		frm["sh_pw"].focus();
		return false;
	}
}
</script>
<body>
	<header>
		<ul id="top_menu">
			<li class="logo"><a href="../index.bbq">Booking<span>HairShop</span></a></li>
			<ul id="menu_list">
				<li><a href="../location/Location2.bbq">후기</a></li>
				<li><a href="../location/chooseArea.bbq">예약내역</a></li>
				<c:choose>
					<c:when test="${sessionScope.shop != null }">
						<li><a href="../book/user.bbq?use_uid=${sessionScope.user }">마이페이지</a></li>
					</c:when>
					<c:when test="${sessionScope.user == null }">
						<li><a href="../book/user.bbq?use_uid=0">마이페이지</a></li>
					</c:when>				
				</c:choose>				
			</ul>
			<c:if test="${sessionScope.shop == null }">
				<li id="login"><a href="../login/login_user.bbq">로그인</a></li>
			</c:if>
			<c:if test="${sessionScope.shop != null }">
				<li id="login"><a href="../logout/Userlogout.bbq">로그아웃</a></li>
			</c:if>
			<li><a id="btn_menu"><i class="fas fa-ellipsis-h"></i></a></li>
		</ul>
			<ul id="mo_menu">
				<li><a href="../location/Location2.bbq">후기</a></li>
				<li><a href="../location/chooseArea.bbq">예약내역</a></li>
				<li><a id="mypage">마이페이지</a></li>
				<ul id="mo_sub">
					<c:if test="${sessionScope.shop != null }">
						<li><a href="../book/user.bbq?use_uid=${sessionScope.user }">매장정보변경</a></li>
					</c:if>				
					<c:if test="${sessionScope.shop == null }">
						<li><a href="../book/user.bbq?use_uid=0">매장정보변경</a></li>
					</c:if>				
					<c:if test="${sessionScope.shop != null }">
						<li><a href="../jm/uselist.bbq?use_uid=${sessionScope.user }">매장사진수정</a></li>
					</c:if>				
					<c:if test="${sessionScope.shop == null }">
						<li><a href="../jm/uselist.bbq?use_uid=0">매장사진수정</a></li>
					</c:if>				
					<c:if test="${sessionScope.shop != null }">
						<li><a href="../changeinfo/changeShopInfo.bbq">개인정보수정</a></li>
					</c:if>				
					<c:if test="${sessionScope.shop == null }">
						<li><a href="../changeinfo/changeShopInfo.bbq">개인정보수정</a></li>
					</c:if>				
				</ul>
			<c:if test="${sessionScope.shop == null }">
				<li><a href="../login/login_user.bbq">로그인</a></li>
			</c:if>
			<c:if test="${sessionScope.shop != null }">
				<li><a href="../logout/Userlogout.bbq">로그아웃</a></li>
			</c:if>			
			</ul>
	</header>	

<section>
	<div class="content">
		<!-- 상세페이지 제목 -->
		<h2 id="content_title">마이페이지 개인정보수정</h2>
		 <div class="box clear">
            <!------------- 세부메뉴 ----------마이페이지아닌 분들은 세부메뉴 지우세요------------->
            <div class="submenu">
               <h4><a href="../info/storeUpdate.bbq?sh_uid=${sessionScope.shop}">매장정보변경</a></h4>
               <h4><a href="../info/storepicList.bbq?sh_uid=${sessionScope.shop }">매장사진수정</a></h4>
               <h4 class="selected"><a href="../changeinfo/changeShopInfo.bbq">개인정보수정</a></h4>
            </div>
		
		<div class="inner">
		<c:choose>
			<c:when test="${sessionScope.shop != null }">    
		
		<div id="changeinfo" >
			<h3>개인정보수정</h3>
			<hr>
			<form name="frm_chk_shop_pw" action="deleteShopInfo_ok.bbq" method="post" onsubmit="return chkShopPw()">
		       <ul>
					<li><input id="sh_pw" type="password" name="sh_pw" placeholder="CURRENT PASSWORD"></li>
					<li><input type="submit" id="btn" value="탈퇴하기"/></li>
			 </ul>
			</form>			
		</div>
		</div>
		
			</c:when>
			
	<c:when test="${sessionScope.shop == null }">
		<script>
			alert("로그인이 필요합니다.")
			location.href = "../login/login_shop.bbq";
		</script>
	</c:when>
		</c:choose>
		
	</div>
</section>


<!-- javascript 링크 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="../js/public.js" type="text/javascript"></script>
</body>
</html>