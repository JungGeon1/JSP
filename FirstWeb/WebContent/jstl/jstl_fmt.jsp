<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<fmt:timeZone value="HongKong">
			<c:set var="now" value="<%=new java.util.Date()%>" />
			<fmt:formatDate value="${now}" type="date" dateStyle="full" />
			<fmt:formatDate value="${now}" type="date" dateStyle="short" />
			<br>
			<fmt:formatDate value="${now}" type="time" timeStyle="full" />
			<fmt:formatDate value="${now}" type="time" timeStyle="short" />
			<br>
			<fmt:formatDate value="${now}" type="both" />
			<br>
			<fmt:formatDate value="${now}" type="both" dateStyle="full" />
			<br>
			<fmt:formatDate value="${now}" pattern="yyyy.MM.dd HH:mm:ss" />
			<br>
		</fmt:timeZone>
		<c:forEach var="id"
			items="<%=java.util.TimeZone.getAvailableIDs()%>">
${id}<br />
		</c:forEach>

	</h3>


	<hr>
	<h3>
		<c:set var="price" value="100000" />
		<c:set var="pi" value="3.141592" />
		<fmt:formatNumber value="${price}" type="number" var="numberType"
			groupingUsed="true" />

		현재숫자:${numberType}<br> 통화:
		<fmt:formatNumber value="${price}" type="currency" currencySymbol="\\" />
		<br> %표현:
		<fmt:formatNumber value="${price}" type="percent" />
		/%표현:
		<fmt:formatNumber value="${pi}" type="percent" />
		<br> 패턴표현:
		<fmt:formatNumber value="${price}" pattern="00,000,000.00" />
		/패턴표현:
		<fmt:formatNumber value="${pi}" pattern="00,000,000.00" />
	</h3>
</body>
</html>