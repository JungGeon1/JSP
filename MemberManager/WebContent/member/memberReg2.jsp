<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
   // usebean 액션 태그 사용전 인코딩 변경해야 한글처리가능
    request.setCharacterEncoding("utf-8");
    %>
    <jsp:useBean id="userInfo" class="member.UserInfo"/>
    <jsp:setProperty property="*" name="userInfo"/>
    
    <%
    if(userInfo.getuPhoto()==null){
    	userInfo.setuPhoto("NoImage.png");
    }
    
    //내장객체에 회원정보를 저장
    application.setAttribute(userInfo.getuId(), userInfo);
    
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<style>
	.mInfor {
		border : 2px solid #ddd;
		box-shadow: 1px 1px 3px #EEE;
		padding : 10px;
	}
</style>
</head>
<body>

<!-- 해더 시작 -->
<%@ include file="../frame/header.jsp" %>
<!-- 해더 끝 -->

<!-- 네비게이션 시작 -->
<%@ include file="../frame/nav.jsp" %>
<!-- 네비게이션 끝 -->

<!-- 컨텐츠 시작 -->
<div id="contents">
	<h3>회원가입 페이지</h3>
	<hr>
	<%= userInfo.makeHtmlDiv() %>
</div>
<!-- 컨텐츠 끝 -->


<!-- 푸터 시작 -->
<%@ include file="../frame/footer.jsp" %>
<!-- 푸터 끝 -->

</body>
</html>