<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 공통모듈(function.jsp)를 include하자 -->

<%-- <jsp:include page="/include/function.jsp" /> 
실행결과를 포함시키므로 안됨 --%>

<%@ include file="/include/function.jsp" %>
<!-- 소스를 포함시킨다. -->

<!--  -->

<%
	String idxStr = request.getParameter("idx");

	if(idxStr==null){
		//response.sendRedirect("userList.jsp");
		goUrl("잘못 들어온 경로입니다.","userList.jsp",out);
		return;
	}
	int idx = Integer.parseInt(idxStr);
%>

<jsp:useBean id="userDAO" class="user.model.UserDAO"
 scope="session" />
<%
	int n = userDAO.managerUser(idx, -2);
	String msg = (n>0)?"삭제 성공":"삭제 실패";
	String loc = "userList.jsp";
	goUrl(msg, loc, out);
%>