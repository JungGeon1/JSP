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
<!-- Bootstap Css  -->
<link rel="stylesheet" href="css/bootstrap.css"/>
<!-- viewport -->
<body>
	
	<ul class="nav nav-tabs">
  		<li role="presentation"><a href="main.jsp">Home</a></li>
  		<li role="presentation"><a href="#">Notice</a></li>
  		<li role="presentation"><a href="#">Write</a></li>
  		<li role="presentation"><a href="#">TMI</a></li>
  		<li role="presentation"><a href="#">Advertisement</a></li>
  		<li role="presentation"><a href="join.jsp">Join</a></li>
  		<li role="presentation" class="active"><a href="login.jsp">Login</a></li>
  		<li role="presentation"><a href="#">Login.c</a></li>
  		<li role="presentation"><a href="logout.jsp">Logout</a></li>
	</ul>
 	</br>
 	</br>
 	<div class="container">
		<div class=col-lg-4></div>
		<div class=col-lg-4>
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="loginProcess.jsp">
					<h3 style="text-align:center;">로그인화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디"
							   name="user_ID" maxlength="20">
					</div>		
					<div class="form-group">   
						<input type="password" class="form-control" placeholder="비밀번호"
							   name="user_Pw" maxlength="20">
					</div>		   	   
						<input type="submit" class="btn btn-primary form-control" value="로그인">   
				</form>
			</div>
		</div>	
		<div class=col-lg-4></div>
	</div>



</body>
</html>