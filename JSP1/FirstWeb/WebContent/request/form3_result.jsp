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
<body>
<div>
	<h1>
		type=<%=request.getParameter("type")%>
		<br> name=<%=request.getParameter("name")%>
		<br> code=<%=request.getAttribute("code")%>
		<br> name1=<%=request.getAttribute("name")%>
		<br> type1=<%=request.getAttribute("type")%>
	</h1>
</div>
</body>
</html>