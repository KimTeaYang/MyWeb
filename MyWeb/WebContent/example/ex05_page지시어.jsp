<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,java.sql.*"%>
<%@ page info="이 페이지에 대한 정보입니다."%>
<%@ page errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex05_page지시어.jsp</title>
</head>
<body>
	<h1>page 지시어(directive)</h1>
	<h1 style="color:red">
		<%=getServletInfo() %>
	</h1>
	<hr color="blue">
	<h1>page 지시어를 이용한 예외 처리 페이지 지정</h1>
	
	<%
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url="jdbc:oracle:thin:@localhost:1521:XE";
		String user = "scott";
		String pwd = "tiger";
		
		Connection con 
			= DriverManager.getConnection(url,user,pwd);
		out.println("<h2>연결 성공 : "+con+"</h2>");
		
		String str="null";
		out.println(str.toUpperCase()); // NullPointerException발생
		
		int a = 10/10; //ArithmeticException발생
		
		if(con!=null) con.close();
	%>
</body>
</html>