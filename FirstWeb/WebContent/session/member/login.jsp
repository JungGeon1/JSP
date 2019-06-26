<%@page import="member.loginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 
    1. id/pw 데이터 받기
    2. id==pw 인증
    3. 세션에 사용자 데이터 저장    : 속성을 이용해서 저장
    4. 응답처리 :로그인되었습니다 or 로그인 실패
     -->
<%
	//사용자 요청에서 한글 처리
	request.setCharacterEncoding("utf-8");
	//1. id/pw데이터를 받기
	String id = request.getParameter("uId");
	String pw = request.getParameter("uPw");
	//2. id==pw인증
	boolean loginChk = false;
	//id 값과 pw 같은면 로기인 정상처리
	if (id != null && pw != null && id.equals(pw)) {
		//같을 떄 세션에 사용자 데이터 저장., loginChk=true;
		//session.setAttribute("loginId", id);
		loginInfo loginInfo = new loginInfo(id);
		session.setAttribute("loginInfo", loginInfo);
		loginChk = true;
	} else {
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style></style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
	<%
		if (loginChk) {
	%>
	<h1><%=id%>님이 로그인되었습니다
	</h1>
	<a href="loginCheck.jsp">loginCheck</a>
	<%
		} else {
	%>
	<script>
		alert("아이디 또는 비밀번호를 확인해 주세요");
		//location.href = 'loginForm.jsp';
		history.go(-1);
	</script>
	<%
		}
	%>
</body>
</html>