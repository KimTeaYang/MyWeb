<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
	
<h1>Hello JSP</h1>

<% 
	for(int i=0;i<5;i++){
		out.println("<h1 style='color:green'>Hello JSP</h1>");
	} 
%>
<hr color='red'>
<%
	for(int i=0;i<5;i++){
		out.println(i);
%>
	<h1 style='color:maroon'><%=i+1%> : 안녕 쟈스피~</h1>		
<%
	}
%>