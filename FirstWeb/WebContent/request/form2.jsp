<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
h1 {
	text-align: center;
}

table {
	width: 500px;
	border: 0;
	border-collapse: collapse;
	margin: 0 auto;
}

td {
	border: 1px solid #ddd;
	padding: 10px;
}

select {
	height: 25px;
}

table tr:last-child {
	text-align: center;
}
</style>
</head>
<body>
	<h1>정건님의 재밌는 JSP시간 request form Test</h1>
	<hr>
	<form action="result.jsp" method="post">
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="uName"></td>
			</tr>
			<tr>
				<td>직업</td>
				<td><select name="job">
						<option>백수</option>
						<option>백조</option>
						<option>학생</option>
						<option>주부</option>
				</select></td>
			</tr>
			<tr>
				<td>관심분야</td>
				<td>java<input type="checkbox" value="java" name="favor">
					html5<input type="checkbox" value="html5" name="favor">
					css3<input type="checkbox" value="css3" name="favor">
					javascript<input type="checkbox" value="javascript" name="favor">
					JSP<input type="checkbox" value="jsp" name="favor">
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="보내기"> <input
					type="reset"></td>
			</tr>
		</table>
	</form>
</body>
</html>