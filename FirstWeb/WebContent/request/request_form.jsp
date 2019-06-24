<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
}

h1 {
	text-align: center;
	padding-bottom: 30px;
}

table {
	margin: 0 auto;
	padding: 60px;
	border: 10px;
}

td {
	padding: 5px;
}

input[type=text] {
	width: 50%;
}
</style>
</head>
<body>

	<h1>request 폼</h1>
	<hr>
	<form action="request_form2.jsp">
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="uName"></td>

			</tr>
			<tr>
				<td>직업</td>
				<td><select name="job">
						<option value="none">무직</option>
						<option value="g">ㄱ직</option>
						<option value="n">ㄴ직</option>
				</select></td>
			</tr>
			<tr>
				<td>관심분야</td>
				<td><input type="checkbox" name="favor" value="jung">정치
					<input type="checkbox" name="favor" value="sa">사회 <input
					type="checkbox" name="favor" value="tong">정보통신</td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="확인"> <input
					type="button" value="취소"></td>
			</tr>
		</table>
	</form>

</body>
</html>