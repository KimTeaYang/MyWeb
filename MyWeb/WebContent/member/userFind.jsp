<%@ page import="user.model.*,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<jsp:include page="/top.jsp"/>
<%@ include file="/include/function.jsp" %>

<script type="text/javascript">
	var check = function(){
		
		if(sf.findType.value==0){
			alert('검색 유형을 선택하세요');
			sf.findType.focus();
			return;
		}
		
		if(sf.findType.value==4){
			//회원유형(mstate)을 선택했을 때 (라디오버튼)
			if(!sf.mstate.value){
				alert('검색할 회원 유형을 선택하세요');
				return;
			}
		}else{
			if(!sf.keyword.value){
				alert('검색어를 입력하세요');
				sf.keyword.focus();
				return;
			}			
		}
		
		sf.submit();
	}
	
	var change = function(val){
		var obj1=document.getElementById('input');
		var obj2=document.getElementById('radio');
		
		if(val==4){
			//회원유형(mstate)을 선택했을 때 (라디오버튼)
			
			obj2.style.display='';
			obj1.style.display='none';
			sf.keyword.disabled='disabled';
			for(var i=0;i<sf.mstate.length;i++){
				sf.mstate[i].disabled='';
			}
		}else{
			obj2.style.display='none';
			obj1.style.display='';
			sf.keyword.disabled='';
			for(var i=0;i<sf.mstate.length;i++){
				sf.mstate[i].disabled='disabled';
			}
		}
	}
</script>

<%
	String findType = request.getParameter("findType");
	String keyword = request.getParameter("keyword");
	String mstate = request.getParameter("mstate");
	
	if(findType.equals("0")){
		goUrl("검색유형을 선택해주세요.", "userList.jsp", out);
		return;
	}
	
	if((keyword==null||keyword.trim().isEmpty())&&
			(mstate==null||mstate.trim().isEmpty())){
		goUrl("검색어를 입력해주세요.", "userList.jsp", out);
		return;
	}
	
	if(mstate!=null){
		keyword=(Integer.parseInt(mstate)==0)?"일반 회원":
			(Integer.parseInt(mstate)==-1)?"정지 회원":"탈퇴 회원";
	}
%>

<div class="col-md-12">
	<h1 class="text-center text-primary">userFind Page</h1>
	<h2 class="text-danger text-center">검색어: <%=keyword %></h2>
	<div class="row" style="margin-top: 30px">
			<!-- 검색 form 시작 -->
			<form name="sf" action="userFind.jsp" 
			class="form-horizontal text-center" method="get">
			<div class="col-md-2 col-md-offset-1">
				<select onchange="change(this.value)" name="findType"
				 class="form-control">
					<option value="0">::검색유형::</option>
					<option value="1" selected>이름</option>
					<option value="2">아이디</option>
					<option value="3">연락처</option>
					<option value="4">회원상태</option>
				</select>
			</div>
			<div class="col-md-6" id="input">
				<input type="text" name="keyword" 
				placeholder="검색어를 입력하세요" class="form-control">
			</div>
			<div class="col-md-6" id="radio" style="display: none;">
				<input type="radio" name="mstate" value="0">일반회원
				<input type="radio" name="mstate" value="-1">정지회원
				<input type="radio" name="mstate" value="-2">탈퇴회원
			</div>
			<div class="col-md-2">
				<button type="button" onclick="check()" 
				class="btn btn-info">검색</button>
			</div>
			</form>
			<!-- 검색 form 종료 -->
	</div>
	
	<table class="table table-striped" style="margin-top: 40px;">
		<thead>
			<tr class="bg-info">
				<th width="10%">번호</th>
				<th width="15%">이름</th>
				<th width="10%">아이디</th>
				<th width="15%">연락처</th>
				<th width="15%">이메일</th>
				<th width="10%">가입일</th>
				<th width="15%">회원상태</th>
				<th width="10%">수정|삭제</th>
			</tr>
		</thead>
		<tbody>
			<jsp:useBean id="userDAO" class="user.model.UserDAO" 
			scope="session" />
			<%
				ArrayList<UserVO> arr 
					= userDAO.findUser(findType,keyword,mstate);
				if(arr==null||arr.size()==0){
			%>
				<tr><td colspan="8">
				<b>서버 오류이거나 데이터가 없습니다.</b>
				</td></tr>
			<%
				}else{
					for(UserVO userVO:arr){
			%>
					<tr> 
						<td><%=userVO.getIdx() %></td>
						<td><%=userVO.getName() %></td>
						<td><%=userVO.getUserid() %></td>
						<td><%=userVO.getAllHp() %></td>
						<td><%=userVO.getEmail() %></td>
						<td><%=userVO.getIndate() %></td>
						<td><%=userVO.getMstateInfo() %></td>
						<td>
							<a href="#" onclick="goEdit('<%=userVO.getIdx()%>')">수정</a>|
							<a href="#" onclick="goDel('<%=userVO.getIdx()%>')">삭제</a>
						</td>
					</tr>
				<%
					}
				}
				%>
		</tbody>
	</table>
	
	<!-- 회원정보 수정 또는 삭제 처리 form -->
	<form name="uf" method="post">
		<input type="hidden" name="idx">
	</form>
	
</div>


<script>
	goEdit = function(idx){
		uf.idx.value = idx;
		uf.action = "userEdit.jsp";
		uf.submit();
	}

	goDel = function(idx){
		var yn = confirm(idx+'번 회원정보를 정말 삭제할까요?');
		if(yn){
			//삭제 처리
			//location.href="userDelete.jsp?idx="+idx;
			uf.idx.value=idx;
			uf.action = "userDelete.jsp";
			uf.submit();
		}
	}
</script>

<jsp:include page="/foot.jsp"/>