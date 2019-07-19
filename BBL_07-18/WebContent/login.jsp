<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<meta charset="UTF-8">
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap.css"/>
<!-- viewport -->
<body>
	
	<header>
		<img src="img/fork.png" style="width:40px;height:40px; margin-left: 20px;margin-top:-10px;">
        <span style ="color: black; font-size:40px; margin-left: 20px; font-family: 'Sunflower', sans-serif;">뿔레</span>
	</header>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
	%>
	<nav class="navbar navbar-inverse">
		<div class="navbar-header">
 		<a class = "navbar-brand" href="#"></a>	
	  	</div>
	  	
	  	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	  		<ul class="nav navbar-nav">
	  			<li class="active"><a href="main.jsp">홈</a></li>
	  			<li><a href="#">공지사항</a></li>
	  			<li><a href="#">뽈레?!</a></li>
	  			<li><a href="#">잡담게시판</a></li>
	  			<li><a href="#">광고게시판</a></li>	  			
	  		</ul>  		
	  		<%
	  			if(userID == null){
	  		%>
			<ul class="nav navbar-nav navbar-right">
	  			<li class="dropdown">
	  				<a href="#" class="dropdown-toggle"
	  				   data-toggle="dropdown" role="button"
	  				   aria-haspopup="true" aria-expanded="false">멤버스<span class="caret"></span></a>
	  				<ul class="dropdown-menu">
	  					<li><a href="join.jsp">회원가입</a></li>
	  					<li><a href="login.jsp">회원 로그인</a></li>
	  					<li><a href="login_com.jsp">사업자 로그인</a></li>	  					
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
	  				   aria-haspopup="true" aria-expanded="false">로그인중<span class="caret"></span></a>
	  				<ul class="dropdown-menu">
	  					<li><a href="login.jsp">로그인</a></li>
	  					<li><a href="login_com.jsp">사업자 로그인</a></li>
	  					<li><a href="logout.jsp">로그아웃</a></li>
	  				</ul>   
	  			</li>
	  		</ul>
	  		<%
	  			}
	  		%>
	  	</div>
	</nav>
 	</br>
 	</br>
 	<div class="container">
		<div class=col-lg-4></div>
		<div class=col-lg-4>
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="loginProcess.jsp">
					<h3 style="text-align:center;">회원 로그인</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디"
							   name="user_ID" maxlength="20">
					</div>		
					<div class="form-group">   
						<input type="password" class="form-control" placeholder="비밀번호"
							   name="user_Pw" maxlength="20">
					</div>		   	   
						<input type="submit" class="btn btn-defalut form-control" value="로그인">
						<input type="reset" class="btn btn-defalut form-control" value="취소" style="margin:2px; margin-left:-1px;">   
				</form>
			</div>
		</div>	
		<div class=col-lg-4></div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
	<script src="js/bootstrap.js"></script>


</body>
</html>