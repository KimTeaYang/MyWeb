<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/include/function.jsp" %>

<%
	String  method = request.getMethod();
	if(!method.equalsIgnoreCase("post")){
		response.sendRedirect("userList.jsp");
		return;
	}
%>

<jsp:useBean id="userVO" class="user.model.UserVO" scope="page" />
<jsp:setProperty property="*" name="userVO"/>

<jsp:useBean id="userDAO" class="user.model.UserDAO"  
scope="session" />

<% 
	int n = userDAO.updateUser(userVO);
	String msg = (n>0)?"수정 완료":"수정 실패";
	String loc = (n>0)?"userList.jsp":"javascript:history.back()";
	
	goUrl(msg, loc, out);
%>