<%@page import="member.UserInfo"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Enumeration<String> e = application.getAttributeNames();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/default.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
<style>
*{
margin: 0;
padding: 0;
}
.sumail {
	height: 25px;
	margin: 2px;
}

table {
	width: 80%;
	margin: 0 auto;
	border: 0;
	border-collapse: collapse;
}
td{
padding: 3px;
border: 1px solid #aaa;
}
table tr:first-child>td {
	text-align: center;
	background-color: #eee;
	font-weight: bold;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
	<!-- 해더 시작 -->
	<%@ include file="../frame/header.jsp"%>
	<!-- 해더 끝 -->

	<!-- 네비게이션 시작 -->
	<%@ include file="../frame/nav.jsp"%>
	<!-- 네비게이션 끝 -->

	<!-- 컨텐츠 시작 -->
	<div id="contents">
		<h3>회원리스트</h3>
		<hr>

		<table>
			<tr>
				<td>순번</td>
				<td>아이디</td>
				<td>이름</td>
				<td>비밀번호</td>
				<td>이미지</td>
				<td>관리</td>
			</tr>

			<%
			int cnt=0;
				while (e.hasMoreElements()) {

					String name = e.nextElement();
					Object obj = application.getAttribute(name);
					if (obj instanceof UserInfo) {
					/* 	out.println(name + ":" + obj + "<br>"); */
						UserInfo member = (UserInfo) obj;
			%>
			<tr>
				<td><%=++cnt %></td>
				<td><%=member.getuId()%></td>
				<td><%=member.getuName()%></td>
				<td><%=member.getuPw()%></td>
				<td><img class="sumail" alt="회원사진"
					src="../images/<%=member.getuPhoto()%>"></td>
				<td><a href="#">수정</a>|<a href="#">삭제</a></td>
			</tr>
			<%
				}
				}
			%>

		</table>

	</div>
	<!-- 컨텐츠 끝 -->


	<!-- 푸터 시작 -->
	<%@ include file="../frame/footer.jsp"%>
	<!-- 푸터 끝 -->







</body>
</html>