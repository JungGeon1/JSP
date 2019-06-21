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
<body>응답페이지
<div>
<%
request.setAttribute("code", "code-0");
request.setAttribute("name", request.getParameter("name"));
request.setAttribute("type", "type-a");
%>
</div>
</body>
</html>
<jsp:forward page="form3_result.jsp"/>
<%-- 	<jsp:param value="a_type" name="type" />
	<jsp:param value='<%=request.getParameter("name")%>' name="name" />
</jsp:forward --%>>