<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%-- error.jsp 페이지에서는 page지시어에 반드시 isErrorPage라는 속성 값으로
	 true값을 주어야 한다. 그래야 exception이라는 내장객체를 사용할 수 있다. --%>
<%
	//Internet Explorer의 경우 아래 코드를 처리해야 에러 페이지를 보여줌.
	response.setStatus(response.SC_OK);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error.jsp</title>
</head>
<body>
	<table style="width: 60%;margin:auto;height: 300px;background-color: #efef">
		<tr>
			<%
				if(exception instanceof SQLException){
			%>
				<td style="color:red">
				<b> <%=exception.getMessage() %>
				</b>
				</td>
			<%
				}else if(exception instanceof NullPointerException){
			%>		
				<td style="color:blue">
				<b> <%=exception.getMessage() %>
					<% exception.printStackTrace(); %>
				</b>
				</td>
			<%	
				}else{
			%>
				<td style="color:orange">
				<b> <%=exception.getMessage() %>
					<% exception.printStackTrace(); %>
				</b>
				</td>
			<%
				}
			%>
			
		</tr>
	</table>
</body>
</html>