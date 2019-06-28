<%@page import="java.util.ArrayList"%>
<%@page import="member.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	List<Member> list = new ArrayList<Member>();

	list.add(new Member("홍길동11", "hong-1", "000-0000-0000"));
	list.add(new Member("홍길동12", "hong-1", null));
	list.add(new Member("홍길동13", "hong-1", "000-0000-0000"));
	list.add(new Member("홍길동14", "hong-1", "000-0000-0000"));
	list.add(new Member("홍길동15", "hong-1", "000-0000-0000"));
	list.add(new Member("홍길동16", "hong-1", null));
	list.add(new Member("홍길동17", "hong-1", null));
	list.add(new Member("홍길동18", "hong-1", "000-0000-0000"));
	list.add(new Member("홍길동19", "hong-1", "000-0000-0000"));
	list.add(new Member("홍길동20", "hong-1", "000-0000-0000"));

	application.setAttribute("members", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
span.nopnum {
	color: red;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>


	<c:url value="/member/list.jsp" var="uri_mList">
		<c:param name="pno">5</c:param>
	</c:url>
	<h3>단순출력:${uri_mList}</h3>
	<h3>
		링크연동1:<a href="${uri_mList}">회원리스트1</a>

	</h3>
	<h3>
		링크연동2:<a href='<c:url value="/member/list.jsp"/>'>회원리스트2</a>
	</h3>
	<hr>

	<c:set value="test" var="msg" />
	msg:${msg}
	<br>
	<c:if test="${msg eq 'test'}">
	msg의 문자열은 test와 같습니다
	</c:if>
	<br>
	<c:if test="${msg eq 'test'}" var="condition" />
	결과겂은:${condition}
	<hr>
	<!--여기값이 디폴트면 아래 디폴트시값을 그대로 읽업림 태ㅐ그 못읽음  -->
	<c:out value="${param.code}" escapeXml="flase">
		<span style="color: red">값이없다아아아아앙아아ㅏ</span>
	</c:out>
	<hr>
	<table>
		<tr>
			<td>index/count</td>
			<td>이름</td>
			<td>아이디</td>
			<td>전화번호ㄴ</td>
		</tr>
		<!-- var="member"->리스트속의 각각의 member객체를 ㅏㄱ리킴 -->
		<c:forEach items="${members}" var="member" varStatus="status"
			begin="0" end="5">


			<tr>
				<td>${status.index}/${status.count}</td>
				<td>${member.name}</td>
				<td>${member.id}</td>
				<td><c:out value="${member.pNum}" escapeXml="false">
						<span class="nopnum">폰번호없누~</span>
					</c:out></td>
			</tr>
		</c:forEach>
		<c:forTokens items="홍길동,010-8888-6666,의정부" delims="," var="sel">
		${sel}<br>
		</c:forTokens>

	</table>
</body>
</html>