<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% int sh_uid = (Integer)request.getAttribute("sh_uid"); %>
<c:choose>
	<c:when test="${info == 0 }">
		<script>
			alert("매장사진 수정 실패");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("매장사진 수정 완료");
			location.href = "storepicList.bbq?sh_uid=<%=sh_uid%>";
		</script>
	</c:otherwise>
</c:choose>












