<%@page import="tmi.Tmi"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="jdbc.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="tmi.TmiDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<%-- <jsp:useBean id="tmi" class="tmi.Tmi" /> --%>
<%-- <jsp:setProperty property="*" name="tmi" /> --%>
<%
	Tmi tmi = new Tmi();

TmiDAO dao = TmiDAO.getInstance();

	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	if (isMultipart) {

		String fileName = "";
		String saveFileName = "";
		String uploadpath = "/uploadImg";
		String dir = request.getSession().getServletContext().getRealPath(uploadpath);
		String fullpath = "";

		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);

		List<FileItem> items = upload.parseRequest(request);

		Iterator<FileItem> itr = items.iterator();

		while (itr.hasNext()) {
	FileItem item = itr.next();
	if (item.getFieldName().equals("user_ID")) {
		tmi.setUser_ID(item.getString("utf-8"));
	}
	if (item.getFieldName().equals("tmi_Title")) {
		tmi.setTmi_Title(item.getString("utf-8"));
	}
	if (item.getFieldName().equals("tmi_Content")) {
		tmi.setTmi_Content(item.getString("utf-8"));
	}
	if (item.getFieldName().equals("tmi_Photo")) {
		if (item.getName().length()>0) {
			fileName = item.getName();
			saveFileName = System.nanoTime() + "_" + fileName;
			item.write(new File(dir, saveFileName));
			fullpath = "../uploadImg/" + saveFileName;

			tmi.setTmi_Photo(fullpath);
		}
	}

		}

	}

	int rcnt = dao.insert(tmi);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#contents{
	margin-left: 3%;
	padding-bottom: 2%;
}	#show{
	margin-left: 2%;
}

</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<meta name="viewport" content="width=device-width" initial-scale="1">
<link
	href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Orbitron&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<script src="../js/bootstrap.js"></script>
<body>
	<ul class="nav nav-tabs">
		<li role="presentation" class="active"><a href="main.jsp">Home</a></li>
		<li role="presentation"><a href="#">Notice</a></li>
		<li role="presentation"><a href="#">BBL</a></li>
		<li role="presentation"><a href="tmiList.jsp">TMI</a></li>
		<li role="presentation"><a href="#">Advertisement</a></li>
		<li role="presentation"><a href="join.jsp">Join</a></li>
		<li role="presentation"><a href="login.jsp">Login</a></li>
		<li role="presentation"><a href="#">Login.c</a></li>
		<li role="presentation"><a href="logout.jsp">Logout</a></li>
	</ul>
	<br>
	<%-- <%=tmi.toString()%>
 --%>	
 	<div id="contents">
		<h4><%=tmi.getUser_ID()%>님이 작성한
			<%=rcnt%>개의 게시글이 추가되었습니다.
		</h4>
	</div>
	<a id="show"  href="tmiList.jsp">게시글 보러가기</a>
</body>
</html>