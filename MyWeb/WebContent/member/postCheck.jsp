<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,user.model.*"%>
<% 
	String myctx=request.getContextPath();
	String is = request.getQueryString();
%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript"
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="<%=myctx %>/CSS/style.css" rel="stylesheet" type="text/css">

<%
	if(is==null){
%>
<h1 class="text-center">새 우편번호</h1>

<form name="doro" action="postCheck.jsp">
	<table class="table">
		<tr>
			<th class="text-center">지번/도로명</th>
			<td><input name="doro_kor" type="text" class="form-control"></td>
			<td><button class="btn btn-danger" type="button" onclick="send()">검색</button></td>
		</tr>
	</table>
</form>

<%
	}else{
%>
	<h1 class="text-center">새 우편번호</h1>

	<form name="doro" action="postCheck.jsp">
		<table class="table">
			<tr>
				<th class="text-center">지번/도로명</th>
				<td><input name="doro_kor" type="text" class="form-control"></td>
				<td><button class="btn btn-danger" type="button" onclick="send()">검색</button></td>
			</tr>
		</table>
	</form>

	<table class="table">
		<jsp:useBean id="postDAO" class="user.model.PostDAO" 
			scope="session" />
			<%
				String doro_kor = request.getParameter("doro_kor");
			
				ArrayList<PostVO> arr = postDAO.select(doro_kor);
				if(arr==null||arr.size()==0){
			%>
				<tr><td colspan="2">
				<b>서버 오류이거나 데이터가 없습니다.</b>
				</td></tr>
			<%
				}else{
			%>
				<tr><td colspan="2" class="text-center">주소</td></tr>
			<%
					for(PostVO postVO:arr){
			%>
					<tr> 
						<td width="75%"><%=postVO.getAllInfo()%></td>
						<td width="20%"><a href="#" onclick="setAddr('<%=postVO.getNew_post_code()%>','<%=postVO.getInfo()%>')">선택</a></td>
					</tr>
				<%
					}
				}
				%>
	</table>
<%
	}
%>
	<script>	
		function setAddr(zipcode,addr){
			window.opener.document.mf.zipcode.value=zipcode;
			window.opener.document.mf.addr1.value=addr;
			window.self.close();
		}
		
		function send(){
			if(!doro.doro_kor.value){
				alert('도로명을 입력하세요');
				doro.doro_kor.focus();
				return;
			}
			doro.submit();
		}
	</script>