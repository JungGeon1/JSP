<%@page import="jdbc.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="tmi.TmiDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%
	String uId = request.getParameter("uId");
	String tId = request.getParameter("tId");
	
	
	TmiDAO dao=TmiDAO.getInstance();
	boolean chkResult=dao.idchk(uId, tId);
	if (chkResult) {
		dao.deleteTmi(tId);
		out.print("Y");
	} else {
		out.print("N");
	}
%>