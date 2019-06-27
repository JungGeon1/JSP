<%@page import="member.Member"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setAttribute("member", new Member("tiger","ttt","000-0000-0000"));
	request.setAttribute("name01", "requestDat");
	session.setAttribute("name02", "SessionData");
	application.setAttribute("name03", "applicattionData");
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
	<h3>
	request영역의 name01:${requestScope.name01}<br>
		<%-- 			<%=request.getAttribute("name01") %> --%>
		session영역의 name02:${sessionScope.name02}<br>
	application 영역의 name 03:${applicationScope.nam;e03}<br>
	member 객체 참조1-id:${requestScope.member.id}<br> <!--  id를가지는 게터메세지를 호출-->
	member 객체 참조2-name:${requestScope.member.getName()}<br>
	member 객체 참조3-pNum:${requestScope.member.pNum}<br>
	member 객체 참조4-num:${requestScope.member.num}<br>
	</h3>
</body>
</html>