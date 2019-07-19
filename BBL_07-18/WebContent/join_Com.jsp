<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자 가입페이지</title>
</head>
<style>
  ul{
	list-style: none;
  }
  label {
	width: 60px;
	display: inline-block;
  }
</style>
<meta charset="UTF-8">
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<!-- Bootstap Css  -->
<link rel="stylesheet" href="css/bootstrap.css"/>
<!-- viewport -->
<body>
	<header>
		<img src="img/fork.png" style="width:40px;height:40px; margin-left: 20px;margin-top:-10px;">
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
	  			<li><a href="main.jsp">홈</a></li>
	  			<li><a href="#">공지사항</a></li>
	  			<li><a href="#">뿔레?!</a></li>
	  			<li><a href="#">잡담게시판</a></li>
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
	  					<li><a href="main.jsp">홈</a></li>
	  					<li><a href="login.jsp">회원 로그인</a></li>
	  					<li><a href="login_com.jsp">사업자 로그인</a></li>
	  					<li><a href="logout.jsp">로그아웃</a></li>	  					
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
	  					<li><a href="login.jsp">회원 로그인</a></li>
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
 	<div class="container">
		<span style ="color: black; font-size: 60px; margin-left: 330px; font-family: 'Sunflower', sans-serif;">사업자가입</span>
		<form action="joinProcess_com.jsp" method="post">
		   <fieldset style = "margin-left: 200px; margin-top: -20px;">
			  <!-- 	<legend style ="color: black; font-size: 60px; margin-left: 70px; font-family: 'Sunflower', sans-serif;">회원가입</legend> -->		  
			  	<ul>
					<li text-align="center"><label for="company_ID">아이디</label> </li>
   	 				<li> <input type="text" id="company_ID" name="company_ID" placeholder="아이디를 입력해주세요." style="width:440px;padding:3px">
   	 				<button class="btn btn-primary" onclick="regiFunction();" type="button">중복체크</button></li>
             	</ul>			
				<ul>
   					<li><label for="company_Pw">비밀번호</label></li>
   					<li> <input type = "password"  id="company_Pw" name="company_Pw" placeholder="비밀번호를 입력해주세요." maxlength="50" style="width:440px; padding:3px;"></li>
  				</ul>
				<ul>
   					<li><label for="company_rPw">비밀번호</label></li>
  					<li> <input type = "password"  id="company_rPw" name="company_rPw" placeholder="비밀번호를 확인합니다. 다시 입력해주세요."  maxlength="50" style="width:440px; padding:3px;"> </li>
 				</ul>
  				<ul>
  					 <li><label for="company_Name">이름</label></li>
   					 <li> <input type = "text"  id="company_Name" name="company_Name" placeholder="이름을 입력해주세요."  maxlength="50" style="width:440px; padding:3px;"> </li>
 				</ul>
				<ul>
   					 <li><label for="company_Email">이메일</label></li>
  					 <li><input type = "text" id="company_Email" name="company_Email" placeholder="이메일을 입력해주세요."  maxlength="50" style="width:440px; padding:3px;"></li>
  				</ul>
  				<ul>
   					 <li><label for="company_Num">사업자</label></li>
  					 <li><input type = "text" id="company_Num" name="company_Num" placeholder="사업자번호를 입력해주세요."  maxlength="50" style="width:440px; padding:3px;"></li>
  				</ul>
				<ul>
  				   <li><label for="company_Memo">비고</label></li>
   				   <li><textarea cols = "60" rows = "10" id="company_Memo" name="company_Memo" placeholder="멋진 자기소개를 입력해보세요!" ></textarea></li>
  				</ul>
  				<ul>
  				   <li colspan="2">
  				   <input type = "submit" value = "가입하기" style ="margin-left:18px; padding: 12px; width:220px; margin:5px; margin-top: -40px;"><input type = "reset" value="다시 입력" style ="padding:12px;width:210px">
  				   </li>
  				</ul>
			</fieldset>
		</form>
		

	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
	<script src="js/bootstrap.js"></script>


</body>
</html>