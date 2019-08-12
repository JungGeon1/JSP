<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Monoton&display=swap" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
<script src="../js/bootstrap.js"></script>
<style>
/* 	img#kakao-login-btn{
		width: 500px;
	} */
</style>
<body>
	
	<header>
		<img src="../img/fork.png" style="width:40px;height:40px; margin-left: 20px;margin-top:-10px;">
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
	  			<li class="active"><a href="../main.jsp">홈</a></li>
	  			<li><a href="#">공지사항</a></li>
	  			<li><a href="../BBL/BBL.jsp">뽈레?!</a></li>
	  			<li><a href="../tmi/tmiList.jsp">잡담게시판</a></li>
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
	  					<li><a href="../main.jsp">홈</a></li>
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
						<a id="kakao-login-btn"></a>
						<a href="http://developers.kakao.com/logout"></a>
				</form>
			</div>
		</div>	
		<div class=col-lg-4></div>
	</div>


</body>



<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<script type='text/javascript'>

  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('a877efa95d50234a67facd1a9b75a349');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton(
    		//설정 시작
    		{
			      container: '#kakao-login-btn',
			      size:'medium',
			      success: function(authObj) {
			        alert(JSON.stringify(authObj));
			        
				        Kakao.API.request({
				            url: '/v2/user/me',
				            success: function(res) {
				            	
				              alert(JSON.stringify(res));
				              alert(res.kakao_account.gender);
				            },
				            fail: function(error) {
				              alert(JSON.stringify(error));
				            }
				          });
			      },
			      fail: function(err) {
			         alert(JSON.stringify(err));
			      }
			    }
    		//설정 끝
    	
    );
    
    $(document).ready(function(){

    	Kakao.Auth.loginForm(
        		{
    			      success: function(authObj) {
    			        alert(JSON.stringify(authObj));
    			        
    				        Kakao.API.request({
    				            url: '/v2/user/me',
    				            success: function(res) {
    				            	
    				              alert(JSON.stringify(res));
    				              alert(res.kakao_account.gender);
    				            },
    				            fail: function(error) {
    				              alert(JSON.stringify(error));
    				            }
    				          });
    			      },
    			      fail: function(err) {
    			         alert(JSON.stringify(err));
    			      }
    			    }
        		//설정 끝
        	
        );
    });
    
    
    
    $('#logoutb').click(function(){
		Kakao.Auth.logout();
	});
  //]]>
  
</script>

</html>