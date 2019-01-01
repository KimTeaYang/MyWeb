<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.*" 
    errorPage="/example/error.jsp"%>
<!-- joinEnd.jsp -->
<%
	//request.setCharacterEncoding("UTF-8");
	String method = request.getMethod();
	
	if(!method.equalsIgnoreCase("post")){ // NULL 체크 방식
		response.sendRedirect("join.jsp");
		return;
	}
%>
<jsp:useBean id="userVO" class="user.model.UserVO" scope="page" />
<jsp:setProperty property="*" name="userVO"/>

<jsp:useBean id="userDAO" class="user.model.UserDAO" 
scope="session" />
<%
	int n = userDAO.createUser(userVO);
	String str = (n>0)?"회원가입 완료":"회원가입 실패";
	String loc = (n>0)?"../index.jsp":"javascript:history.back()";
%>
<script>
	alert('<%=str%>');
	location.href='<%=loc%>';
</script>



<%-- 
	<jsp:useBean id="userVO" class="user.model.UserVO" 
	scope="page" /> ==> UserVO userVO = new UserVO(); 과 동일하다.
	
	<jsp:setProperty property="*" name="userVO"/>
	==> user.setName(request.getParameter("name")); 과 동일
	
	id 값이 참조변수명이 된다.
	VO의 scope는 page
	DAO의 scope는 session으로 설정
 --%>
 