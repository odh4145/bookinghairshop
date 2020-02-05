<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>

	<c:when test="${join_shop == -2 }">
		<script>
			alert("회원가입 실패!!(아이디 중복)");
			history.back();
		</script>
	</c:when>
	
	<c:when test="${join_shop == -1 }">
		<script>
			alert("회원가입 실패!!(사업자 번호 중복)");
			history.back();
		</script>
	</c:when>
	
	<c:when test="${join_shop == 0 }">
		<script>
			alert("회원가입 실패!!(매장 전화 번호 중복)");
			history.back();
		</script>
	</c:when>
	
	<c:when test="${join_shop == 1 }">
		<script>
			alert("회원가입 성공");
			location.href = "../index.bbq";
		</script>
	</c:when>
</c:choose>


