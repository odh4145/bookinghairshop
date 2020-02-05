<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>
	
	<c:when test="${change_shop_info == 0 }">
		<script>
			alert("비밀번호 변경 실패!!\n비밀번호를 확인해주세요.");
			history.back();
		</script>
	</c:when>
	
	<c:when test="${change_shop_info == 1 }">
			<% session.invalidate();%>
		<script>
			alert("비밀번호 변경 완료. 로그아웃합니다.");
			location.href = "../index.bbq";
		</script>
	</c:when>
	
	
</c:choose>

