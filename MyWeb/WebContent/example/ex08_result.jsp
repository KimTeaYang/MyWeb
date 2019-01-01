<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp"/>

<div class="text-center">
	<h1>사용자가 입력한 값 받기</h1>
	<%
		//request 내장객체 : HttpServletRequest유형
		//1. 단일값 받아오기(userName, userPwd, userId, gender)
		String name = request.getParameter("userName");
		String pwd = request.getParameter("userPwd");
		String id = request.getParameter("userId");
		String gender = request.getParameter("gender");
		
		//2. 다중값 받아오기(hobby, lang)
		String[] hobby = request.getParameterValues("hobby");
		String[] lang = request.getParameterValues("lang");
		
		if(name==null||pwd==null||id==null||gender==null){
			response.sendRedirect("/MyWeb/example/ex08form.jsp");
			return;
		}
	%>
	<h3>이름:<%=name%></h3>
	<h3>비번:<%=pwd%></h3>
	<h3>아이디:<%=id%></h3>
	<h3>성별:<%=gender%></h3>
	<h3>취미:
	<%
		if(hobby!=null){
			for(String ho:hobby){
				out.println(ho+", ");
			}
		}
	%>
	</h3>
	<h3>사용언어:
	<%
		if(lang!=null){
			for(String la:lang){
				out.println(la+", ");
			}
		}
	%>
	</h3>
	
	
</div>

<jsp:include page="/foot.jsp"/>