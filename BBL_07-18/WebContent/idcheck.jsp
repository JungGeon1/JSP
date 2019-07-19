<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	String user_ID = request.getParameter("user_ID");
	String user_Pw = request.getParameter("user_Pw");
	String user_Pw2 = request.getParameter("user_Pw2");
	String user_rPw = request.getParameter("user_rPw");
	String user_Name = request.getParameter("user_Name");
	String user_Nic = request.getParameter("user_Nic");
	String user_Email = request.getParameter("user_Email");
	//out.print(uId);
	
	//아이디체크
	if(user_ID!=null){
		if(!user_ID.equals("admin")){
			out.print("Y");
		} else {
			out.print("N");
		}
	}
	
	//비밀번호 체크
	if(user_Pw!=null){
		if(!user_Pw.equals("admin")){
			out.print("Y");
		} else {
			out.print("N");
		}
	}

	//비밀번호 다시 체크
	if(user_rPw!=null){
		if(user_rPw.equals(user_Pw2)){
			out.print("Y");
		} else {
			out.print("N");
		}
	}
	
	//실명확인
	if(user_Name!=null){
		if(!user_Name.equals("admin")){
			out.print("Y");
		} else {
			out.print("N");
		}
	}

	//닉네임체크
	if(user_Nic!=null){
		if(!user_Nic.equals("admin")){
			out.print("Y");
		} else {
			out.print("N");
		}
	}
	
	//이메일체크
	if(user_Email!=null){
		if(!user_Email.equals("admin")){
			out.print("Y");
		} else {
			out.print("N");
		}
	}
	
	
%>


