<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#contents{
	margin-left: 3%;
	padding-bottom: 2%;
}
#show{
	margin-left: 2%;
}
#tId{
	margin-top: 10px;
}
#btn{
	margin-top: 10px;
}

</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
	$(document).ready(function() {
		$('#idchkMsg').html("");

		$('#btn').click(function() {
			$.ajax({
				url : 'deleteIdCheck.jsp',
				type : 'GET',
				data : {
					pId : $('#tId').val(),
					uId : $('#uId').val()
				},
				success : function(data) {
					if (data == 'Y') {
						alert("삭제되었어요..다음엔 더 멋진 글을 남겨주세요!");

					} else {
						alert("글 번호와 아이디가 일치하지 않아요...다시 생각해주세요..");

					}
					//$('body').append(data);
				}
			});
		});
	});
</script>
<link
	href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Orbitron&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<script src="../js/bootstrap.js"></script>
</head>
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
		<h3>정말..지우실꺼라면..ID를..</h3>
			<input type="text" id="tId"	value="<%=request.getParameter("tmi_ID")%>" readonly><br>
			<input type="text" id="uId" placeholder="ID"><br>
			<input type="button" id="btn" value="사라져라..">
	</div>
	<a href="tmiList.jsp" id="show">게시글 보러가기</a>
</body>
</html>