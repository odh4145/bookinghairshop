<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.lec.beans.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%
	WriteDTO[] arr = (WriteDTO[]) request.getAttribute("view");
%>

<%
	int uid = Integer.parseInt(request.getParameter("uid"));
	// ※ 이 단계에서 parameter 검증 필요
%>


<%
	if (arr == null || arr.length == 0) {
%>
<script>
	alert("해당글이 삭제되거나 없습니다.");
	history.back();
	</script>
<%
	return;//더이상 볼게 없을때는 JSP 프로세싱을 끊어줘야해 ~
	}
%>


<%
	String name = arr[0].getName();
	String title = arr[0].getTitle();
	String content = arr[0].getContent();
	String regdate = arr[0].getRegDate();
	int use_uid = arr[0].getUse_uid();
	int sh_uid = arr[0].getSh_uid();
%>

<%-- 위에서 필요한 트랜잭션이 마무리 되면 페이지에 보여주기 --%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><%=title%></title>
<link rel="icon" href="../img/favicon.png">

<!-- css파일 link -->
<link href="../css/menu.css" rel="stylesheet" type="text/css">
<link href="../css/sub.css" rel="stylesheet" type="text/css">
<link href="../css/view.css" rel="stylesheet" type="text/css">

</head>
<script>
function chkDelete(id){
	// 삭제 여부 확인
	var r = confirm("삭제하시겠습니까?");
	
	if(r){
		location.href = 'deleteOk.bbq?uid=' + id+'&sh_uid='+<%=sh_uid%>;
	}
	
}
</script>

<body>
	<header>
		<ul id="top_menu">
			<li id="logo"><a href="../index.jsp">Booking<span>HairShop</span></a></li>
			<ul id="menu_list">
				<li><a href="../hj/shlist.bbq?sh_uid=${sessionScope.shop }">후기</a></li>
				<li><a>예약내역</a></li>
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
				<li><a>예약내역</a></li>
				<li><a id="mypage">마이페이지</a></li>
				<ul id="mo_sub">
					<c:if test="${sessionScope.shop != null }">
						<li><a href="../info/storeUpdate.bbq?sh_uid=${sessionScope.shop }">매장정보변경</a></li>
					</c:if>				
					<c:if test="${sessionScope.shop == null }">
						<li><a href="../info/storeUpdate.bbq?sh_uid=0">매장정보변경</a></li>
					</c:if>				
					<c:if test="${sessionScope.user != null }">
						<li><a href="../info/storepicList.bbq?sh_uid=${sessionScope.shop }">매장사진관리</a></li>
					</c:if>				
					<c:if test="${sessionScope.user == null }">
						<li><a href="../info/storepicList.bbq?sh_uid=0">매장사진관리</a></li>
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
			<!-- 상세페이지 제목 -->
			<h2 id="content_title">후기 관리</h2>


			<!------------- 세부메뉴 ----------class="inner" 지우세요------------->
			<div id="view">
            <div id= "view2">		
			
				<h2><%=title%></h2>
				 
				<p>작성자:<%=name%><br><p>
			    <p>등록일:<%=regdate%><br><p>
				<p>내용: <br> <p>
				<div id="content">
					<%=content%>
				</div>
				<hr>
				
				<button id="btn" onclick="location.href = 'shlist.bbq?page=${page }&sh_uid=<%=sh_uid %>'">목록보기</button>


				<br> 
				<form name="frm" action="reWrite.bbq" method="post">
					<input type="hidden" name="uid" value="<%=uid%>" /> 
					<input type="hidden" name="use_uid" value="<%=use_uid%>" />

			</div>		
			
			<div id="re_view">
					<!-- 민교야 여기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
				    <input id="btn2" type="submit" value="답글달기" />
				</form>
				<hr>
			
			
				<h2>답글 목록</h2>
				<table>
					<tr>
						<th>내용</th>
						<th>등록일</th>
					</tr>
                                     
                                      <c:forEach var="dto" items="${Relist }" varStatus="status">

						<tr>
                                                        <td>${dto.re_content }</td>
							<td>${dto.re_regDate }</td>
						</tr>
                                       </c:forEach>
				</table>
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
</body>
</html>





