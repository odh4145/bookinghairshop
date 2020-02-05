<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<% // dao 사용한 트랜잭션
	int cnt = (Integer)request.getAttribute("deleteOk");
	int sh_uid = Integer.parseInt(request.getParameter("sh_uid"));
%>
<%-- 위에서 필요한 트랜잭션이 마무리 되면 페이지에 보여주기 --%>

<% if(cnt == 0){ %>
<script>
	alert("삭제실패");
	history.back();
</script>
<% } else { %>
<script>
	alert("삭제성공");
	location.href = "shlist.bbq?sh_uid=<%=sh_uid%>";
</script>
<% } %>









