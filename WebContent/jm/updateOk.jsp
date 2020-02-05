<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	int uid = Integer.parseInt(request.getParameter("uid"));
%>

<% 
	int cnt = (Integer)request.getAttribute("updateOk");
%>

<%-- 위에서 필요한 트랜잭션이 마무리 되면 페이지에 보여주기 --%>

<% if(cnt == 0){ %>
<script>
	alert("수정실패");
	history.back();
</script>
<% } else { %>
<script>
	alert("수정성공");
	location.href = "view.bbq?uid=<%=uid%>"; <%-- 수정성공하면 view 로 이동해서 제대로 수정되었는지 확인--%>
</script>
<% } %>



















