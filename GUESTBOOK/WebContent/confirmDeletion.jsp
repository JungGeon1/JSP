<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style></style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
<h1>메세지 삭제 비밀번호확인</h1>
<form action="deleteMessage.jsp">
메세지를 삭제하시려면 비밀번호를 입력하세요.<br>
<input type="hidden" name="messageId" value="<%=request.getParameter("messageId")%>">
비밀번호<input type="password" name="password" required><br>
<input type="submit" value="메시지 삭제">
</form>
</body>
</html>