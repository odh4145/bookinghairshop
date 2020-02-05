<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<% int sh_uid = Integer.parseInt(request.getParameter("sh_uid"));
   int use_uid = Integer.parseInt(request.getParameter("use_uid"));
   String bo_service = request.getParameter("bo_service");
   String use_name = request.getParameter("use_name");
%>   
   
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>후기 작성</title>
<link rel="icon" href="../img/favicon.png">

<!-- css파일 link -->
<link href="../css/menu.css" rel="stylesheet" type="text/css">
<link href="../css/sub.css" rel="stylesheet" type="text/css">
<link href="../css/write.css" rel="stylesheet" type="text/css">
</head>
<script>
   // form 검증
   function chkSubmit() {
      frm = document.forms["frm"];

      var name = frm["name"].value.trim();
      var title = frm["title"].value.trim();

      if (name == "") {
         alert("작성자 란은 반드시 입력해야 합니다");
         frm["name"].focus();
         return false;
      }
      if (subject == "") {
         alert("제목은 반드시 작성해야 합니다");
         frm["title"].focus();
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
         <h2 id="content_title">후기작성</h2>
         <div class="box clear">
            <!------------- 세부메뉴 ----------마이페이지아닌 분들은 세부메뉴 지우세요------------->
            <div class="submenu">
               <h4><a href="../book/user.bbq?use_uid=${sessionScope.user }">예약내역</a></h4>
               <h4><a>내가쓴글</a></h4>
               <h4><a href="../changeinfo/changeUserInfo.bbq?use_uid=${sessionScope.user }">개인정보수정</a></h4>
            </div>

         <!------------- 세부메뉴 ----------class="inner" 지우세요------------->
         <div class="inner">
            <%-- 글 내용이 많을수 있기 때문에 POST 방식 사용 --%>
            <form name="frm" action="writeOk.bbq" method="post"
               onsubmit="return chkSubmit()">
               <input type="hidden" name="use_uid" value = '<%=use_uid %>'/>
               <input type="hidden" name="sh_uid" value = '<%=sh_uid %>'/>
              <!--  
              	타이틀 => bo_service  
              	네임 = > 작성자 이름
              -->
              
               <h4>제목 : <%=bo_service %></h4>
               
               <h5>한번 등록한 별점은 변경할수 없습니다. 선택시 신중하게 선택해주세요.</h5>
               <li>별점 : <select name="star" id="star">
                           <option>1</option>
                           <option>2</option>
                           <option>3</option>
                           <option>4</option>
                           <option selected="selected">5</option></select></li>
               <li>작성자 : <%=use_name %></li>
               <li>내용<br><textarea name="content"></textarea></li>
               <div class="btnbox">
               		<input type="submit" value="등록" />
               		<button type="button" onclick="location.href='shlist.bbq?sh_uid=<%=sh_uid%>'">목록으로</button>
               		
               </div>
                           </form>
            <br>
            
         </div>
      </div>


      <!-- 화살표버튼 -->
      <div id="go_top">
         <a><i class="fas fa-arrow-circle-up"></i></a>
      </div>

   </section>










</body>

</html>