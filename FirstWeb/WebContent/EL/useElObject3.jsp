<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setAttribute("name01", "requestDat");
	session.setAttribute("name01", "SessionData");
	application.setAttribute("name03", "applicattionData");
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
	<h3>
		<!--속성 영역은 생략 가능하다.  -->
		request영역의 name01:${name01}<br>
		<%-- 			<%=request.getAttribute("name01") %> --%>
		session영역의 name02:${name01}<br>
		<!--  t생략시 ㅅscope 생명주기순(페이지 리퀘스트 세션 어플리케이션)순으로 값을 찾아가서 이름 중복시 위의 경우 
		리퀘스트 값이 나온다-->
		 application 영역의 name 03:${name03}<br>
		 code 파라미터:${pram.code}<br>
		 code 파라미터: <%=request.getParameter("code") %>좋아해~~릴리리리리릴<br>
		 contextPath:${pageContext.request.contextPath }
         contextPath:<%=request.getContextPath() %><br>
         <a href="${pageContext.request.contextPath }">경로1 </a>   	
         <a href="<%=request.getContextPath() %>">경로2 </a> 
	</h3>
</body>
</html>