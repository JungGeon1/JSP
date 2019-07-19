<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#title{
	font-family: 'Sunflower', sans-serif;
}

#contents {
	width: 400px;
	margin: 0 auto;
	text-align: center;
	
}input[type=text]{
 	height: 50px;
    width: 400px;	
}#tContent{
    height: 300px;
    width: 400px;	
}#fileUp{
	position: absolute; 
 	width: 1px; 
 	height: 1px;
 	padding: 0; 
 	margin: -1px; 
 	overflow: hidden; 
 	clip:rect(0,0,0,0); 
 	border: 0;
}#fLabel{
	display: inline-block; 
	padding: .5em .75em; 
	color: #999; 
	font-size: inherit; 
	line-height: normal; 
	vertical-align: middle; 
	background-color: #fdfdfd; 
	cursor: pointer; 
	border: 1px solid #ebebeb; 
	border-bottom-color: #e2e2e2; 
	border-radius: .25em;
}

#photo{
	position:fixed;
 	bottom: 50px;
    right: 2%;
    width: 80px;
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
	  			<li><a href="#">뿔레?!</a></li>
	  			<li class="active"><a href="tmiList.jsp">잡담게시판</a></li>
	  			<li><a href="#">광고게시판</a></li>	  			
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
	  					<li><a href="../join.jsp">회원가입</a></li>
	  					<li><a href="../join_Com.jsp">사업자가입</a></li>
	  					<li><a href="../login.jsp">회원 로그인</a></li>
	  					<li><a href="../login_com.jsp">사업자 로그인</a></li>
	  					<li><a href="../logout.jsp">로그아웃</a></li>	  					
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
	  					<li><a href="../login.jsp">회원 로그인</a></li>
	  					<li><a href="../login_com.jsp">사업자 로그인</a></li>	
	  					<li><a href="../logout.jsp">로그아웃</a></li>  					
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
		<h1 id=title>뿔레</h1>
		<br>
		<form action="writeTmi.jsp" method="post"
			enctype="multipart/form-data">

			<div>                               <!-- 나중에 readonly추가로 작성자 변경 불가설정 -->
				<input type="text" name="user_ID" value="<%=session.getAttribute("IdDemo")%>">
			</div>
			<div>
				<input type="text" name="tmi_Title" required placeholder="글의 제목이 될거에요!">
			</div>
			<div>																						<!-- &#13;&#10; placeholder에서 줄 바꾸기! -->
				<textarea id="tContent" name="tmi_Content" required placeholder="오늘 하루 즐거우셨나요?&#13;&#10;맛있었던 일상 혹은 즐거웠던 일상을 기록해주세요!"></textarea>
			</div>
			<div>
				<label id="fLabel" for="fileUp">TMI</label>
				<input type="file" name="tmi_Photo" id="fileUp" >
			</div>
			<div id="click">
				<input type="submit"  value="작성" class="btn btn-default btn-lg">
				<input type="button" id="btn" value="취소" class="btn btn-default btn-lg">
			</div>

		</form>
	</div>
	
	<img id="photo" src="../img/fork.png">

	
</body>
<script>
	$(document).ready(function() {
		$('#btn').click(function() {
			history.go(-1);

		})
	})
</script>
</html>