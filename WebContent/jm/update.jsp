<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.lec.beans.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	int uid = Integer.parseInt(request.getParameter("uid"));
	// ※ 이 단계에서 parameter 검증 필요
	int sh_uid = Integer.parseInt(request.getParameter("sh_uid"));
%>

<%
	WriteDTO[] arr = (WriteDTO[]) request.getAttribute("update");
%>

<%
	String name = arr[0].getName();
	String title = arr[0].getTitle();
	String content = arr[0].getContent();
	String regdate = arr[0].getRegDate();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>수정 <%=title%></title>
<link rel="icon" href="../img/favicon.png">

<!-- css파일 link -->
<link href="../css/menu.css" rel="stylesheet" type="text/css">
<link href="../css/sub.css" rel="stylesheet" type="text/css">
</head>
<script>
	// form 검증
	function chkSubmit() {
		frm = document.forms["frm"];

		var subject = frm["subject"].value.trim();

		if (subject == "") {
			alert("제목은 반드시 작성해야 합니다");
			frm["subject"].focus();
			return false;
		}

		return true;
	}
</script>
<body>

	<header>
		<ul id="top_menu">
			<li id="logo"><a href="../index.bbq">Booking<span>HairShop</span></a></li>
			<ul id="menu_list">
			<li><a href="../location/Location2.bbq">내주변</a></li>
			<li><a href="../location/chooseArea.bbq">지역별매장</a></li>
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
			<!-- 상세페이지 제목 -->
			<h2 id="content_title">후기 수정</h2>
			<div>

				<form name="frm" action="updateOk.bbq" method="post"
					onsubmit="return chkSubmit()">
					<input type="hidden" name="uid" value="<%=uid%>" /> 작성자 :
					<%=name%><br>
					<%-- 작성자 이름은 변경 불가 --%>
					제목 : <input type="text" name="title" value="<%=title%>"><br>
					내용 :
					<textarea name="content"><%=content%></textarea>
					<br>
					<br> <input type="submit" value="수정" />
				</form>

				<button onclick="history.back()">이전으로</button>
				<button onclick="location.href = 'shlist.bbq?sh_uid=<%=sh_uid%>'">목록보기</button>
			</div>
		</div>


		<!-- 화살표버튼 -->
		<div id="go_top">
			<a><i class="fas fa-arrow-circle-up"></i></a>
		</div>

	</section>

</body>
</html>
















