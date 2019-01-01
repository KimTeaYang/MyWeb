<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- scope.jsp 
사용자가 input.jsp에서 입력한 숫자값을 CountBean을
생성하여 setting한 뒤, getter로 가져와 출력한다
scope속성값을 page, session, application등으로 테스트해본다.
-->
 <jsp:useBean id="cbean" class="beans.scope.CountBean" 
 scope="session"/>
 <jsp:setProperty property="count" name="cbean" param="cnt" />
 
 <%-- 
 	CountBean cbean = new CountBean();
 	cbean.setCount(request.getParameter("count"));	
 --%>
 
 <h1>scope.jsp</h1>
 <h2 style="color:red">
 	<jsp:getProperty property="count" name="cbean"/>
 </h2>
 <a href="javascript:history.back()">이전페이지</a>|
 <a href="result.jsp">result.jsp페이지로</a>
 
 
 
 
 
 
 
 
 