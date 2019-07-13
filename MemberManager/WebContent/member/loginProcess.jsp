<%@page import="membermanager.dao.MemeberDao"%>
<%@page import="jdbc.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="member.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<style>
</style>
</head>
<body>
	<%
		String userId = request.getParameter("uId");
		String userPW = request.getParameter("uPw");

		boolean loginchk = false;
		/*1사용자가 입룍한 idㄹ 회워정보 검색
		2존재한다: 해당객체를 받는다.
			해당 객체의 pw와 사용자가 입력pw 비교
			같다면 - 로그인 처리: 세션영역에 회원 정보를 저장
			틀리다- 오류 메세지 전달-> 로그인 페이지로 이동
		3 존재하지 않는다: 오류 메세지 전달-> 로그인 페이지로 이동	*/

		/* if (userId != null && userPW != null && userId.equals("admin") && userPW.equals("admin")) {
		
			response.sendRedirect(request.getContextPath()); // /mm
		} */
		Connection conn=null;
		conn=ConnectionProvider.getConnection();
		MemeberDao dao=MemeberDao.getInstance();
		
		
		UserInfo userInfo = dao.Select(conn, userId);

		if (userInfo != null && userInfo.getuPw().equals(userPW)) {
			//회원정보가존재&&비밀번호가 일치
			//세션에 회원 로그인 정보를 저장
			session.setAttribute("loginInfo", userInfo.toLoginInfo());

			//로그인 처리 후 메인페이지로 이동
			response.sendRedirect(request.getContextPath());
		} else {
			//id검색결과가 null 도는 비교에서 같지않은경우
	%>
	<script>
	alert('아이디 혹은 비밀번호가 틀립니다.\n다시로그인해주세요');
	history.go(-1);
	</script>
	
	<%
		}
	%>

	<!-- 해더 시작 -->
	<%@ include file="../frame/header.jsp"%>
	<!-- 해더 끝 -->

	<!-- 네비게이션 시작 -->
	<%@ include file="../frame/nav.jsp"%>
	<!-- 네비게이션 끝 -->

	<!-- 컨텐츠 시작 -->
	<div id="contents">
		<h3>로그인 요청 처리 페이지</h3>
		<hr>

		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uId" value="<%=userId%>">
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="uPW" value="<%=userPW%>">
				</td>
			</tr>
			<tr>
				<td></td>
				<td></td>
			</tr>
		</table>

	</div>
	<!-- 컨텐츠 끝 -->


	<!-- 푸터 시작 -->
	<%@ include file="../frame/footer.jsp"%>
	<!-- 푸터 끝 -->


	<%-- <jsp:useBean id="loginInfo" class="member.UserInfo" scope="session" />
	<jsp:setProperty property="uId" name="loginInfo" value="<%=userId%>" /> --%>
	<%-- <%
		loginInfo.setuPw(userPW);
	%>
 --%>






</body>
</html>