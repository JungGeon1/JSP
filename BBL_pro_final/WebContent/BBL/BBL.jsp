<%@page import="mainpage.model.MainPage"%>
<%@page import="mainpage.model.MainPageList"%>
<%@page import="mainpage.service.GetMainPageListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("utf-8");
%>

<%

	//여기 나중에 수정
	String id = (String)session.getAttribute("userID");
	//나중에 로그인중에만 글쓰기 가능하게

	int pageNumber = 1;
	
	//핵심처리할 서비스 객체
	GetMainPageListService service = GetMainPageListService.getInstance();
	//응답 데이터의 결과
	MainPageList dataList = service.getMainPageList(pageNumber++, 9);
	pageNumber++;
	int mainPageTotal = dataList.getMainpageTotalCount();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Monoton&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
<script src="../js/bootstrap.js"></script>
<link rel="stylesheet" href="../css/bootstrap.css"/>
<title>뿔레?!</title>
<style>
	.mainATag{
		text-decoration: none;
		display: inline-block;
	    font-size: 12px;
	    color:#130f40;
	    font-weight: bold;
	    margin-bottom: 5px;
	    vertical-align: middle;
	}
	.mainATag2{
		text-decoration: none;
		display: inline-block;
	    font-size: 12px;
	    color:#aaa69d;
	    font-weight: bold;
	    vertical-align: middle;
	}

	#mainList {
	    width: 960px;
	    margin: 0 auto;
	}
	#list {
	    float: left;
	    width: 100%;
	    height: auto;
	    margin: auto 0px;
	    
	}
	
	.thumbnail{
	    width: 130px;
	    height: 110px;
	    margin: 0;
	}
	
	ul {
	    list-style: none;
	    margin: 0px;
	    padding: 0px;
	}
	.posts {
	    float: left;
	    width: 100%;
	    height: auto;
	    border-bottom: 1px solid #e4e4e4;
	    font-size: 12px;
	}
	.stPosts{
		float: left;
	    padding: 12px 10px;
	    min-height: 90px;
	    width: 960px;
	}
	
	.posts-user{

	    font-weight: bold;
    	color: #494949;
    	margin-bottom: 15px;
    }
	.posts-text {
	    float: left;
	    width: 760px;
	    text-align: left;
	}
	.date{
		width: 760px;
		float: left;
	}
	.posts-title {
	    float: left;
	    width: 640px;
	    color: #00cdcd;
	    font-weight: bold;
	    
	}
	.posts-content {
	    overflow: hidden;
	    float: left;
	    width: 640px;
	    color: #000;
	    height: 35px;
	    margin-bottom: 5px;
	}
	.posts-photo {
	    overflow: hidden;
	    float: right;
	    width: 130px;
	
	}
	.posts-edit {
		margin-left:5px;
		display: inline-block;
	    width: auto;
	    height: auto;
	    color: #999;
	    font-size: 12px;
	}
	
	#top {
	    float: left;
	    width: 960px;
	    height: auto;
	    text-align: center;
	    margin: auto 0px;
	}
	#loading{
	 	float: left;
	    width: 960px;
	    height: auto;
	    text-align: center;
	    margin: auto 0px;
	}
	#loadimg{
		width:50px;
	    height: 50px;
	    margin-top:20px;
	    margin-bottom: 20px;
	}
	
</style>
</head>



<body>




<!-----------------------------------네비게이션 시작------------------------------------------------------------>
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
	  			<li class="active"><a href="BBL.jsp">뿔레?!</a></li>
	  			<li><a href="../tmi/tmiList.jsp">잡담게시판</a></li>
	  			<li><a href="#">광고게시판</a></li>	  			
	  		</ul>  		
	  		<%
	  			if(userID == null && company_ID == null){
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
	  			<li><a href="#" id="write">글쓰기</a></li>
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
<!-----------------------------------네비게이션 끝------------------------------------------------------------>






	<div id="mainList">
		
		<ul id="list">
			<li class="posts"></li>
			<% for(MainPage mainpage : dataList.getMainpageList()){ %>
				<li class="posts">
					<div class="stPosts">
						<div class="posts-text">
							<div class="posts-user">
								<%= mainpage.getUser_ID() %>
								<input type="hidden" value="<%= mainpage.getUser_ID() %>" id="authCheck">
								<div class="posts-edit ">
									<a id="del" class="mainATag2" href="BBLDelete.jsp?mainpageId=<%= mainpage.getMainpage_ID() %>" onclick="return confirm('삭제하시겠습니까?');">삭제</a>
									<a class="mainATag2" href="BBLEdit.jsp?mainpageId=<%= mainpage.getMainpage_ID() %>">편집</a>
								</div>
							</div>
							<div class="posts-content"><%if(mainpage.getMainpage_Content()!=null){if(mainpage.getMainpage_Content().length()>100){out.print(mainpage.getMainpage_Content().substring(0, 100)+"...");}else{out.print(mainpage.getMainpage_Content());}} %></div>
							<div class="posts-title"><a class="mainATag" href="BBLContent.jsp?mainpageId=<%= mainpage.getMainpage_ID() %>"><%= mainpage.getMainpage_Title() %></a></div>
							<div class="date"><%= mainpage.getMainpage_Date() %></div>
						</div>
						<div class="posts-photo">
							<img src='../mainpage_photo/<% if(mainpage.getMainpage_Photo()!=null){out.print(mainpage.getMainpage_Photo());}else{out.print("noImg.jpg");}%>' class="thumbnail">
						</div>
					</div>
				</li> 
			<% } %>
		</ul>
		
		<div id="loading">
			
		</div>
		
	</div>
	

</body>

<script>
	var pageNumber = <%=pageNumber%>;
	var check = true;
	var maxPage = <%= mainPageTotal/3+1 %>;
	var id = '<%=id%>';
	function getList(){
		check = false;
		$('#loading').append("<img src='../img/loading.gif' id='loadimg'>");
		
        	$.ajax({ 
        		url : 'BBLContents.jsp', 
        		type : 'GET', 
        		data :{ pageNum : ++pageNumber } ,
        		dataType : "html",
        		contentType : "html", 
        		success : function(data){
        			setTimeout(function(){
        				$('#list').append(data);
        				$('#loadimg').remove();
        				check = true;
        			},1000); 
        		},
    		});
	}
	
	
	$(document).ready(function(){
		
			$('#write').click(function(e){
				e.preventDefault();
				if(id=="null"){
					alert("권한이 없습니다.\n로그인 후 이용가능합니다.");
				}else{
					location.href = "writeBBL.jsp";
				}
			});
			
		
			$(window).scroll(function(){
	            let $window = $(this);
	            let scrollTop = $window.scrollTop();
	            let windowHeight = $window.height();
	            let documentHeight = $(document).height();
	            
	            //console.log("documentHeight:" + documentHeight + " | scrollTop:" + scrollTop + " | windowHeight: " + windowHeight );
	            
	            // scrollbar의 thumb가 바닥 전 30px까지 도달 하면 리스트를 가져온다.
	            if( scrollTop + windowHeight + 30 > documentHeight ){
		            if(check && maxPage>pageNumber){
		            	getList();
		            }
	            }

			});
			
			$('.mainATag2').click(function(){
				if($('#authCheck').val()!="<%=id%>"){
						alert("권한이 없습니다.");
						return false;
				}
			});
		
		
	});
	
</script>

</html>