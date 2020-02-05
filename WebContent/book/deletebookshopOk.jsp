<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>취소 페이지</title>
</head>
<body>
<% 
try{	
	//문제가 생기면 체크박스에 체크를 안하고 줬을 경우가 있으므로 NumberFormatException이 발생할 수 있다.
	int result = Integer.parseInt(request.getParameter("result"));

}catch(NumberFormatException e){
	out.println("<script>");
	out.println("alert('취소사유가 최소한 하나는 필요합니다');");
	out.println("history.back();");
	out.println("</script>");
}
%>
<form id="pass" action="shopdelete.book.bbq" method="post">
	<input type="hidden" name="bo_uid" value="<%=request.getParameter("bo_uid") %>">
	<input type="hidden" name="sh_uid" value="<%=request.getParameter("sh_uid") %>">
<script type="text/javascript">
this.document.getElementById("pass").submit();
</script>
</form> 
</body>
</html>