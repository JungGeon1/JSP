<%@page import="tmiService.WriteService"%>
<%@page import="tmi.Tmi"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="jdbc.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="tmi.TmiDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<%-- <jsp:useBean id="tmi" class="tmi.Tmi" /> --%>
<%-- <jsp:setProperty property="*" name="tmi" /> --%>
<%
	Tmi tmi = new Tmi();

//TmiDAO dao = TmiDAO.getInstance();
WriteService Service=WriteService.getInstance();

	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	if (isMultipart) {

		String fileName = "";
		String saveFileName = "";
		String uploadpath = "/uploadImg";
		String dir = request.getSession().getServletContext().getRealPath(uploadpath);
		String fullpath = "";

		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);

		List<FileItem> items = upload.parseRequest(request);

		Iterator<FileItem> itr = items.iterator();

		while (itr.hasNext()) {
	FileItem item = itr.next();
	if (item.getFieldName().equals("user_ID")) {
		tmi.setUser_ID(item.getString("utf-8"));
	}
	if (item.getFieldName().equals("tmi_Title")) {
		tmi.setTmi_Title(item.getString("utf-8"));
	}
	if (item.getFieldName().equals("tmi_Content")) {
		tmi.setTmi_Content(item.getString("utf-8"));
	}
	if (item.getFieldName().equals("tmi_Photo")) {
		if (item.getName().length()>0) {
			fileName = item.getName();
			saveFileName = System.nanoTime() + "_" + fileName;
			item.write(new File(dir, saveFileName));
			fullpath = "../uploadImg/" + saveFileName;

			tmi.setTmi_Photo(fullpath);
		}
	}

		}

	}
	int rcnt=Service.write(tmi);
	//int rcnt = dao.insert(tmi);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#contents{
	margin-left: 3%;
	padding-bottom: 2%;
}	#show{
	margin-left: 2%;
}#photo{
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
	  			<li class="active"><a href="tmi/tmiList.jsp">잡담게시판</a></li>
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
	<%-- <%=tmi.toString()%>
 --%>	
 	<div id="contents">
		<h4><%=tmi.getUser_ID()%>님이 작성한
			<%=rcnt%>개의 이야기가 추가되었어요!
		</h4>
	</div>
	<a id="show"  href="tmiList.jsp">게시글 보러가기</a>
	<img id="photo" src="../img/fork.png">

	
</body>
</html>