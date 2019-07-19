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
<title>Insert title here</title>
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
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
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
 	<script>
	
	$(document).ready(function() {

		$('#btn').click(function() {
		//$('#uId').focusout(function() {	
			$('#idchkMsg').html("");
			$.ajax({
				url : 'idcheck.jsp',
				type : 'post',
				data : {
					user_ID : $('#user_ID').val(),
				},
				success : function(data) {
					//alert(data);

					if (data == 'Y') {
						alert("사용가능한 아이디입니다.")
						//$('body').append('<span style="color:blue;">NICE ID.</span>')
						$('#idchkMsg').html('멋진 아이디에요!');
						$('#idchkMsg').css('color','green');
					} else {
						alert("사용할 수 없는 아이디입니다.")
						//$('body').append('<span style="color:red;">INVALID ID.</span>')
						$('#idchkMsg').html('사용하실 수 없습니다.');
						$('#idchkMsg').css('color','red');
					}
					//$('body').append(data);
				}
			});
		
		});	
		
		//$('#btn').click(function() {
	    $('#user_Pw').focusout(function() {	
				$('#idchkMsg1').html("");
				$.ajax({
					url : 'idcheck.jsp',
					type : 'post',
					data : {
						user_Pw : $('#user_Pw').val(),
					},
					success : function(data) {
						//alert(data);
						if (data == 'Y') {
							alert("사용가능한 비밀번호입니다.")
							//$('body').append('<span style="color:blue;">NICE ID.</span>')
							$('#idchkMsg1').html('적절한 비밀번호입니다.');
							$('#idchkMsg1').css('color','green');
						} else {
							alert("사용할 수 없습니다.")
							//$('body').append('<span style="color:red;">INVALID ID.</span>')
							$('#idchkMsg1').html('사용불가합니다. 다시입력해주세요.');
							$('#idchkMsg1').css('color','red');
						}
						//$('body').append(data);
					}
				});
			
			});	
	    
	    $('#user_rPw').focusout(function() {	
			$('#idchkMsg2').html("");
			$.ajax({
				url : 'idcheck.jsp',
				type : 'post',
				data : {
					user_rPw : $('#user_rPw').val(),
					user_Pw2 : $('#user_rPw').val(),
				},
				success : function(data) {
					//alert(data);
					if (data == 'Y') {
						alert("비밀번호 체크가 완료되었습니다.")
						//$('body').append('<span style="color:blue;">NICE ID.</span>')
						$('#idchkMsg2').html('비밀번호가 일치합니다.');
						$('#idchkMsg2').css('color','green');
					} else {
						alert("비밀번호가 다릅니다.")
						//$('body').append('<span style="color:red;">INVALID ID.</span>')
						$('#idchkMsg2').html('비밀번호가 다릅니다.확인해주세요.');
						$('#idchkMsg2').css('color','red');
					}
					//$('body').append(data);
				}
			});
		
		});
	    
	    $('#user_Name').focusout(function() {	
			$('#idchkMsg3').html("");
			$.ajax({
				url : 'idcheck.jsp',
				type : 'post',
				data : {
					user_Name : $('#user_Name').val(),
				},
				success : function(data) {
					//alert(data);
					if (data == 'Y') {
						alert("실명확인이 완료되었습니다.")
						//$('body').append('<span style="color:blue;">NICE ID.</span>')
						$('#idchkMsg3').html('본인이 맞습니다.');
						$('#idchkMsg3').css('color','green');
					} else {
						alert("본인 인증에 실패하셨습니다.")
						//$('body').append('<span style="color:red;">INVALID ID.</span>')
						$('#idchkMsg3').html('본인 인증에 실패하셨습니다.');
						$('#idchkMsg3').css('color','red');
					}
					//$('body').append(data);
				}
			});
		
		});
	    
	    $('#user_Nic').focusout(function() {	
			$('#idchkMsg4').html("");
			$.ajax({
				url : 'idcheck.jsp',
				type : 'post',
				data : {
					user_Nic : $('#user_Nic').val(),
				},
				success : function(data) {
					//alert(data);
					if (data == 'Y') {
						alert("사용가능한 닉네임입니다.")
						//$('body').append('<span style="color:blue;">NICE ID.</span>')
						$('#idchkMsg4').html('멋진 닉네임입니다!');
						$('#idchkMsg4').css('color','green');
					} else {
						alert("사용할 수 없는 닉네임입니다.")
						//$('body').append('<span style="color:red;">INVALID ID.</span>')
						$('#idchkMsg4').html('사용 불가한 닉네임입니다.');
						$('#idchkMsg4').css('color','red');
					}
					//$('body').append(data);
				}
			});
		
		});
	    
	    $('#user_Email').focusout(function() {	
			$('#idchkMsg5').html("");
			$.ajax({
				url : 'idcheck.jsp',
				type : 'post',
				data : {
					user_Email : $('#user_Email').val(),
				},
				success : function(data) {
					//alert(data);
					if (data == 'Y') {
						alert("메일 인증이 완료되었습니다.")
						//$('body').append('<span style="color:blue;">NICE ID.</span>')
						$('#idchkMsg5').html('사용 가능한 이메일 입니다.');
						$('#idchkMsg5').css('color','green');
					} else {
						alert("메일 인증에 실패했습니다.")
						//$('body').append('<span style="color:red;">INVALID ID.</span>')
						$('#idchkMsg5').html('사용 불가한 이메일입니다.');
						$('#idchkMsg5').css('color','red');
					}
					//$('body').append(data);
				}
			});
		
		});
	    
	    
	    
	
	  });

	</script>
 	<div class="container">
		<!-- <h2>회 원 가 입</h2> -->
		<span style ="color: black; font-size: 60px; margin-left: 330px; font-family: 'Sunflower', sans-serif;">회원가입</span>
		<form action="joinProcess.jsp" method="post">
		   <fieldset style = "margin-left: 200px; margin-top: -20px;">
			  <!-- 	<legend style ="color: black; font-size: 60px; margin-left: 70px; font-family: 'Sunflower', sans-serif;">회원가입</legend> -->
			  
			  	<ul>
					<li text-align="center"><label for="user_ID">아이디</label> </li>
   	 				<li> <input type="text" id="user_ID" name="user_ID" placeholder="아이디를 입력해주세요." style="width:440px;padding:3px">
   	 				<button class="btn btn-primary" type="button" id="btn">중복체크</button></li>
   	 				<span id="idchkMsg"></span>
             	</ul>			
				<ul>
   					<li><label for="user_Pw">비밀번호</label></li>
   					<li> <input type = "password"  id="user_Pw" name="user_Pw" placeholder="비밀번호를 입력해주세요." maxlength="50" style="width:440px; padding:3px;"></li>
   					<span id="idchkMsg1"></span>
  				</ul>
				<ul>
   					<li><label for="user_rPw">비밀번호</label></li>
  					<li> <input type = "password"  id="user_rPw" name="user_rPw" placeholder="비밀번호를 확인합니다. 다시 입력해주세요."  maxlength="50" style="width:440px; padding:3px;"> </li>
  					<span id="idchkMsg2"></span>
 				</ul>
  				<ul>
  					 <li><label for="user_Name">이름</label></li>
   					 <li> <input type = "text"  id="user_Name" name="user_Name" placeholder="이름을 입력해주세요."  maxlength="50" style="width:440px; padding:3px;"> </li>
   					 <span id="idchkMsg3"></span>
 				</ul>
 				<ul>
  					 <li><label for="user_Nic">닉네임</label></li>
   					 <li> <input type = "text"  id="user_Nic" name="user_Nic" placeholder="닉네임을 입력해주세요."  maxlength="50" style="width:440px; padding:3px;"> </li>
   					 <span id="idchkMsg4"></span>
 				</ul>
				  	<!-- <li><label for="user_Gen">성별</label></li>
   					 <li> <input type = "radio" name = "user_Gen"/ checked> 남자
   						  <input type = "radio" name = "user_Gen"/> 여자 </li> -->
				<ul>
					<div class="form-group" style="text-align:center; margin:0 auto;">
					  <div class="btn-group" data-toggle="buttons" style="margin-left:-130px;">
   						<label class="btn btn-default active">
   							<input type="radio" name="user_Gen" autocomplete="off" value="남자" checked> 남자
   						</label>
   						<label class="btn btn-default">
   							<input type="radio" name="user_Gen" autocomplete="off" value="여자"> 여자
   						</label>
   				      </div>		  
   					</div>	  
 			    </ul>
				<ul>
   					 <li><label for="user_Email">이메일</label></li>
  					 <li><input type = "text" id="user_Email" name="user_Email" placeholder="이메일을 입력해주세요."  maxlength="50" style="width:440px; padding:3px;"></li>
  					 <span id="idchkMsg5"></span>
  				</ul>
				<ul>
  				   <li><label for="user_Memo">자기소개</label></li>
   				   <li><textarea cols = "60" rows = "10" id="user_Memo" name="user_Memo" placeholder="멋진 자기소개를 입력해보세요!" ></textarea></li>
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