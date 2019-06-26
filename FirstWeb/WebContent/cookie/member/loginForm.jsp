<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	CookieBox cbox = new CookieBox(request);
	String cId = cbox.getValue("ID");
	String uId="";
	if(cId!=null){
		uId=cId;
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
	<form action="login.jsp" method="post" >
		<h1>로그인</h1>
		<hr>
                                         
		아이디 <input type="text" name="id" value="<%=uId%>"> <br> 비밀번호 <input
			type="text" name="pw"> <br> 아이디저장하기<input
			type="checkbox" name="chk" value="on"><br> <input
			type="submit" value="로그인">
	</form>
	<br>
	<a href="loginCheck.jsp">loginCheck</a>

</body>
</html>