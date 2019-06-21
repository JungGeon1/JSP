<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
	body {
		background-image: url("img/dogrun.gif");
	}
</style>
</head>
<body>
	<h1>session을 이용한 데이터 저장</h1>
	<%
	session.setAttribute("name", "king");
	session.setAttribute("id", "tiger");
	session.setAttribute("isLogin", true);
	session.setAttribute("age",20 );
	%>
	<h3>세션에 데이터를 저장해씁니다.- 오타뭐에요 </h3>
	<a href="viewsession.jsp">view session1</a><br>
	<a href="../response/viewsession.jsp">view session2</a><br>
	<a href="logout.jsp">logout</a>
</body>
</html>