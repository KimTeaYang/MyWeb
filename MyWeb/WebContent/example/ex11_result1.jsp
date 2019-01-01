<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp"/>

<div class="text-center">
	<h1>주문 결과</h1>
	
	<%
		request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");
		String productS = request.getParameter("product");
		String num = request.getParameter("num");
		
		if(email==null||num==null||productS==null){
			%>
				<script>
					alert('잘못 들어온 경로입니다.');
					location.href="ex11_input1.jsp";
				</script>
			<%
				//response.sendRedirect("ex11_input1.jsp");
				return;
		}
		
		String[] product = productS.split("\\.");
	%>
	<table class="table table-bordered table-form" style="width: 50%;margin: auto;">
			<tr>
				<td>Email</td>
				<td><%=email%></td>
			</tr>
			<tr>
				<td>상품</td>
				<td><%=product[0]%></td>
			</tr>
			<tr>
				<td>수량</td>
				<td><%=num%></td>
			</tr>
			<tr>
				<td>주문금액</td>
				<td><%=Integer.parseInt(product[1])*Integer.parseInt(num) %></td>
			</tr>
			<tr>
				<td colspan="2"><button type="button" onclick="window.location.href='ex11_input1.jsp'">주문화면</button></td>
			</tr>
		</table>
</div>

<jsp:include page="/foot.jsp"/>