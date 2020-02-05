<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글작성</title>
<link rel="icon" href="../img/favicon.png">

<!-- css파일 link -->
<link href="../css/menu.css" rel="stylesheet" type="text/css">
<link href="../css/sub.css" rel="stylesheet" type="text/css">
</head>

<%
	int use_uid = Integer.parseInt(request.getParameter("use_uid"));
	// ※ 이 단계에서 parameter 검증 필요
	int uid = Integer.parseInt(request.getParameter("uid"));
	// ※ 이 단계에서 parameter 검증 필요
%>

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
			<!-- 상세페이지 제목 -->
			<h2 id="content_title">답글 작성하기</h2>

			<!------------- 세부메뉴 ----------class="inner" 지우세요------------->
			<div>
				<form name="frm" action="reWriteOk.bbq" method="post">
					<input type="hidden" name="uid" value="<%=uid%>" /> <input
						type="hidden" name="use_uid" value="<%=use_uid%>" />
					<p>
						내용:<br>
						<textarea name="re_content"></textarea>
					</p>
					<br> <br> <input type="submit" value="등록" />
				</form>
				<br>
				<button type="button" onclick="location.href='view.bbq?uid=<%=uid%>'">목록으로</button>
			</div>
		</div>


		<!-- 화살표버튼 -->
		<div id="go_top">
			<a><i class="fas fa-arrow-circle-up"></i></a>
		</div>

	</section>



</body>

</html>