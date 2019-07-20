<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

#contents{
	width: 400px;
	margin: 0 auto;
	text-align: center;
	
}

#photo{
	position:fixed;
 	bottom: 50px;
    right: 2%;
    width: 80px;
}.aTag{
 	font-family: 'Sunflower', sans-serif;
	color: #7f8c8d;
}
.aTag:hover{
	text-decoration:none;
	text-decoration:blink;
	color:#2c3e50;
}
input[type=text]{
	height: 50px;
    width: 400px;	
}#tContent{
    height: 300px;
    width: 400px;	
}#title{
	padding-bottom: 20px;
}#btnBox{
	margin-top: 20px;
}
#show{
	padding-top: 20px;
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
	<header>
		<img src="../img/fork.png" style="width:40px;height:40px; margin-left: 20px;margin-top:-10px;">
        <span style ="color: black; font-size:40px; margin-left: 20px; font-family: 'Sunflower', sans-serif;">뿔레</span>
	</header>
	<%
		String userID = null;
		String company_ID = null;
		if (session.getAttribute("userID") != null || session.getAttribute("company_ID") != null){
			userID = (String)session.getAttribute("userID");
			company_ID = (String)session.getAttribute("company_ID");
		}
	%>
	<nav class="navbar navbar-inverse">
		<div class="navbar-header">
 		<a class = "navbar-brand" href="#"></a>	
	  	</div>
	  	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	  		<ul class="nav navbar-nav">
	  			<li><a href="../main.jsp">홈</a></li>
	  			<li><a href="#">공지사항</a></li>
	  			<li><a href="../BBL/BBL.jsp">뿔레?!</a></li>
	  			<li class="active"><a href="tmiList.jsp">잡담게시판</a></li>
	  			<li><a href="../adver/adver_list.jsp">광고게시판</a></li>	  			
	  		</ul>  		
	  		<%
	  			if(userID == null || company_ID == null){
	  		%>
			<ul class="nav navbar-nav navbar-right">
	  			<li class="dropdown">
	  				<a href="#" class="dropdown-toggle"
	  				   data-toggle="dropdown" role="button"
	  				   aria-haspopup="true" aria-expanded="false">뿔레 가입후에 더 많은 서비스를 즐겨주세요! <span class="caret"></span></a>
	  				<ul class="dropdown-menu">
	  					<li><a href="../member/join.jsp">회원가입</a></li>
	  					<li><a href="../member/join_Com.jsp">사업자가입</a></li>
	  					<li><a href="../member/login.jsp">회원 로그인</a></li>
	  					<li><a href="../member/login_com.jsp">사업자 로그인</a></li>
	  					<li><a href="../member/logout.jsp">로그아웃</a></li>	  					
	  				</ul>   
	  			</li>
	  		</ul>
	  		
	  		<%
	  			} else {
	  		%>
	  		<ul class="nav navbar-nav navbar-right">
	  			<li class="dropdown">
	  				<a href="#" class="dropdown-toggle"
	  				   data-toggle="dropdown" role="button"
	  				   aria-haspopup="true" aria-expanded="false">개인회원 로그인중 <span class="caret"></span></a>
	  				<ul class="dropdown-menu">
	  					<li><a href="../member/login.jsp">회원 로그인</a></li>
	  					<li><a href="../member/login_com.jsp">사업자 로그인</a></li>	
	  					<li><a href="../member/logout.jsp">로그아웃</a></li>  					
	  				</ul>   
	  			</li>
	  		</ul>
	  		
			<%
	  			}
			%>
	  		
	  	</div>
	</nav>
<br>
	<div id="contents">
		<h3 id="title">ID를 입력해주세요!</h3>
			<div>
				<input type="text" id="tId"	value="<%=request.getParameter("tmi_ID")%>" readonly>
			</div>
			<div>
				<input placeholder="아이디에요" type="text" id="uId"> <br>
			</div>
			<div>
				<input placeholder="새 제목이에요" type="text" id="tTitle" required><br>
			</div>
			<div>
				<textarea placeholder="새로 떠오른 기억을 적어주세요!" id="tContent"></textarea>
			</div>
			<div id="btnBox"> 
			<input type="button" id="btn" value="변경" class="btn btn-default btn-lg">
			<input type="button" id="cancle" value="취소" class="btn btn-default btn-lg">
			</div>
			
			
			<div id="show"><a href="tmiList.jsp"  class="aTag">게시글 보러가기</a></div>
	</div>
	
	<img id="photo" src="../img/fork.png">

	
</body>
	
	<script>
	 $(document).ready(function () {
		$('#cancle').click(function () {
			history.go(-1);
			
		})
	})
	
	</script>


</html>