<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//Logout처리=>session 변수를 무효화
	//[1] session에 저장된 특정변수(key)를 삭제한다.
	session.removeAttribute("loginUser");
	
	//[2] session에 저장된 모든 변수를 삭제한다. [권장]
	session.invalidate(); // 모든 세션 변수를 삭제한다.
	
	response.sendRedirect("../index.jsp");
%>