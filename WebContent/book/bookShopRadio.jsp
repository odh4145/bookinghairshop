<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>취소 페이지</title>
</head>
<body>
<div>

<form action="deletebookshopOk.jsp" method="post">
<input type="hidden" name="bo_uid" value="<%=request.getParameter("bo_uid") %>">
<input type="hidden" name="sh_uid" value="<%=request.getParameter("sh_uid") %>">
<input type="radio" name="result"  value="1" checked="checked">부재<br/>
<input type="radio" name="result"  value="2">중복예약<br/>
<input type="radio" name="result"  value="3">기타 사항<br/>
<input type="submit" value="예약취소하기" >
<input type="button" value="취소" onclick="self.close()">
</form>
</div>
<br>
</body>
</html>
