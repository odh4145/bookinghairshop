<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<c:choose>
	<c:when test="${login_shop == -1 }">
		<script>
			alert("로그인 실패!!\n아이디를 다시 확인해주세요.");
			history.back();
		</script>
	</c:when>
	
	<c:when test="${login_shop == 0 }">
		<script>
			alert("로그인 실패!!\n비밀번호를 다시 확인해주세요.");
			history.back();
			
		</script>
	</c:when>
    
    <c:when test="${login_shop == 1 }">
		<script>
			alert("로그인 성공");
			location.href = "../book/shop.bbq?sh_uid=${sessionScope.shop }";
		</script>
	</c:when>    
</c:choose>




