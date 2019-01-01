<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- scope.jsp 
사용자가 input.jsp에서 입력한 숫자값을 CountBean을
생성하여 setting한 뒤, getter로 가져와 출력한다
scope속성값을 page, session, application등으로 테스트해본다.
-->
<jsp:useBean id="cbean"  class="beans.scope.CountBean"
 scope="request"/> 
<jsp:setProperty name="cbean"  property="count"
 param="cnt" />
 
 <h1>scope2.jsp</h1>
 <h2 style="color:red">
<jsp:getProperty property="count" name="cbean"/> 
 </h2> 
 <%-- forward 방식으로 result2.jsp 페이지로 이동
 forward방식으로 이동하기 때문에 같은 request를 
 사용한다.
  --%>
  
  <%
  	request.setAttribute("msg", "반갑습니다.");
                       // key      value
  %>
  <%--
<jsp:forward page="result2.jsp"/>  
  --%>
  
  <%
  	response.sendRedirect("result2.jsp");
  %>