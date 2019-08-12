<%@page import="member.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <jsp:useBean id="loginInfo" class="member.UserInfo" scope="session" /> --%>

<%  LoginInfo loginInfo= (LoginInfo)session.getAttribute("loginInfo");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style></style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="../css/default.css" rel="stylesheet" type="text/css">
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
		<% 
	if(loginInfo!=null){
	%>
		<h3>회워정보 페이지</h3>
		${sessionScope.loginInfo}
		<hr>


		<img src="../images/${loginInfo.uPhoto}">
		<h4>                            <!-- el표현식으로 변환 -->                                
			이름:<%=loginInfo.getuName()%>/${sessionScope.loginInfo.uName}</h4>
		<h4>                               <!-- 변수 호출이아님! loginInfo.getName과 같다-->
			아이디:<%=loginInfo.getuId() %>/${sessionScope.loginInfo.uId}</h4>
		<%
	}else{
	%>

		<script>
			alert('로그인 후 이용가능한 페이지 입니다');
			location.href = 'login.jsp';
		</script>
<%
	}
%>


</div>
	<!-- 컨텐츠 끝 -->


	<!-- 푸터 시작 -->
	<%@ include file="../frame/footer.jsp"%>
	<!-- 푸터 끝 -->


</body>
</html>