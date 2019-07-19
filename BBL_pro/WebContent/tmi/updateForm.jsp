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
div{
	padding:0.2%; 
	}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
	$(document).ready(function() {
		$('#idchkMsg').html("");

		$('#btn').click(function() {
			$.ajax({
				url : 'updateIdCheck.jsp',
				type : 'GET',
				data : {
					tId : $('#tId').val(),
					uId : $('#uId').val(),
					tTitle: $('#tTitle').val(),
					tContent: $('#tContent').val()
					
					
				},
				success : function(data) {
				
					
					if (data == 'NT') {
						alert("제목을 입력하지 않으셨어요.. 집중!");

					}else if (data == 'NC') {
						alert("내용을 입력하지 않으셨어요.. 집중!");

					}else if (data == 'Y') {
						alert("새로운 기억으로 글이 변경되었어요!");

					} else {
						alert("글번호와 아이디가 일치하지 않아요...다시 생각해주세요..");

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
		<h3>ID를 입력해주세요!</h3>
			<div>
				<input type="text" id="tId"	value="<%=request.getParameter("tmi_ID")%>" readonly>
			</div>
			<div>
				<input placeholder="아이디에요" type="text" id="uId"> <input type="button" id="btn" value="변경"> <br>
			</div>
			<div>
				<input placeholder="새 제목이에요" type="text" id="tTitle" required><br>
			</div>
			<div>
				<textarea placeholder="새로 떠오른 기억을 적어주세요!" rows="6" cols="60" id="tContent"></textarea>
			</div>
	</div>
	<a href="tmiList.jsp" id="show">게시글 보러가기</a>
</body>
</html>