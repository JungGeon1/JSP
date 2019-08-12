<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.UploadContext"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String name = "";
	String sNum = "";
	String fileName = "";
	String saveFileName = "";
	long fileSize = 0;
	String uploadpath = "/upload";
	String dir = request.getSession().getServletContext().getRealPath(uploadpath);
	String fullpath ="";
	// 1. multipart/form-data 여부 확인
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	
	if (isMultipart) {
		// 2. 메모리나 파일로 업로드 파일 보관하는 FileItem의 Factory 설정
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 3. 업로드 요청을 처리하는 ServletFileUpload 생성
		ServletFileUpload upload = new ServletFileUpload(factory);

		// 4. 업로드 요청 파싱해서 FileItem 목록 구함
		//FileItem<-폼페이지에서 전송한 데이터들을 가져온다, uName,sNumber,report
		List<FileItem> items = upload.parseRequest(request);

		Iterator<FileItem> itr = items.iterator();

		while (itr.hasNext()) {
			FileItem item = itr.next();
			if (item.isFormField()) {
				//type="file"이 아닌경
				if (item.getFieldName().equals("uName")) {
					name = item.getString("utf-8");

				}
				if (item.getFieldName().equals("sNumber")) {
					sNum = item.getString("utf-8");

				}
			} else {

				//type="file"인 경우
				if (item.getFieldName().equals("report")) {

					fileName = item.getName();
					fileSize = item.getSize();
					//saveFileName=System.currentTimeMillis()+"_"+fileName;
					saveFileName = System.nanoTime() + "_" + fileName;
					item.write(new File(dir, saveFileName));
					//아래것도 가능 이름만 바뀔뿐
					//item.write(new File(dir, fileName));
					fullpath = "../upload/"+saveFileName; 
				}
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
	<h1>
		 이름:<%=name%><br> 학번:<%=sNum%><br> 리포트파일:<%=fileName%>(<%=fileSize%>)<br>
		 저장파일이름:<%=saveFileName%><br>
		 저장폴더:<%=dir%><br>
		 풀패쓰:<%=fullpath %>
	</h1>
	 사진:<img src="<%=fullpath%>" width="150">

</body>
</html>