<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp"/>

<div class="text-center">
	<%
		int st = response.getStatus();
		if(st==400){
	%>
	<img src="../images/error400.png" class="img img-thumbnail">
	<%
		}else if(st==403){
	%>
	<img src="../images/error403.png" class="img img-thumbnail">
	<%
		}else if(st==404){
	%>
	<img src="../images/error404.png" class="img img-thumbnail">
	<%
		}
	%>
</div>

<jsp:include page="/foot.jsp"/>