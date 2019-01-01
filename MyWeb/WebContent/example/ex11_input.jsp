<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp"/>

<div class="text-center">
	<h1>JSP lab 01-성적 입력 페이지</h1>
	<script>
		function check(){
			if(!f.num.value||f.num.value.trim()==''){
				alert('사번을 입력해주세요.');
				f.num.focus();
				return false;
			}
			
			if(isNaN(f.java.value)||isNaN(f.db.value)||isNaN(f.jsp.value)){
				alert('java, db, jsp는 숫자여야 해요');
				return false;
			}
			
			if(!f.java.value||f.java.value.trim()==''){
				f.java.value=0;
			}
			
			if(!f.db.value||f.db.value.trim()==''){
				f.db.value=0;
			}
			
			if(!f.jsp.value||f.jsp.value.trim()==''){
				f.jsp.value=0;
			}
			
			return true;
		}
		
	</script>
	<form class="form" name="f" action="ex11_result.jsp" onsubmit="return check()" method="post">
		<table style="width: 80%;margin: auto;"
		 class="table table-bordered">
		<tr>
			<td colspan="2" style="vertical-align: middle;">사 번</td>
			<td><input name="num" type="text" class="form-control"></td>
		</tr>
		<tr>
			<td rowspan="3" style="text-align: center;vertical-align: middle;">과 목</td>
			<td style="vertical-align: middle;">JAVA</td>
			<td><input name="java" type="text" class="form-control"></td>
		</tr>
		<tr>
			<td style="vertical-align: middle;">Database</td>
			<td><input name="db" type="text" class="form-control"></td>
		</tr>
		<tr>
			<td style="vertical-align: middle;">JSP</td>
			<td><input name="jsp" type="text" class="form-control"></td>
		</tr>
		<tr>
			<td colspan="3">
				<button type="submit">저장</button>
			</td>
		</tr>
		</table>
	</form>
</div>

<jsp:include page="/foot.jsp"/>