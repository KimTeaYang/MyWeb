<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.*"%>

<%
	//로그인 여부를 체크하는 모듈
	UserVO member = (UserVO)session.getAttribute("loginUser");
	
	if(member==null){
		%>
			<script>
				alert('로그인해야 이용 가능합니다.');
				history.back();
			</script>
		<%
		return;
	}
%>
