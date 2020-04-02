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
<link href="../css/chooseArea.css" rel="stylesheet" type="text/css">

<!-- javascript 링크 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="../js/public.js" type="text/javascript"></script>

<!-- height 길이 조절 자바스크립트  -->
<script>
$(document).ready(function(){
	var menu = 100;
	var dHeight = $(document).height() - menu;
	
	$(document).resize(function() {
		dHeight = $(document).height() - menu;
	});
	
	$(".content").css('min-height', dHeight);
});
</script>
</head>

<body>
	<header>
		<ul id="top_menu">
			<li class="logo"><a href="../index.bbq">Booking<span>HairShop</span></a></li>
			<ul id="menu_list">
				<li><a href="../location/Location2.bbq">내주변</a></li>
				<li><a>지역별매장</a></li>
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
				<li><a>지역별매장</a></li>
				<li><a id="mypage">마이페이지</a></li>
				<ul id="mo_sub">
					<c:if test="${sessionScope.user != null }">
						<li><a href="../book/user.bbq?use_uid=${sessionScope.user }">예약내역</a></li>
					</c:if>				
					<c:if test="${sessionScope.user == null }">
						<li><a href="../book/user.bbq?use_uid=0">예약내역</a></li>
					</c:if>				
					<c:if test="${sessionScope.user != null }">
						<li><a href="../jm/uselist.bbq?use_uid=${sessionScope.user }">내가쓴글</a></li>
					</c:if>				
					<c:if test="${sessionScope.user == null }">
						<li><a href="../jm/uselist.bbq?use_uid=0">내가쓴글</a></li>
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
		<h2 id="content_title">지역별매장</h2>
		<div class="innerbox">
			<div class="choose">
				<a class="where" href="chooseDetailArea2.bbq">서울특별시</a>
				<a class="where" href="#">광주광역시</a>
				<a class="where" href="#">대구광역시</a>
				<a class="where" href="#">대전광역시</a>
				<a class="where" href="#">부산광역시</a>
				<a class="where" href="#">울산광역시</a>
				<a class="where" href="#">인천광역시</a>
			</div>
			<hr id="line">
			<div class="choose">
				<a class="where" href="#">강원도</a>
				<a class="where" href="#">경기도</a>
				<a class="where" href="#">경상남도</a>
				<a class="where" href="#">경상북도</a>
				<a class="where" href="#">전라남도</a>
				<a class="where" href="#">전라북도</a>
				<a class="where" href="#">충청남도</a>
				<a class="where" href="#">충청북도</a>
			</div>
		</div>
		
		

		
		<!-- 화살표버튼 -->
		<div id="go_top">
			<a><i class="fas fa-arrow-circle-up"></i></a>
		</div>
	</div>
</section>
</body>
</html>