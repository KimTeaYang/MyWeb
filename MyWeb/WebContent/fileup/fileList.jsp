<%@page import="javax.swing.ImageIcon"%>
<%@page import="java.awt.image.SampleModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="java.io.*,java.util.*,java.text.*" %>
<jsp:include page="/top.jsp"/>

<div class="text-center">
	<h1>업로드 파일 목록</h1>
	<table class="table table-striped">
		<tr>
			<th width="15%" class="text-center">FILE/DIR</th>
			<th width="30%" class="text-center">파일명</th>
			<th width="20%" class="text-center">파일크기</th>
			<th width="20%" class="text-center">마지막수정일</th>
			<th width="15%" class="text-center">다운로드</th>
		</tr>
		<!-- --------------------- -->
		<% 
			//1. Upload디렉토리의 절대경로 얻기
			String upload = application.getRealPath("/Upload");
		
			//2. 절대경로를 가진 File 객체를 생성한다.
			File file = new File(upload);
			
			//3. File 클래스의 메소드를 통해 해당 디렉토리의 파일 목록을 얻어온다.
			File[] files = file.listFiles();
			
			if(files==null){
		%>
				<tr><td colspan="5"><h3>현재 파일 목록이 없습니다.</h3></td></tr>
			<%
			}else{
			//4. 반복문 돌면서 파일 목록의 파일 정보를 꺼내와 출력한다.
				for(File f:files){
					String str = f.isFile()?"FILE.PNG":"DIR.PNG";
					long time = f.lastModified();
					Date d = new Date(time);
					SimpleDateFormat sd 
						= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			%>
			<tr>
				<td>
					<img src="../images/<%=str%>">
				</td>
				<td><%=f.getName() %></td>
				<td><%=f.length() %>byte</td>
				<td><%=sd.format(d) %></td>
				<td><a href="javascript:fdown('<%=f.getName() %>')" 
				class="btn btn-default">다운로드</a></td>
			</tr>
			<% 
				}
			}
			%>
		<!-- --------------------- -->
	</table>
	<form name="fileF" action="../FileDown" method="post">
		<input type="hidden" name="fname">
	</form>
</div>
<script>
	function fdown(fname){
		fileF.fname.value=fname;
		fileF.submit();
	}
</script>

<jsp:include page="/foot.jsp"/>