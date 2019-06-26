<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연습이다 이 말이야</title>
<style>
* {
	margin: 0;
	padding: 0;
}

#wrap {
	text-align: center;
	margin: 0 auto;
}

table {
	margin: 0 auto;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
	<%String userId=request.getParameter("uId");
	String userPw = request.getParameter("uPw");
	
	%>
	<div id="wrap">
	아이디<%=userId %><br>
	비밀번호<%=userPw %>
	</div>
</body>

</html>