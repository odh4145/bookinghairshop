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
<style>
table {
	width: 80%;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
<link rel="icon" href="../img/favicon.png">

<!-- css파일 link -->
<link href="../css/menu.css" rel="stylesheet" type="text/css">
<link href="../css/sub.css" rel="stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
</head>
<body>
	<header>
		<ul id="top_menu">
			<li id="logo"><a href="../index.bbq">Booking<span>HairShop</span></a></li>
			<ul id="menu_list">
			<li><a href="#">후기</a></li>
			<li><a href="#">예약내역</a></li>
			<li><a href="#">마이페이지</a></li>
			</ul>
			<!-- 로그인 상황에 따른 버튼 변경 -->
			<c:if test="${sessionScope.user == null }">
				<li id="login"><a href="../login/login_user.bbq">로그인</a></li>
			</c:if>
			<c:if test="${sessionScope.user != null }">
				<li id="login"><a href="../logout/Userlogout.bbq">로그아웃</a></li>
			</c:if>
			<!-- 로그인 상황에 따른 버튼 변경 -->
		</ul>
	</header>

	<section>
		<div class="content">
			
			<h2 id="content_title"><%= sh_name %> 후기 List</h2>

				<div>
					<hr>
					
					
					<table>
						<tr>
							<th>row</th>
							<th>uid</th>
							<th>제목</th>
							<th>글쓴이 이름</th>
							<th>별점</th>
							<th>등록일</th>
						</tr>

						<c:forEach var="dto" items="${list }" varStatus="status">
							<tr>
								<td>${(page - 1) * pageRows + status.index + 1 }</td>
								<td>${dto.uid }</td>
								<td><a href="view.bbq?uid=${dto.uid }&page=${page}">${dto.title }</a></td>
								<td>${dto.name }</td>
								<td>${dto.star }</td>
								<td>${dto.regDate }</td>
							</tr>
						</c:forEach>
					</table>
					<br>

					<form name="frm" action="sortlist.bbq?sh_uid=<%=sh_uid %>" method="post">
						<p>검색 :</p>
						<input type="text" name="text" /> <select name="speed" id="speed">
							<option selected="selected">디자이너</option>
							<option>받은 서비스</option>
						</select> <br> <input type="submit" value="검색" />
						<input type="button" onclick="location.href='shlist.bbq?sh_uid=<%=sh_uid %>'" value="검색취소" />
					</form>
				</div>
			<jsp:include page="sortpagination.jsp">
				<jsp:param value="${writePages }" name="writePages" />
				<jsp:param value="${totalPage }" name="totalPage" />
				<jsp:param value="${page }" name="curPage" />
				<jsp:param value="${sh_uid }" name="sh_uid" />
				<jsp:param value="${text }" name="text" />
			</jsp:include>
  
				</div>
	

		<!-- 화살표버튼 -->
		<div id="go_top">
			<a><i class="fas fa-arrow-circle-up"></i></a>
		</div>
		
	</section>

	<!-- javascript 링크 -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="../js/public.js" type="text/javascript"></script>
</body>
</html>







