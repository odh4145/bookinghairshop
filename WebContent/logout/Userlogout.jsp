<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% session.invalidate(); %>

<%-- reqiest ㅇ[ 딤겨있는url -> location.href --%>

<script>
	alert("로그아웃합니다.\n메인페이지로 이동합니다.");
	location.href="../index.bbq";
</script>