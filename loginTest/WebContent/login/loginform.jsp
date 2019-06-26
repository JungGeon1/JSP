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
}

table {
	margin: 0 auto;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
	<div id="wrap">
		<form action="process.jsp" method="post">
			<table>
				<tr>
					<td>ID:</td>
					<td><input type="text" name="uId"></td>
				</tr>
				<tr>
					<td>PW:</td>
					<td><input type="password" name="uPw"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="전송"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>