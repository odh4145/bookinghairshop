<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>
	<c:when test="${designer == 0 }">
		<script>
			alert("디자이너 수정 실패");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("디자이너 수정 완료");
			location.href = "storeUpdate.bbq?sh_uid=${sessionScope.shop }";
		</script>
	</c:otherwise>
</c:choose>












