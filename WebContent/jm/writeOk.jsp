<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% // controller 를 사용한 트랜잭션
   int cnt = (Integer)request.getAttribute("result");
   int cnt2 = (Integer)request.getAttribute("cnt2");
   int sh_uid = Integer.parseInt(request.getParameter("sh_uid")); 
%>

<%-- 위에서 필요한 트랜잭션이 마무리 되면 페이지에 보여주기 --%>

<% if(cnt == 0){ %>
   <script>
      alert("등록 실패!!!!!");
      history.back();
   </script>
<% } else if(cnt2 ==1){ %>
   <script>
      alert("등록성공, 리스트를 출력합니다");
      alert("고객님의 별점이 반영되었습니다.");
      location.href = "shlist.bbq?sh_uid=<%=sh_uid%>";
   </script>
<% }  %>











