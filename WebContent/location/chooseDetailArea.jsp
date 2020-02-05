<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>지역별 매장</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<link href="../css/menu.css" rel="stylesheet" type="text/css">
<link href="../css/chooseDetailArea.css" rel="stylesheet" type="text/css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="../js/public.js" type="text/javascript"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<script>
	$(function() {
		$("#speed").selectmenu();

		$("#files").selectmenu();

		$("#number").selectmenu().selectmenu("menuWidget").addClass("overflow");

		$("#salutation").selectmenu();
	});
</script>
</head>

<body>
	<header>
	<ul id="top_menu">
		<li class="logo"><a href="../index.bbq">Booking<span>HairShop</span></a></li>
		<ul id="menu_list">
			<li><a href="../location/Location2.bbq">내 주변 매장</a></li>
			<li><a href="../location/chooseArea.bbq">지역별 매장</a></li>
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
			<li><a href="../location/Location2.bbq">내 주변 매장</a></li>
			<li><a href="../location/chooseArea.bbq">지역별 매장</a></li>
			<li><a id="mypage">마이페이지</a></li>
			<ul id="mo_sub">
				<c:if test="${sessionScope.user != null }">
					<li><a href="../book/user.bbq?use_uid=${sessionScope.user }">예약내역</a></li>
				</c:if>				
				<c:if test="${sessionScope.user == null }">
					<li><a href="../book/user.bbq?use_uid=0">예약내역</a></li>
				</c:if>				
				<c:if test="${sessionScope.user != null }">
					<li><a href="../jm/list.bbq?use_uid=${sessionScope.user }">내가 쓴 글</a></li>
				</c:if>				
				<c:if test="${sessionScope.user == null }">
					<li><a href="../jm/list.bbq?use_uid=0">내가 쓴 글</a></li>
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
		<h2 id="content_title">지역별매장 - 서울</h2>
		
		<!---------------------- content ---------------------->
		<div class="inner">
			<div class="demo">
				<form action="#">
					<fieldset>	
						<div class="sel_menu">			
							<label for="speed">지역</label> 
							<select name="speed" id="speed">
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
						<div class="sel_menu">
							<label for="files">상세 지역</label> 
							<select name="files" id="files">
								<option disabled selected>상세지역</option>
									<optgroup label="ㄱ">
									<option>강북구</option>
									<option>관악구</option>
									<option>강남구</option>
									<option>강동구</option>
									<option>광진구</option>
									<option>강서구</option>
									<option>구로구</option>
									<option>금천구</option>
								</optgroup>
								<optgroup label="ㄴ">
									<option>노원구</option>
									</optgroup>
								<optgroup label="ㄷ">
									<option>동작구</option>
									<option>동대문구</option>
								</optgroup>
								<optgroup label="ㅁ">
									<option>마포구</option>
									</optgroup>
								<optgroup label="ㅅ">
									<option>송파구</option>
									<option>성동구</option>
									<option>서초구</option>
									<option>성북구</option>
									<option>서대문구</option>
								</optgroup>
								<optgroup label="ㅇ">
									<option>용산구</option>
									<option>은평구</option>
									<option>양천구</option>
									<option>영등포구</option>
								</optgroup>
								<optgroup label="ㅈ">
									<option>종로구</option>
									<option>중구</option>
									<option>중랑구</option>
								</optgroup>
							</select>
					</div>
				</fieldset>
			</form>
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