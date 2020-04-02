<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% // Controller 로부터 결과 데이터 받음
	int cnt = (Integer) request.getAttribute("result");
	int uid = Integer.parseInt(request.getParameter("sh_uid"));
%>
<%-- 위에서 필요한 트랜잭션이 마무리 되면 페이지에 보여주기 --%>

<% if(cnt == 0){ %>
<script>
	alert("예약 취소에 실패하였습니다");
	history.back();
</script>
<% } else { %>
<script>
	alert("예약을 삭제하셨습니다");
	location.href = "${pageContext.request.contextPath}/book/shop.bbq?sh_uid=<%=uid%>";
</script>
<% } %>