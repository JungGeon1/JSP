<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
   // usebean 액션 태그 사용전 인코딩 변경해야 한글처리가능
    request.setCharacterEncoding("utf-8");
    %>
    <jsp:useBean id="userInfo" class="member.UserInfo"/>
    <!-- 생성된 객체에 데이터 바인딩 : 폼의 name 속성과 beans 클래스의 변수 이름이 동일해야한다 !!!!!  -->
    <jsp:setProperty property="*" name="userInfo"/>
    
    <%
    if(userInfo.getuPhoto()==null){
    	userInfo.setuPhoto("NoImage.png");
    }
    int resultcnt=0;
    //커네션 
    try{ Connection conn=null;

    PreparedStatement pstmt=null;

    //db로드
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");
   
   	String sql="insert into userinfo(idx,mid,mpw,mname,mphoto) values(userinfo_idx_seq.nextval,?,?,?,?)";
    pstmt=conn.prepareStatement(sql);
    pstmt.setString(1, userInfo.getuId());
    pstmt.setString(2, userInfo.getuPw());
    pstmt.setString(3, userInfo.getuName());
    pstmt.setString(4, userInfo.getuPhoto());
    resultcnt=pstmt.executeUpdate();
   
   }catch(ClassNotFoundException e){
	   e.printStackTrace();
   }catch(SQLException s){
	   s.printStackTrace();
   }
		
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
	

<!-- el표현식으로 변환 -->
	${userInfo.makeHtmlDiv()}<br>
	<%=resultcnt %>개의 행이 추가되었습니다	

</div>
<!-- 컨텐츠 끝 -->


<!-- 푸터 시작 -->
<%@ include file="../frame/footer.jsp" %>
<!-- 푸터 끝 -->

</body>
</html>