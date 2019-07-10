<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% request.setCharacterEncoding("utf-8"); %>
    <jsp:useBean id="emp" class="emp.Emp"/>
    <jsp:setProperty property="*" name="emp"/>
    <% 
	
    out.print(emp);
    Connection conn=null;
  	PreparedStatement pstmt=null;
  	int resultCnt=0;
  
    try{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");
   
    String sql="insert into emp01(empno,ename,job) values(?,?,?)";
    pstmt=conn.prepareStatement(sql);
    
    pstmt.setInt(1, emp.getEmpno());
    pstmt.setString(2, emp.getEname());
    pstmt.setString(3, emp.getJob());
    
    resultCnt=pstmt.executeUpdate();
    
    }catch(ClassNotFoundException c){
    	c.printStackTrace();
    }catch(SQLException se){
    	se.printStackTrace();
    }finally{
    	
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
	<h1>사원  추가</h1>

	<h3> <%=resultCnt%>개 행이 입력 되었습니다. </h3>
	 	
	 <a href="empList.jsp">EMP LIST</a>

	

</body>
</html>