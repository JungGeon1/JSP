<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//쿠키등록방법
	//1. Cookie 객체를 생성: new Cookie(쿠키이름, 데이터)
	//2.response 객체에 Cookie룰 추가 :response.addCookie(쿠키객체의 참조변수)
	//3. cookie객체생성
	Cookie cookie = new Cookie("code", "ace");
	//response에 쿠키객체 추가
	response.addCookie(cookie);
	Cookie c1 = new Cookie("name", "손흥민");
	response.addCookie(c1);
	Cookie c2=new Cookie("id","cool");
	c2.setMaxAge(60);
	response.addCookie(c2);
	Cookie c3= new Cookie("email","test@tes.com");
	c3.setMaxAge(60*60); //1시간
	response.addCookie(c3);
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
	ADSF
	<h1>쿠키쿠키ㅜ키ㅜ키ㅟ퀴ㅜ퀴키쿠ㅜ키퀴퀴퀴퀴퀴퀴퀴</h1>
	<a href="viewCookie.jsp">viewCookie</a>
</body>
</html>