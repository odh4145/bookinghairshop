<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>손님 로그인</title>
<link rel="icon" href="img/favicon.png">

<!-- css파일 link -->
<link href="../css/menu.css" rel="stylesheet" type="text/css">
<link href="../css/login.css" rel="stylesheet" type="text/css">
</head>

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

<!-- form 검증 -->
<script>
function chkUserSubmit() {
	frm = document.forms["frm_user"];
	
	var use_id = frm["use_id"].value.trim();
	var use_pw = frm["use_pw"].value.trim();

	if (use_id == "") {
		alert("아이디를 입력해주세요");
		frm["use_id"].focus();
		return false;
	}
	if (use_pw == "") {
		alert("비밀번호를 입력해주세요");
		frm["use_pw"].focus();
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
						<li><a href="../jm/uselist.bbq?use_uid=${sessionScope.user }">내가쓴글</a></li>
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

<c:choose>
	<c:when test="${sessionScope.user == null }">

	<section>

		<!-- 로그인 -->
		<div id="login_user">
				<h3>Sign In</h3>
				<a id="login_p"><i class ="fas fa-user-circle"></i></a>
			<form name="frm_user" action="login_user_ok.bbq" method="post"
				onsubmit="return chkUserSubmit()">
				<ul>
					<li><input id="use_id" type="text" name="use_id" placeholder="ID"></li>
					<li><input id="use_pw" type="password" name="use_pw" placeholder="PASSWORD"></li>
					<li><input type="submit" id="btn" value="Sign In" /></li>
					<li><a id="join" href="../join/join_user.bbq">Join</a></li>
				</ul>
			</form>

		</div>

	</section>	
	
	</c:when>
</c:choose>

</body>
</html>
