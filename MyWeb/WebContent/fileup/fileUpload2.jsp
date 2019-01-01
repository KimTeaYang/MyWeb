<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="com.oreilly.servlet.*,com.oreilly.servlet.multipart.*" %>
<jsp:include page="/top.jsp"/>

<div class="text-center">
	<h1>File Upload Result2</h1>
	<h2>Multipart Request를 이용한 파일 업로드</h2>
	<h3>Multipart Request 객체만 생성해도 파일 업로드가 된다.</h3>
	<%
		//1. 업로드할 경로
		//String upDir = "C:/myjava/Upload";
	
		//application 내장객체 : ServletContext타입
		//getRealPath()를 이용해서 서버의 웹애플리케이션의 절대경로 얻어온다.
		String upDir = application.getRealPath("/Upload");
		java.io.File dir = new java.io.File(upDir);
		if(!dir.exists()){
			dir.mkdirs(); // 디렉토리 생성
		}
		
		MultipartRequest mr = null;
		
		try{
			//동일한 파일명이 있을 경우 파일명에 인덱스 번호를 붙여준다.
			DefaultFileRenamePolicy df
				= new DefaultFileRenamePolicy();
			
			mr = new MultipartRequest(
					request,upDir,10*1024*1024,"UTF-8",df);
			//최대업로드 용량 : 10M
			out.println("<h2>업로드 성공</h2>");
			
		} catch(java.io.IOException e){
			out.println("<b style='color:red'>업로드 실패</b>: "+e.getMessage()+"<br>");
		}
		
		//올린이와 파일명을 알아내여 출력해보기
		/* MultipartRequest 사용 후에는 request를 보내기 때문에 
			MultipartRequest의 변수를 사용해야한다. */
		//String name = request.getParameter("name"); [x]
		String name = mr.getParameter("name");
		
		//첨부파일명은 getFilesystemName("파라미터명")으로 알아낸다.
		//String filename = mr.getParameter("filename"); [x]
		String filename = mr.getFilesystemName("filename");
		
		//업로드한 파일의 크기를 알아내기
		java.io.File file = mr.getFile("filename");
		long fizse = file.length();
		
		//파일의 컨텐트 타입 알아내기
		String ctype = mr.getContentType("filename");
	%>
	<h2>올린이:<%=name %></h2>
	<h2>업로드 디렉토리:<%=upDir %></h2>
	<h2>업로드 파일명:<%=filename %></h2>
	<h2>업로드 파일크기:<%=fizse %></h2>
	<h2>업로드 파일컨텐트타입:<%=ctype %></h2>
	<h3><a href="fileList.jsp">업로드 파일 목록 보러가기</a></h3>
</div>

<jsp:include page="/foot.jsp"/>