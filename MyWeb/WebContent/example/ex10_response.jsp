<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp"/>

<div class="">
	<h1>response 내장 객체: HttpServletResponse타입의 주요 메소드</h1>
	<%
		String id = request.getParameter("uid");
	
		if(id==null){
			response.sendRedirect("ex10_input.jsp");
			//(새로운 요청-request을 보내어 페이지를 이동시킨다.)
			return;
		}
		
		if(id.trim().isEmpty()){
			response.sendError(response.SC_BAD_REQUEST);
			return;
		}
		
		if(id.equalsIgnoreCase("killer")){
			response.sendError(response.SC_FORBIDDEN);//403
			return;
		}
	%>
	<h2 style="color:blue"><%=id %>님 환영합니다.</h2>
</div>

<jsp:include page="/foot.jsp"/>