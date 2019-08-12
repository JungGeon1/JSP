<%@page import="membermanager.service.GetListService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="member.UserInfo"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/*어플리케이션에 올라가있는 맵상태로 저장되어있는 키값들을 가져와서 이너머!레이션에 저장해준다. */
	 
	/*  저장된 레이션을 다시 어플리케이션의 올려준다 -> 사용하기위해*/
	GetListService service=new GetListService();
	List<UserInfo> list=service.gListService();

%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/default.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
<style>
* {
	margin: 0;
	padding: 0;
}

#main{
margin-top: 5%;
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
		<%if(list!=null){ %>
	<div id="main">
		<%for(UserInfo info: list ){%>
		
		idx:<%=info.getIdx() %><br>
		아이디: <%=info.getuId() %><br>
		비밀번호:<%=info.getuPw() %><br>
		이름:<%=info.getuName()%><br>
		사진:<%=info.getuPhoto()%><br>
		날짜:<%=info.getRegdate()%><br>
		
	<%	}
	}%>
		
	<h1>여기서부터는 for each</h1>
	</div>
		
<!-- 	private String idx;
	private String uId;
	private String uPw;
	private String uName;
	private String uPhoto;
	private Date regdate; -->
	<c:set var="list" value="<%=list %>"/>	
	<c:forEach items="${list}" var="user">
		<div>
		 ${user}<br>
		 idx: ${user.idx}<br> 
		 uId:${user.uId}<br>
		 uPw :${user.uPw}<br> 
		 uName :${user.uName}<br>
		 uPhoto :${user.uPhoto}<br>
		 date :${user.regdate}<br>
	
		</div>
	</c:forEach>
		
		
		

		<%-- <table>
			<tr>
				<td>순번</td>
				<td>아이디</td>
				<td>이름</td>
				<td>비밀번호</td>
				<td>가입일</td>
				<td>이미지</td>
				<td>관리</td>
			</tr>
			<!--여기 잊으면 클남.. 어플리케이션에올려놓은 레이션친구를 포이치로 뒤적뒤적한다 
       mId는 regfom2에서 아이들 키값으로 전체데이터를 저장하였으므로 mId에  @가 있어여함(처음 저장시 이메일 형식으로 받았음-->
			<c:forEach items="${mListName}" var="mId" varStatus="status">
				<!-- 아래에 있는 contains은 1번에 2번이 포함되면 트루를 반환해준다-->
				<c:if test="${fn:contains(mId,'@')}">
					<!--어플리케이션에서 바로참조할수없어서 [요기 안은 배열의 주소같은 개념]안에 넣어준다   -->
					<c:set var="mem" value="${applicationScope[mId]}" />
					<tr>
						<td>${status.count}</td>
						<td>${mem.uId}</td>
						<td>${mem.uName}</td>
						<td>${mem.uPw}</td>
						<td><fmt:formatDate value="${mem.regdate}"
								pattern="yyyy.MM.dd. H:mm" /></td>
						<td><img class="sumail" alt="회원사진"
							src="../images/${mem.uPhoto}"></td>
						<td><a href="#">수정</a>|<a href="#">삭제</a></td>
					</tr>
				</c:if>
			</c:forEach>
		</table> --%>

	</div>
	<!-- 컨텐츠 끝 -->


	<!-- 푸터 시작 -->
	<%@ include file="../frame/footer.jsp"%>
	<!-- 푸터 끝 -->







</body>
</html>