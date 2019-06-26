<%@page import="member.loginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//세션에 저장되어 있는 로그인 ID룰 받는다
	//String userId = (String) session.getAttribute("loginId");
loginInfo loginInfo = (loginInfo)session.getAttribute("loginInfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style></style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
	<%
		if (loginInfo  != null) {
	%>
	<h1><%=loginInfo.getName()%>님 로긘 상태</h1>
	<h3>
	id=<%=loginInfo .getId() %><br>
	nicname=<%=loginInfo.getNicnmae()%><br>
	pNum=<%=loginInfo.getpNum() %><br>
	photo=<%=loginInfo.getPhoto() %><br>
	

	</h3>
	<a href="logout.jsp">logout</a>
	<%
		} else {
	%>
	<script>alert('로그인해야해요\n로그인 페이지로 이동');
			location.href='loginForm.jsp';
	</script>
	<%
		}
	%>
</body>
</html>