<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	CookieBox cBox = new CookieBox(request);
	// LOGIN"이 있으면 true가나옴  
	boolean loginChk = cBox.exists("LOGIN") && cBox.getValue("LOGIN").equals("SUCESS");
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
	<h1>로그인 확인 여부</h1>
	<%
		if (loginChk) {
			out.println("아이디는"+cBox.getValue("ID")+"로 로그인 되어있는 상태입니다.");
			out.println("<a href=\" logOut.jsp\">로그아웃</a>");
		} else {
			out.println("로그인 되어있는 상태가 아닙니다");
		}
	%>
</body>
</html>