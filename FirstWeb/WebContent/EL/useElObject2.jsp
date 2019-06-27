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
	<h3>
	request영역의 name01:${requestScope.name01}<br>
		<!--el은 널값이 들어오진않고 그냥공백으로 출력하기에 값이 제대로 들어오지않을시 널이거나 다른값을 호출한것   -->				
	session영역의 name02:${sessionScope.name02}<br>
	application 영역의 name 03:${applicationScope.name03}
	</h3>
</body>
</html>