<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%
	String uId = request.getParameter("uId");
	String pId=request.getParameter("pId");
	if (!uId.equals("admin")&&pId.equals("3")) {
		out.print("Y");
	
		
	} else {
		out.print("N");
	}
%>