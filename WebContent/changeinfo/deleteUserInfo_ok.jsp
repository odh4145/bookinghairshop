<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>
	
	<c:when test="${deleteUser == 0 }">
		<script>
			alert("회원탈퇴 실패!!\n비밀번호를 확인해주세요.");
			history.back();
		</script>
	</c:when>
	
	<c:when test="${deleteUser == 1 }">
			<% session.invalidate();%>
		<script>
			alert("회원탈퇴 완료\n메인페이지로 이동합니다.");
			location.href = "../index.bbq";
		</script>
	</c:when>
	
	
</c:choose>
