<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>
	<c:when test="${book == 0 }">
		<script>
			alert("예약실패");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("예약신청이 완료되었습니다.\n매장에서 승인 완료가 되어야 예약이 확정됩니다.");
			location.href = "../book/user.bbq?use_uid=${sessionScope.user }";
		</script>
	</c:otherwise>
</c:choose>












