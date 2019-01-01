<%@page import="javax.swing.JOptionPane"%>
<%@ page contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>

<!doctype html>
<html>
<head><title>구구단</title></head>
<body>
<script>
	alter('안녕');
</script>
	<table style='background-color: black; border: 2px solid gold;
		 color:white; font-size: 16pt; width: 300px;'>
		<% 
		String danStr = JOptionPane.showInputDialog(this, "단을 입력");
		int dan = Integer.parseInt(danStr);
		%>
		<tr>
			<th><%=dan%>단</th>
		</tr>
		<%
			for(int i=1;i<10;i++){
		%>
			<tr><td style="padding:5px; text-align:center;">
			<%=dan %> * <%=i %> = <%=dan*i %></td></tr>
		<%
			}
		%>
	</table>
	<hr color='red'>
	<h1>구구단 전체 테이블 (2단 ~ 9단)</h1>
	<table style='border: 2px solid gold;width: 90%;margin:auto;'>
		<tr>
			<%
				for(int i=2;i<10;i++){
					%>
						<th style="padding:5px; text-align:center;
							background-color: pink;">
						<%=i%>단</th>
					<%
				}
			%>
		</tr>
		<% 
			for(int j=1;j<10;j++){
		%>
			<tr>
				<%
					for(int i=2;i<10;i++){
						%>
							<td style="padding:5px;text-align:center;">
							<%=i %> * <%=j %> = <%=i*j%></td>
						<%
					}
				%>
			</tr>
		<%
			}
		%>
	</table>
	<hr color='red'>
</body>
</html>