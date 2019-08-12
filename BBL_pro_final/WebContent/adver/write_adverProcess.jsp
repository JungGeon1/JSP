<%@page
	import="org.apache.commons.fileupload.FileUploadBase.InvalidContentTypeException"%>
<%@page import="adver.service.WriteAdverService"%>
<%@page import="adver.model.Adver"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String userID = null;
	String company_ID = null;
	if (session.getAttribute("userID") != null || session.getAttribute("company_ID") != null) {
		userID = (String) session.getAttribute("userID");
		company_ID = (String) session.getAttribute("company_ID");
	}
%>
<%
	try {

		Adver adver = new Adver();

		//session id 저장 필요
		String companyId = (String) session.getAttribute("company_ID");
		adver.setCompany_ID(companyId);

		String title = "";
		String content = "";
		String fileName = "";
		String saveFileName = "";
		long fileSize = 0;
		String Path = "/adver_upload";
		String dir = request.getSession().getServletContext().getRealPath(Path);

		//1. ismultipart/form-data의 여부 확인
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);

		//2. 메모리나 파일로 업로드 파일 보관하는 FileItem의 Factory 설정
		DiskFileItemFactory factory = new DiskFileItemFactory();

		//3. 업로드 요청을 처리하는 ServletFileUpload 생성
		ServletFileUpload upload = new ServletFileUpload(factory);

		//4. 업로드 요청 파싱해서 FileItem 목록 구함
		//FileItem <- 폼 페이지에서 전송한 데이터들, title, content, photo
		List<FileItem> items = upload.parseRequest(request);

		Iterator<FileItem> itr = items.iterator();

		//무한반복분 itr의 다음 항목이 있다면...
		while (itr.hasNext()) {

			FileItem item = itr.next();

			//5. FileItem이 폼 입력 항목인지 여부에 따라 알맞은 처리를 한다.
			if (item.isFormField()) {
				//type ="file"이 아닌 경우(텍스트 입력인 경우)
				//파일 이름
				if (item.getFieldName().equals("adver_Title")) {
					title = item.getString("utf-8");
					adver.setAdver_Title(title);
				}

				if (item.getFieldName().equals("adver_Content")) {
					content = item.getString("utf-8");
					adver.setAdver_Content(content);
				}
			} else {
				if (item.getFieldName().equals("adver_Photo")) {
					//type = "file"인 경우
					fileName = item.getName();
					fileSize = item.getSize();
					//saveFileName = System.nanoTime() + "_" + fileName;
					saveFileName = companyId + "_" + System.nanoTime() + "_" + fileName;
					adver.setAdver_Photo(saveFileName);
					item.write(new File(dir, saveFileName));

				}
			}
		}
		//adver.setCompany_ID((String)session.getAttribute("company_ID"));
		WriteAdverService service = WriteAdverService.getInstance();

		int cnt = service.write(adver);
		System.out.println(dir);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Monoton&display=swap"
	rel="stylesheet">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../js/bootstrap.js"></script>
<title>뿔레 사이트</title>
</head>
<body>
	<header>
		<img src="../img/fork.png"
			style="width: 40px; height: 40px; margin-left: 20px; margin-top: -10px;">
		<span
			style="color: black; font-size: 40px; margin-left: 20px; font-family: 'Sunflower', sans-serif;">뿔레</span>
	</header>
	<!-- 네비 시작 -->
	<nav class="navbar navbar-inverse">
		<div class="navbar-header">
			<a class="navbar-brand" href="#"></a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="../main.jsp">홈</a></li>
				<li><a href="#">공지사항</a></li>
				<li><a href="../BBL/BBL.jsp">뿔레?!</a></li>
				<li><a href="../tmi/tmiList.jsp">잡담게시판</a></li>
				<li><a href="adver_list.jsp">광고게시판</a></li>
			</ul>
			<%
				if (userID == null && company_ID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">뿔레 가입후에 더 많은 서비스를 즐겨주세요! <span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="../member/join.jsp">회원가입</a></li>
						<li><a href="../member/join_Com.jsp">사업자가입</a></li>
						<li><a href="../member/login.jsp">회원 로그인</a></li>
						<li><a href="../member/login_com.jsp">사업자 로그인</a></li>
						<li><a href="../member/logout.jsp">로그아웃</a></li>
					</ul></li>
			</ul>

			<%
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false"> 로그인중 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="../member/login.jsp">회원 로그인</a></li>
						<li><a href="../member/login_com.jsp">사업자 로그인</a></li>
						<li><a href="../member/logout.jsp">로그아웃</a></li>
					</ul></li>
			</ul>

			<%
				}
			%>

		</div>
	</nav>
	<!-- 네비 끝 -->

	<div class="container">
		<h1 class="display-4">광고 글 작성 처리 게시판</h1>
		<hr>
		<div>
			<%
				if (cnt > 0) {
			%>
			작성 성공했습니다. 곧 페이지 이동합니다.
			<%
				} else {
			%>
			작성 실패했어요. 곧 페이지 이동합니다.
			<%
				}
			%>
		</div>
	</div>

	<!-- 푸터 시작 -->
	<footer>
		<div>
			<p
				style="text-align: center; font-size: 12px; margin-top: 10px; opacity: 0.8">
				이용약관 | <span style="font-weight: 900;">개인정보처리방침 </span>| 책임의 한계와 |
				법적고지 | 회원정보 | 고객센터
			</p>
		</div>
	</footer>
	<!-- 푸터 끝 -->

	<script>
		$(document).ready(function() {
			setTimeout(function() {
				location.href = "adver_list.jsp";
			}, 3000);

		});
	</script>

</body>
</html>

<%
	} catch (InvalidContentTypeException e) {
		e.printStackTrace();
		response.sendRedirect("adver_list.jsp");
	}
%>