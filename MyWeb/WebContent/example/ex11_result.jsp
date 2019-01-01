<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp"/>

<div class="text-center">
	<h1>JSP lab 01-성적 처리 결과 페이지</h1>
	<%
		String num = request.getParameter("num");
		String java = request.getParameter("java");
		String db = request.getParameter("db");
		String jsp = request.getParameter("jsp");
		
		if(num==null){
	%>
		<script>
			alert('잘못 들어온 경로입니다.');
			location.href="ex11_input.jsp";
		</script>
	<%
			//response.sendRedirect("ex11_input.jsp");
			return;
		}
		
		int avg = (Integer.parseInt(java)+Integer.parseInt(db)+Integer.parseInt(jsp))/3;
	%>
	<script>
		function send(){
			//window.history.back();
			location.href='ex11_input.jsp';
		}
	</script>
	<table style="width: 80%;margin: auto;"
		 class="table table-bordered">
		<tr>
			<td colspan="2">사 번</td>
			<td><input name="num" readonly="readonly" type="text" class="table-control"
				value="<%=num %>"></td>
		</tr>
		<tr>
			<td rowspan="3">과 목</td>
			<td>JAVA</td>
			<td><input name="java" readonly="readonly" type="text" class="table-control" value="<%=java%>"></td>
		</tr>
		<tr>
			<td>Database</td>
			<td><input name="db" readonly="readonly" type="text" class="table-control" value="<%=db %>"></td>
		</tr>
		<tr>
			<td>JSP</td>
			<td><input name="jsp" readonly="readonly" type="text" class="table-control" value="<%=jsp %>"></td>
		</tr>
		<tr>
			<td colspan="2">평 균</td>
			<td><input name="avg" readonly="readonly" type="text" class="table-control" value="<%=avg %>"></td>
		</tr>
		<tr>
			<td colspan="3">
				<button type="button" onclick="send()">입력화면</button>
			</td>
		</tr>
	</table>
</div>

<jsp:include page="/foot.jsp"/>