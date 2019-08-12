<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	//JDBC_URL
	String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "scott";
	String pw = "tiger";
	try {
		//1.드라이버 로드
		//Class.forName("oracle.jdbc.driver.OracleDriver");
		//2.DB연결 : 컨넥션
		String jdbcDriver="jdbc:apache:commons:dbcp:pool";
		conn = DriverManager.getConnection(jdbcDriver);

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
	<h1>EMP LIST</h1>
	<hr>
	<table>
		<tr>
			<td>사원번호</td>
			<td>사원이름</td>
			<td>사원직급</td>
		</tr>
		<!-- 테이블행의반복시작 -->
		<%
		//3. Statement객체 생성
	
		
		stmt=conn.createStatement();
		//SQL->사원리스트를 구하기 위해서
		String sql="select * from emp01 order by ename";
		//4.SQL실행
		rs=stmt.executeQuery(sql);
		while(rs.next()){
		%>

		<tr>
			<td><%=rs.getInt(1) %></td>
	    	<td><a href="viewEmp.jsp?empno=<%= rs.getInt("empno")%>"><%= rs.getString("ename") %></a></td>
			<td><%=rs.getString("job") %></td>
		</tr>
		<%} %>
		<!-- 테이블 반복 끝 -->
	</table>
</body>
</html>
<%
	
	} catch (SQLException se) {
		se.printStackTrace();
	} finally {
		//6사용객체close
		if(rs!=null){
			try{
			rs.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}if(stmt!=null){
			try{
			stmt.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}if(conn!=null){
			try{
			conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
%>


