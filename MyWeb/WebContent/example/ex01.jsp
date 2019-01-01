<%@ page contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>
<%@ page import="java.util.*,java.text.*" %>

<!-- page지시어(directive) -->

<!-- 1. html 주석 -->

<h1>Hello JSP</h1>
<h2 style="color:red">처음해보는 JSP</h2>

<%-- 2. JSP 주석 --%>

<%
	//3. JAVA 단문 주석
	/* JAVA 복문 주석 
		Scriptlet태그 내에서는 자유자재로 자바코드를 쓸 수 있다.
	*/
	Date today = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	String str = today.toString();
	String str1 = sdf.format(today);
	//out: 내장객체(JspWriter 타입)
	out.println("<h1 style='color:blue'>"+str+"</h1>");
%>
<h1 style='color: maroon;'><%=str1%></h1>

<%! String str2 = "hello"; %>
<h1 style='color:purple;'><%=str2%></h1>

<%-- 
	<%= %> : 출력식
	자바변수나 메소드 반환값을 출력해준다. out.println() 과 동일한 효과
	
	이클립스에서 서블릿이 자동 생성 되는곳----
	C:\myjava\Workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\MyWeb\org\apache\jsp\example
 --%>
 