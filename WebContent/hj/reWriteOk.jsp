<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% // controller 를 사용한 트랜잭션
	int cnt = (Integer)request.getAttribute("Reresult");
	int uid = (Integer)request.getAttribute("co_uid");
%>

<%-- 위에서 필요한 트랜잭션이 마무리 되면 페이지에 보여주기 --%>

<% if(cnt == 0){ %>
	<script>
		alert("등록 실패!!!!!");
		history.back();
	</script>
	
<% } else if(cnt == 2){ %>
	<script>
		alert("죄송하지만, 작성자 외에는 답글을 작성할수 없습니다.");
		location.href = "view.bbq?uid=<%= uid%>";
	</script>
	
<% } else { %>
	<script>
		alert("등록성공, 후기를 출력합니다");
		location.href = "view.bbq?uid=<%= uid%>";
	</script>
<% }  %>












