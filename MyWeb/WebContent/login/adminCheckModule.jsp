<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.*"%>

<%@ include file="/login/loginCheckModule.jsp" %>

<%
	if(!member.getUserid().equals("admin")){
		%>
			<script>
				alert('관리자만 이용가능합니다.');
				history.back();
			</script>
		<%
		return;
	}
%>