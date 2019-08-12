<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String empno = request.getParameter("empno");
	//int eno=Integer.parseInt(empno);
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	//JDBC_URL
	String jdbcUrl = "jdbc:oracle:thin:localhost:1521:orcl";
	String user = "scott";
	String pw = "tiger";
	try {
		//1.드라이버 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
		//2.DB연결 : 컨넥션
		conn = DriverManager.getConnection(jdbcUrl, user, pw);
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


	<%
		//3. Statement객체 생성

			stmt = conn.createStatement();
			//SQL->사원리스트를 구하기 위해서
			String sql = "select * from emp01 where empno=" + empno;
			//4.SQL실행
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
	%>

	<ul>
		<li>사원번호:<%=rs.getInt("empno")%></li>
		<li>사원이름:<%=rs.getString("ename")%></li>
		<li>사원직무:<%=rs.getString("job")%></li>
		<li>사원급여:<%=rs.getInt("sal")%></li>
	</ul>

	<%
		}
	%>

	<a href="empList.jsp">EMP LIST</a>
</body>
</html>
<%
	} catch (ClassNotFoundException ce) {
		ce.printStackTrace();
	} catch (SQLException se) {
		se.printStackTrace();
	} finally {
		//6사용객체close
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
%>


