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
  		<li role="presentation"><a href="#">BBL</a></li>
  		<li role="presentation"><a href="#">TMI</a></li>
  		<li role="presentation"><a href="#">Advertisement</a></li>
  		<li role="presentation" class="active"><a href="#">Join</a></li>
  		<li role="presentation"><a href="login.jsp">Login</a></li>
  		<li role="presentation"><a href="#">Login.c</a></li>
  		<li role="presentation"><a href="logout.jsp">Logout</a></li>
	</ul>
 	</br>
 	</br>
 	<div class="container">
		<h2>회 원 가 입</h2>
		<form action="joinProcess.jsp" method="post">
			I     D : <input type="text" name="user_ID" placeholder="아이디를 입력해주세요."><br>
			P     W : <input type="password" name="user_Pw" placeholder="비밀번호를 입력해주세요."><br>
			N A M E : <input type="text" name="user_Name" placeholder="이름을 입력해주세요."><br>
			G  E  N : <input type="checkbox">남자  <input type="checkbox">여자 <br>
			M A I L : <input type="text" name="user_Email" placeholder="이메일을 입력해주세요."><br>
			<input type="submit" value="작성완료" style="margin:5px;"><input type="reset" value="취소">
		</form>
	</div>



</body>
</html>