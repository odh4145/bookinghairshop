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
function chkShopPw(){
frm = document.forms["frm_chk_shop_pw"];
	
	var sh_pw = frm["sh_pw"].value.trim();
	var sh_pw2 = frm["sh_pw2"].value.trim();
	
	if(sh_pw == ""){
		alert("현재 비밀번호를 입력해주세요");
		frm["sh_pw"].focus();
		return false;
	}
	if(sh_pw2 == ""){
		alert("새 비밀번호를 입력해주세요");
		frm["sh_pw2"].focus();
		return false;
	}
	return true;
}

</script>

<body>
	<header>
		<ul id="top_menu">
			<li class="logo"><a href="../index.bbq">Booking<span>HairShop</span></a></li>
			<ul id="menu_list">
				<li><a href="../hj/shlist.bbq?sh_uid=${sessionScope.shop }">후기</a></li>
				<li><a href="../book/shop.bbq?sh_uid=${sessionScope.shop }">예약내역</a></li>
				<li><a>마이페이지</a></li>
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
						<li><a href="../storeUpdate.bbq?sh_uid=${sessionScope.shop}">매장정보변경</a></li>
					</c:if>				
					<c:if test="${sessionScope.shop == null }">
						<li><a href="../storeUpdate.bbq?sh_uid=0">매장정보변경</a></li>
					</c:if>				
					<c:if test="${sessionScope.shop != null }">
						<li><a href="../info/storepicList.bbq?sh_uid=${sessionScope.user }">매장사진관리</a></li>
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
				<li id="login"><a href="../login/login_shop.bbq">로그인</a></li>
			</c:if>
			<c:if test="${sessionScope.shop != null }">
				<li id="login"><a href="../logout/Shoplogout.bbq">로그아웃</a></li>
			</c:if>
			<li><a id="btn_menu"><i class="fas fa-ellipsis-h"></i></a></li>
	</header>

<section>
	<div class="content">
		<!-- 상세페이지 제목 -->
		<h2 id="content_title">개인정보수정</h2>
		 <div class="box clear">
            <!------------- 세부메뉴 ----------마이페이지아닌 분들은 세부메뉴 지우세요------------->
            <div class="submenu">
               <h4><a href="../info/storeUpdate.bbq?sh_uid=${sessionScope.shop}">매장정보변경</a></h4>
               <h4><a href="../info/storepicList.bbq?sh_uid=${sessionScope.shop }">매장사진관리</a></h4>
               <h4 class="selected"><a>개인정보수정</a></h4>
            </div>
      
            <!------------- 세부메뉴 ----------class="inner" 지우세요------------->
            <div class="inner">
				<c:choose>
				<c:when test="${sessionScope.shop != null }">    
			
				<div id="changeinfo" >
					<h3>개인정보수정</h3>
					<hr>
					<form name="frm_chk_shop_pw" action="changeShopInfo_ok.bbq" method="post" onsubmit="return chkShopPw()">
			       	<ul>
						<li><input id="sh_pw" type="password" name="sh_pw" placeholder="CURRENT PASSWORD"></li>
						<li><input id="sh_pw2" type="password" name="sh_pw2" placeholder="NEW PASSWORD"></li>
						<li><input type="submit" id="btn" value="Change"/></li>
						<li><a id="delete" href="../changeinfo/deleteShopInfo.bbq">탈퇴하기</a>
				  	</ul>
					</form>			
				</div>
			</div>
			</div>
		
</c:when>
			
	<c:when test="${sessionScope.shop == null }">
		<script>
			alert("로그인이 필요한 서비스입니다.")
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