<%@page import="member.UserInfo"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Enumeration<String> e = application.getAttributeNames();
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
		while (e.hasMoreElements()) {

			String name = e.nextElement();
			Object obj = application.getAttribute(name);
			if (obj instanceof UserInfo) {
				out.println(name + ":"+obj+"<br>");
			}
		}
	%>
</body>
</html>