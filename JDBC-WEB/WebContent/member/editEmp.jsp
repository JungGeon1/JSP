<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String empno = request.getParameter("empno");
	String ename = request.getParameter("ename");
	//여기서 empno가 다릅값이 들오면 에러발생각능 
	int enm = Integer.parseInt(empno);

	Connection conn = null;
	PreparedStatement pstmt = null;
	int resultCnt = 0;
	//1. 데이터베이스 로드
	try {
		Class.forName("oracle.jdbc.driver.OracelDriver");
		//2. 데이터베이스 연결
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "scott", "tiger");
		//3. PreparedStatement 생성
		//사용자 정보 업데이트를 위한 SQL 작성
		String sql = "update emp01 set ename=? where empno=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, ename);
		pstmt.setInt(2, enm);
		//4. SQL 실행
		resultCnt = pstmt.executeUpdate();
		//5. 실행결과 : 수정되었습니다/.
	} catch (ClassNotFoundException cs) {
		cs.printStackTrace();
	} catch (SQLException se) {
		se.printStackTrace();
	} finally {
		//6. 객체close 
		if (pstmt != null) {

			try {
				pstmt.close();
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style></style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
	<h1>사원 정보 수정</h1>
	<h3><%=resultCnt%>의 행이 처리(수정)되었습니다</h3>
	
</body>
</html>