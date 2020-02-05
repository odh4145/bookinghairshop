<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.lec.beans.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%

   String sh_name = (String)request.getAttribute("shopName");

   int sh_uid = Integer.parseInt(request.getParameter("sh_uid"));

%>



<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><%= sh_name %> 후기 게시판</title>
<link rel="icon" href="../img/favicon.png">

<!-- css파일 link -->
<link href="../css/menu.css" rel="stylesheet" type="text/css">
<link href="../css/sub.css" rel="stylesheet" type="text/css">
<link href="../css/reviewlist.css" rel="stylesheet" type="text/css">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
</head>
<body>
<c:choose>
	<c:when test="${sessionScope.shop != null }">
 	<header>
		<ul id="top_menu">
			<li id="logo"><a href="../index.jsp">Booking<span>HairShop</span></a></li>
			<ul id="menu_list">
				<li><a>후기</a></li>
				<li><a href="../book/shop.bbq?sh_uid=${sessionScope.shop }">예약내역</a></li>
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
				<li><a>후기</a></li>
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
						<li><a href="../changeinfo/changeShopInfo.bbq">개인정보수정</a></li>
					</c:if>				
					<c:if test="${sessionScope.user == null }">
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
         
         <h2 id="content_title"><%= sh_name %> 후기 List</h2>
            <div class="inbox">
               <table class="list">
                  <tr>
                     <th>번호</th>
                     <th>제목</th>
                     <th>작성자</th>
                     <th>별점</th>
                  </tr>

                  <c:forEach var="dto" items="${list }" varStatus="status">
                     <tr>
                        <td>${(page - 1) * pageRows + status.index + 1 }</td>
                        <td id="subject"><a href="view.bbq?uid=${dto.uid }&page=${page}">${dto.title }</a></td>
                        <td>${dto.name }</td>
                        <td>${dto.star }</td>
                     </tr>
                  </c:forEach>
               </table>

               <form name="frm" action="sortlist.bbq?sh_uid=<%=sh_uid %>" method="post">
                  <select name="speed" id="speed">
                     <option selected="selected">제목</option>
                     <option>작성자</option>
                  </select>
                  <input type="text" name="text" /> 
                  <input class="btn" type="submit" value="검색" />
                  <input class="btn" type="button" onclick="location.href='shlist.bbq?sh_uid=<%=sh_uid %>'" value="되돌아가기" />
               </form>
               
               <jsp:include page="pagination.jsp">
               <jsp:param value="${writePages }" name="writePages" />
               <jsp:param value="${totalPage }" name="totalPage" />
               <jsp:param value="${page }" name="curPage" />
               <jsp:param value="${sh_uid }" name="sh_uid" />
               </jsp:include>
            </div>
         </div>
   
   
  

      <!-- 화살표버튼 -->
      <div id="go_top">
         <a><i class="fas fa-arrow-circle-up"></i></a>
      </div>
      
   </section>
	</c:when>

<c:when test="${sessionScope.shop == null }">
	<script>
		alert("매장의 정보가 없습니다.")
		location.href = "../login/login_shop.bbq";
	</script>
</c:when>

</c:choose>

   <!-- javascript 링크 -->
   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   <script src="../js/public.js" type="text/javascript"></script>

</body>
</html>





