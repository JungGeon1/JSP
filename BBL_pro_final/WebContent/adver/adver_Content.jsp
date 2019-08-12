<%@page import="adver.model.Adver"%>
<%@page import="adver.service.GetContentService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String userID = null;
	String company_ID = null;
	if (session.getAttribute("userID") != null || session.getAttribute("company_ID") != null) {
		userID = (String) session.getAttribute("userID");
		company_ID = (String) session.getAttribute("company_ID");
	}
%>
<%
	int adverId = Integer.parseInt(request.getParameter("adverId"));

	GetContentService service = GetContentService.getInstance();

	Adver adver = service.getAdver(adverId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Monoton&display=swap"
	rel="stylesheet">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../js/bootstrap.js"></script>
<title>뿔레 사이트</title>
</head>
<body>
	<header>
		<img src="../img/fork.png"
			style="width: 40px; height: 40px; margin-left: 20px; margin-top: -10px;">
		<span
			style="color: black; font-size: 40px; margin-left: 20px; font-family: 'Sunflower', sans-serif;">뿔레</span>
	</header>
	<!-- 네비 시작 -->
	<nav class="navbar navbar-inverse">
		<div class="navbar-header">
			<a class="navbar-brand" href="#"></a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="../main.jsp">홈</a></li>
				<li><a href="#">공지사항</a></li>
				<li><a href="../BBL/BBL.jsp">뿔레?!</a></li>
				<li><a href="../tmi/tmiList.jsp">잡담게시판</a></li>
				<li><a href="adver_list.jsp">광고게시판</a></li>
			</ul>
			<%
				if (userID == null && company_ID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">뿔레 가입후에 더 많은 서비스를 즐겨주세요! <span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="../member/join.jsp">회원가입</a></li>
						<li><a href="../member/join_Com.jsp">사업자가입</a></li>
						<li><a href="../member/login.jsp">회원 로그인</a></li>
						<li><a href="../member/login_com.jsp">사업자 로그인</a></li>
						<li><a href="../member/logout.jsp">로그아웃</a></li>
					</ul></li>
			</ul>

			<%
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false"> 로그인중 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="../member/login.jsp">회원 로그인</a></li>
						<li><a href="../member/login_com.jsp">사업자 로그인</a></li>
						<li><a href="../member/logout.jsp">로그아웃</a></li>
					</ul></li>
			</ul>

			<%
				}
			%>

		</div>
	</nav>
	<!-- 네비 끝 -->

	<div class="container">
		<h1 class="display-4">개별 확인 게시판</h1>
		<hr>
		<div class="jumbotron">
			<div class="row">
				<div class="col-sm-6">
					<dt>
						No. <span><%=adver.getAdver_ID()%><span>
					</dt>
					<br>

					<dt>
						Date. <span><%=adver.getAdver_Date()%></span>
					</dt>
					<br>

					<dt>Title</dt>
					<p><%=adver.getAdver_Title()%></p>
					<dt>Content</dt>
					<p><%=adver.getAdver_Content()%></p>
				</div>
				<div class="col-sm-6">
					<img style="width: 100%; height: 350px;"
						src="../adver_upload/<%=adver.getAdver_Photo()%>">
				</div>
				<a href="deleteAdver.jsp?AdverId=<%=adver.getAdver_ID()%>">[삭제]</a>
				<!-- adverId는 confirmDeletion페이지에서 받을 id값이다. -->
				<a href="editAdver.jsp?AdverId=<%=adver.getAdver_ID()%>">[편집]</a>
			</div>
		</div>
	</div>

	<!-- 푸터 시작 -->
	<footer>
		<div>
			<p
				style="text-align: center; font-size: 12px; margin-top: 10px; opacity: 0.8">
				이용약관 | <span style="font-weight: 900;">개인정보처리방침 </span>| 책임의 한계와 |
				법적고지 | 회원정보 | 고객센터
			</p>
		</div>
	</footer>
	<!-- 푸터 끝 -->

</body>
</html>