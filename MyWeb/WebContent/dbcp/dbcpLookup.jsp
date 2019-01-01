<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="java.sql.*,javax.sql.*,javax.naming.*"%>
<jsp:include page="/top.jsp"/>

<div class="text-center">
	<h1>DataSource Lookup하기</h1>
	
	<%
		/*  
			1. 커넥션을 얻는 방법
			 [1] DriverManger를 통해 얻는 방법 => JDBC
			 [2] DataSource를 통해 얻는 방법 
			  => WAS 서버(톰캣)에 설정되어 있는 데이터 소스를 통해 얻는다.
			  => WAS Resource 중 JNDI라는 참조 방식을 이용해 가져온다.
			     [참고] JNDI란?
			      - Java Naming Directory Interface
			           객체에 특정 이름을 주어 등록해놓고 해당 이름을 
			         lookup하여 찾는 방식을 메소드로 선언해놓은 인터페이스
			 - Resource를 JNDI로 찾기 위해 필요한 것이 
			 	javax.naming.IntialContext객체이다.
			 	(1) 먼저 WAS서버를 찾자
		*/
		Context ctx = new InitialContext();
		
		//(1)톰캣을 찾는다. => java:comp/env
		Context wasCtx = (Context)ctx.lookup("java:comp/env");
		
		//(2)server.xml에 등록한 DataSource를 찾는다.
		DataSource ds = (DataSource)wasCtx.lookup("oracle/myshop");
		
		//(3) Connection 얻기
		Connection con = ds.getConnection();
		out.println("DataSource ds: "+ds+"<br>");
		out.println("Connection con: "+con);
		
		//(4) close()하면 con을 종료하는 것이 아니라 DBCP에 반납을 한다.
		con.close();
	%>
</div>

<jsp:include page="/foot.jsp"/>