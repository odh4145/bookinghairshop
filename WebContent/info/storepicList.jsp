<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:choose>
   <c:when test="${sessionScope.shop == null }">
      <script>
         alert("매장의 정보가 없습니다.");
         history.back();
      </script>
   </c:when>
   <c:otherwise>
   
<!------ html 시작 ------>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>매장사진관리</title>
<link rel="icon" href="../img/favicon.png">

<!-- css파일 link -->
<link href="../css/menu.css" rel="stylesheet" type="text/css">
<link href="../css/sub.css" rel="stylesheet" type="text/css">
<link href="../css/storepicList.css" rel="stylesheet" type="text/css">
</head>

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
						<li><a href="../info/storeUpdate.bbq?sh_uid=${sessionScope.shop }">매장정보변경</a></li>
					</c:if>				
					<c:if test="${sessionScope.shop == null }">
						<li><a href="../info/storeUpdate.bbq?sh_uid=0">매장정보변경</a></li>
					</c:if>				
					<c:if test="${sessionScope.shop != null }">
						<li><a>매장사진관리</a></li>
					</c:if>				
					<c:if test="${sessionScope.shop == null }">
						<li><a href="../info/storepicList.bbq?sh_uid=0">매장사진관리</a></li>
					</c:if>				
					<c:if test="${sessionScope.shop != null }">
						<li><a href="../changeinfo/changeShopInfo.bbq">개인정보수정</a></li>
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
      <h2 id="content_title">매장사진관리</h2>
      
      <div class="box clear">
         <!------------- 세부메뉴 ----------마이페이지아닌 분들은 세부메뉴 지우세요------------->
         <div class="submenu">
            <h4><a href="../info/storeUpdate.bbq?sh_uid=${sessionScope.shop}">매장정보변경</a></h4>
            <h4 class="selected"><a>매장사진관리</a></h4>
            <h4><a href="../changeinfo/changeShopInfo.bbq">개인정보수정</a></h4>
         </div>
   
         <!------------- 세부메뉴 ----------class="inner" 지우세요------------->
         <div class="inner">
            <form name="picfrm" enctype="Multipart/form-data" action="storepicUpdate.bbq" method="post">
               <ul class="pic_box">
                  <input type="hidden" name="sh_uid" value="${info[0].sh_uid }">
                  <li><img src="${info[0].sh_picture1 }"></li>
                  <li><input class="insert_dpic" type="file" name="sh_picture1" size=40></li>
                  <li><input class="update" type="submit" value="수정하기" /></li>
               </ul>                  
               <ul class="pic_box">
                  <input type="hidden" name="sh_uid" value="${info[0].sh_uid }">
                  <li><img src="${info[0].sh_picture2 }"></li>
                  <li><input class="insert_dpic" type="file" name="sh_picture2" size=40></li>
                  <li><input class="update" type="submit" value="수정하기" /></li>
               </ul>                  
               <ul class="pic_box">
                  <input type="hidden" name="sh_uid" value="${info[0].sh_uid }">
                  <li><img src="${info[0].sh_picture3 }"></li>
                  <li><input class="insert_dpic" type="file" name="sh_picture3" size=40></li>
                  <li><input class="update" type="submit" value="수정하기" /></li>
               </ul>                  
            </form>
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
<script src="../js/storeUpdate.js" type="text/javascript"></script>
</body>
</html>
</c:otherwise>
</c:choose>	