<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String chkbox = request.getParameter("chk");

	boolean chk = false;

	if ( id!=null&&id.equals(pw)) {
		//z쿠키생성 : 사용자데이터를 저장
	
		Cookie c1 = CookieBox.createCookie("LOGIN", "SUCESS",-1);
		response.addCookie(c1);
		Cookie c2 = CookieBox.createCookie("ID", id,-1);
		response.addCookie(c2);
		chk = true;

	 	if(null!=chkbox&&chkbox.equals("on")){
			Cookie c3 = CookieBox.createCookie("LOGIN", "SUCESS", 60*60);
			response.addCookie(c3);
			Cookie c4 = CookieBox.createCookie("ID", id, 60*60);
			response.addCookie(c4);
			chk = true;
		}
	}
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

<h3>체크값확인용:<%=chkbox %></h3>
	<%
		if (chk) {
			out.println("<h1>로그인 되었습니다.</h1>");
			out.println("<a href=\"loginCheck.jsp \">loginchk</a>");
			out.println("<a href=\"loginForm.jsp \">아이디저장확인</a>");
		} else {
			out.println("<script>alert('로그인실패'); history.go(-1);</script>");
		}
	%>
</body>
</html>