<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>매장 로그인</title>
<link rel="icon" href="img/favicon.png">

<!-- css파일 link -->
<link href="../css/menu.css" rel="stylesheet" type="text/css">
<link href="../css/login.css" rel="stylesheet" type="text/css">

	
<!-- javascript 링크 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="../js/public.js" type="text/javascript"></script>

<script>
$(document).ready(function(){
	var menu = 52;
	var dHeight = $(document).height() - menu;
	
	$(document).resize(function() {
		dHeight = $(document).height() - menu;
	});
	
	$("section").css('min-height', dHeight);
});
</script>
</head>

<!-- form 검증 -->
<script>
function chkShopSubmit(){
	frm = document.forms["frm_shop"];
	
	var sh_id = frm["sh_id"].value.trim();
	var sh_pw = frm["sh_pw"].value.trim();
	
	if(sh_id == ""){
		alert("아이디를 입력해주세요");
		frm["sh_id"].focus();
		return false;
	}
	if(sh_pw == ""){
		alert("비밀번호를 입력해주세요");
		frm["sh_pw"].focus();
		return false;
	}
	
	return true;
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
						<li><a href="../info/storeUpdate.bbq?sh_uid=${sessionScope.shop }">매장정보 변경</a></li>
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
 	<c:choose>
		<c:when test="${sessionScope.shop == null }">
			<!-- 로그인 -->
			<div id="login_shop">
				<h3>Sign In</h3>
				<a id="login_p2"><i class="fas fa-cut"></i></a>
				<form name="frm_shop" action="login_shop_ok.bbq" method="post" onsubmit="return chkShopSubmit()">
					<ul>
						<li><input id="sh_id" type="text" name="sh_id" placeholder="ID"></li>
						<li><input id="sh_pw" type="password" name="sh_pw" placeholder="PASSWORD"></li>
						<li><input type="submit" id="btn" value="Sign In"/></li>
						<li><a id= "join" href="../join/join_shop.bbq">Join</a></li>
					</ul>
				</form>	
			</div>			
		</c:when>
		
		<c:when test="${sessionScope.shop != null }">
			<script>
				location.href="../book/shop.bbq?sh_uid=${sessionScope.shop }";
			</script>
		</c:when>
	</c:choose>
</section>
</body>
</html>