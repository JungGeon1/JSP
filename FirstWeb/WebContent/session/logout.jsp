<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style></style>
</head>
<body>
	<%
		//request.getSession(false).invalidate();
	session.invalidate();
	%>
	<h1>로그아웃되었습니다</h1>
	<a href="viewsession.jsp">view session1</a>
	<br>
	<a href="../response/viewsession.jsp">view session2</a>
</body>
</html>