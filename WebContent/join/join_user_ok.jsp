<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>

	<c:when test="${join_user == -1 }">
		<script>
			alert("회원가입 실패!!\n아이디가 중복입니다.");
			history.back();
		</script>
	</c:when>
	
	<c:when test="${join_user == 0}">
		<script>
			alert("회원가입 실패!!\n휴대폰 번호 중복입니다.");
			history.back();
		</script>
	</c:when>
	
	<c:when test="${join_user == 1 }">
		<script>
			alert("회원가입 성공");
			location.href = "../location/Location2.bbq";
		</script>
	</c:when>
</c:choose>



