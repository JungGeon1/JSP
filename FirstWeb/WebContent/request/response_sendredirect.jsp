<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="css/NewFile.css" rel="stylesheet" type="text/css">
<style>

</style>
</head>
<body>응답처리가진행된ㅂ니다- 오타뭐죠?
<div>
<%
request.setAttribute("code", "code-1");
%>
</div>
</body>
</html>
<%
	String name = request.getParameter("name");
	response.sendRedirect("form3_result.jsp?type=b_type&name=" + name);
%>