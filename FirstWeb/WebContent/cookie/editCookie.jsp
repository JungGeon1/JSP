<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//쿠키의 이름이 name 인 퀴키 데이터를 변경
	//기존 이름의 쿠키객체를 생성:새로운 데이터로 등록
	Cookie c = new Cookie("name", "이강인");
	response.addCookie(c);
	Cookie c1= new Cookie("code","zero");
	response.addCookie(c1);
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
	<h1>쿠키 정보가 변경되었습니다.</h1>
	<a href="viewCookie.jsp">viewCookie</a>
</body>
</html>