<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp"/>

<div class="text-left">
	<h1>File Upload Result</h1>
	<h2>request객체에 첨부되어 전송된 파일 데이터를 브라우저에 그대로 출력해보자</h2>
	<hr color="red">
	
	<%
		String name = request.getParameter("name");
		ServletInputStream in = request.getInputStream();
		
		byte[] data = new byte[1024];
		int n=0;
		
		out.println("<pre>");
		
		while((n=in.read(data))!=-1){
			String str = new String(data,0,n);
			out.println(str);
		}
		
		out.println("</pre>");
		in.close();
	%>
	
</div>

<jsp:include page="/foot.jsp"/>