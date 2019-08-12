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
	<h1>사원  추가</h1>
	<hr>
<form action="insertEmp.jsp" method="post">
	사원번호<input type="number" name="empno" required><br>
	사원이름<input type="text" name="ename" required><br>
	직업<input type="text" name="job" required><br>
	<!-- 사원이름<input type="text" name="mgr" required><br>
	사원이름<input type="date" name="hiredaet" required><br>
	사원이름<input type="number" name="sal" required><br>
	사원이름<input type="number" name="comm" required><br>
	사원이름<input type="number" name="deptno" required><br> -->
	<input type="submit" value="추가">
</form>
</body>
</html>