<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h1 {
	font-weight:bolder;
}
div{
	padding:0.5%; 
	}
#contents {
	width: 50%;
	margin: 0 auto;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<meta name="viewport" content="width=device-width" initial-scale="1">
<link
	href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Orbitron&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<script src="../js/bootstrap.js"></script>
<body>
	<ul class="nav nav-tabs">
		<li role="presentation" class="active"><a href="main.jsp">Home</a></li>
		<li role="presentation"><a href="#">Notice</a></li>
		<li role="presentation"><a href="#">BBL</a></li>
		<li role="presentation"><a href="tmiList.jsp">TMI</a></li>
		<li role="presentation"><a href="#">Advertisement</a></li>
		<li role="presentation"><a href="join.jsp">Join</a></li>
		<li role="presentation"><a href="login.jsp">Login</a></li>
		<li role="presentation"><a href="#">Login.c</a></li>
		<li role="presentation"><a href="logout.jsp">Logout</a></li>
	</ul>
	<br>
	<div id="contents">
		<h1>뽈레</h1>
		<br>
		<form action="writeTmi.jsp" method="post"
			enctype="multipart/form-data">

			<div>
				<input type="text" name="user_ID" required placeholder="아리형꺼 받을예정(ID)">
			</div>
			<div>
				<input type="text" name="tmi_Title" required placeholder="글의 제목이 될거에요!">
			</div>
			<div>																						<!-- &#13;&#10; placeholder에서 줄 바꾸기! -->
				<textarea rows="6" cols="60" name="tmi_Content" required placeholder="오늘 하루 즐거우셨나요?&#13;&#10;맛있었던 일상 혹은 즐거웠던 일상을 기록해주세요!"></textarea>
			</div>
			<div>
				<input type="file" name="tmi_Photo">
			</div>
			<div>
				<input type="submit" value="작성">
				<input type="button" id="btn" value="취소">
				<!-- <button type="button" class="btn btn-primary dropdown-toggle" aria-haspopup="true" aria-expanded="false" value="안녕"> 안녕 </button> -->
			</div>


		</form>
	</div>
</body>
<script>
	$(document).ready(function() {
		$('#btn').click(function() {
			history.go(-1);

		})
	})
</script>
</html>