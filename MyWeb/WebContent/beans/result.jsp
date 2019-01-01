<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="cbean" class="beans.scope.CountBean"
scope="session" />
<h1>result.jsp페이지</h1>
<h2 style="color:blue">
<jsp:getProperty property="count" name="cbean"/>
<%--out.println(cbean.getCount()); 과 동일 --%>
</h2>    