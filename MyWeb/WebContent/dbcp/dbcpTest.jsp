<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="java.sql.*,javax.sql.*,javax.naming.*"%>
<jsp:include page="/top.jsp"/>

<div class="text-center">
	<h1>DBCP Test</h1>
	<%
		Context initContext = new InitialContext();
		Context envContext  
			= (Context)initContext.lookup("java:/comp/env");
		DataSource ds 
			= (DataSource)envContext.lookup("oracle/myshop");
		Connection conn = ds.getConnection();
	%>
	<h2>DBCP 룩업 성공 - DataSource : <%=ds %></h2>
	<hr color='red'>
	<%
		Connection con = ds.getConnection();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from tab");
		out.println("<h3>myshop 계정의 테이블</h3>");
		while(rs.next()){
			String tname = rs.getString(1);
			String type = rs.getString(2);
			out.println("<h3>"+tname+" : "+type+"</h3>");
		}
		rs.close();
		st.close();
		con.close();
		//DBCP는 con을 반납하는 것이 아니라 close()를 하면 알아서 반납을 해준다.
	%>
</div>

<jsp:include page="/foot.jsp"/>