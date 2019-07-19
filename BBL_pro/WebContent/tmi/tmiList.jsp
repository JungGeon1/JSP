<%@page import="tmi.Tmi"%>
<%@page import="java.util.List"%>
<%@page import="tmi.TmiDAO"%>
<%@page import="jdbc.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	request.setCharacterEncoding("utf-8");

	TmiDAO dao = TmiDAO.getInstance();

	List<Tmi> list = null;
	list = dao.tmiList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* div {
	margin: 20px;
} */

img {
	width: 500px;
	margin-left: 30px;
	display: block;
}



#make {
	margin-left: 2%;
	font-size: 1.3em;

}
#contents {
	margin-left: 3%;
	width: 40%;
	
}

#main {
	margin-top: 3%;
	border-bottom: 1px #ddd solid;
}

span {
	font-size: 1.2em;
	font-weight: 200;
	padding-right: 5px;
}

#photo{

	overflow: hidden;
	position:absolute;
 	bottom: 70px;
 	top:70px;
    right: 80px;
    width: 700px;
 
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
	<ul class="nav nav-tabs">
		<li role="presentation" class="active"><a href="main.jsp">Home</a></li>
		<li role="presentation"><a href="#">Notice</a></li>
		<li role="presentation"><a href="#">BBL</a></li>
		<li role="presentation"><a href="tmiList.jsp">TMI</a></li>
		<li role="presentation"><a href="#">Advertisement</a></li>
		<li role="presentation"><a href="join.jsp">Join</a></li>
		<li role="presentation"><a href="login.jsp">Login</a></li>
		<li role="presentation"><a href="#">Login.c</a></li>
		<li role="presentation"><a href="logout.jsp">Logout</a></li>
	</ul>
	<br>
	<a href="tmiForm.jsp" id="make">게시글을 작성해 볼까요?</a>
	<div id="contents">
		<%
			if (list.isEmpty()) {
		%>
		<div>
			<h3>
				아직 아무도 글을 남기지 않았어요<br>첫번째 글을 남겨보세요
			</h3>
		</div>

		<%
			} else {
		%>
		<h2><%=dao.totalTmi()%>개의 글이 떠돌고 있어요!
		</h2>
		<%
			for (Tmi tmi : list) {
		%>
		<div id="main">
			<div>
				<span>글번호:</span><%=tmi.getTmi_ID()%><br> <span>작성자:</span><%=tmi.getUser_ID()%><br>
				<span>날 짜:</span><%=tmi.getTmi_Date()%><br> <span>제 목:</span><%=tmi.getTmi_Title()%><br>
				<span>내 용:</span><%=tmi.getTmi_Content()%><br>
				<%
					if (tmi.getTmi_Photo() != null) {
				%>
				TMI: <br> <img src="<%=tmi.getTmi_Photo()%>"> <br>
			</div>
			<%
				}
			%>
			<a href="updateForm.jsp?tmi_ID=<%=tmi.getTmi_ID()%>" id="delete">새로운
				기억이 떠올랐어요!</a> <br>
			<a href="deleteForm.jsp?tmi_ID=<%=tmi.getTmi_ID()%>" id="delete">이
				글이 보기 싫어요..</a>
		</div>

		<%
				}
			}
		%>
	
	</div>
	<div id="photoBox">
		<img id="photo" src="../img/gu">
	</div>
	
</body>

</html>