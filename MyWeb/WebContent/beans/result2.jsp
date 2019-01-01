<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<h1>result2.jsp페이지</h1>
<jsp:useBean id="cbean" class="beans.scope.CountBean"
scope="request"/> 
<h2 style="color:blue">
<jsp:getProperty property="count" name="cbean"/>
<%--out.println(cbean.getCount()); 과 동일 --%>
</h2>    
<%
	out.println(request.getAttribute("msg"));
%>
<a href="result3.jsp">result3.jsp로 이동</a>