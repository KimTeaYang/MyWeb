<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp"/>

<div class="text-center">
	<h1>File Upload2</h1>
	
	<%
		/* 파일 업로드시 주의사항
			[1] method는 POST로 지정해야한다.
			[2] POST방식일 경우, 인코딩타입(ENCTYPE)이 2종류다.
			 <1> application/x-www-form-urlencoded [default]
			 <2> multipart/form-data
			 이 중에서 multipart/form-data로 지정해야 첨부파일 데이터가
			 서버에 함께 전송된다.(<1>번으로 설정되면 첨부파일명만 전송된다.)
		*/
	%>
	
	<form name="f" method="post" enctype="multipart/form-data" 
	action="fileUpload2.jsp">
		<table class="table">
			<tr>
				<th>올린이</th>
				<td>
					<input type="text" name="name" class="form-control">
				</td>
			</tr>
			<tr>
				<th>파일첨부</th>
				<td>
					<input type="file" name="filename" 
					class="form-control">
				</td>
			</tr>
			<tr>
				<td colspan="2" class="text-center">
					<button class="btn btn-success">Upload</button>
				</td>
			</tr>
		</table>
	</form>
</div>

<jsp:include page="/foot.jsp"/>