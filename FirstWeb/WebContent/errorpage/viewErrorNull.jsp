<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style></style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
<h1>요청하신 처리내용 중에 오류가 발생했습니다.(너어어얼~~좋아해~~릴리릴리릴~~) <br>빠른시간안에 해결하겠습니다</h1>
<a href="<%=request.getContextPath()%>">홈으로 이동</a>
<p>
에러 타입: <%= exception.getClass().getName() %> <br>
에러 메시지: <b><%= exception.getMessage() %></b>
</body>
</html>