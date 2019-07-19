<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Monoton&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap.css"/>
<!-- viewport -->
<title>뿔레 사이트</title>
</head>
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
	  			<li class="active"><a href="main.jsp">홈</a></li>
	  			<li><a href="#">공지사항</a></li>
	  			<li><a href="#">뿔레?!</a></li>
	  			<li><a href="tmi/tmiList.jsp">잡담게시판</a></li>
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
	  					<li><a href="join.jsp">회원가입</a></li>
	  					<li><a href="join_Com.jsp">사업자가입</a></li>
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
	<span style="margin-top:130px;margin-left:200px;font-family: 'Monoton', cursive;font-size:80px;">welcome  to  the  Pulle!</span>
	<div class="mainContents" style="position: relative;">        
        <img src="img/main5.jpg" style="width:1200px;height:800px; margin-top:28px;margin-left:160px;">
        <span><h1 style="display: inline-block; font-family: 'Black Han Sans', sans-serif; margin-left:320px; font-size:140px;">어디서 뭘먹지?</h1></span>
        <!-- <div class="content_text" style="position: absolute; top: 10px; left: 10px;">
       	 
           <h1 style="color: black;margin-left: 100px;margin-top: 30px;font-family: 'Orbitron', sans-serif;font-size: 60px;">WELCOME TO:</h1>
           <p class="sub_text1" style="color: gray;margin-left: 300px;margin-top:30px;">나만 알고싶은 맛 지도 </p> -->
    </div>
	
	
	 <footer>
     <div>
        <p style="text-align: center; font-size: 12px;margin-top: 10px; opacity: 0.8">이용약관 | <span style="font-weight: 900;">개인정보처리방침 </span>| 책임의 한계와 | 법적고지 | 회원정보 | 고객센터</p>
     </div>          
     </footer>
     
        
    </div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
	<script src="js/bootstrap.js"></script>


 
</body>


</html>


