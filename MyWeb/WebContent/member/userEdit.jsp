<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.*"%>
<jsp:include page="/top.jsp"/>

<%@ include file="/include/function.jsp" %>

<jsp:useBean id="userDAO" class="user.model.UserDAO" 
scope="session" />

<%
	String idxStr = request.getParameter("idx");
	
	if(idxStr==null||idxStr.trim().isEmpty()){
		goUrl("잘못 들어온 경로입니다.","userList.jsp",out);
		return;
	}
	
	int idx = Integer.parseInt(idxStr.trim());
	
	UserVO userVO = userDAO.selectUserByIdx(idx);
	
	if(userVO==null){
		goBack("존재하지 않는 회원입니다.",out);
		return;
	}
%>



<script type="text/javascript">

	//var win = null;
	
	function idCheck(){
		var url = 'idCheck.jsp';
		//if(win==null){
			win = window.open(url,'idCheck','width=400,height=400,left=100,top=100');
		//	win=null;
	//	}
	}
	
	function postCheck(){
		var url = 'postCheck.jsp';
		window.open(url,'postCheck','width=500,height=400,left=100,top=100');
	}
	
	function isUserpwd(obj){
	    var val = obj.value; // 비밀번호 입력값
	    var pattern = /^[\w]{4,8}$/;
	    var b = pattern.test(val);
	    return b;
	}
	
	function check(){
		if(!mf.name.value){
			alert('이름을 입력하세요');
			mf.name.focus();
			return false;
		}
		
		if(!mf.userid.value){
			alert('아이디를 입력하세요');
			mf.userid.focus();
			return false;
		}
		
		if(!mf.pwd.value){
			alert('비밀번호를 입력하세요');
			mf.pwd.focus();
			return false;
		}
		
		if(!isUserpwd(mf.pwd)){
			alert('비밀번호 형식에 맞게 작성해주세요');
			mf.pwd.focus();
			return false;
		}
		
		if(mf.pwd.value != mf.pwd2.value){
			alert('비밀번호가 달라요');
			mf.pwd2.select();
			return false;
		}
		
		if(!mf.hp1.value||!mf.hp2.value||!mf.hp3.value){
			alert('연락처를 모두 입력하세요');
			mf.hp1.focus();
			return false;
		}
		
		if(!mf.addr1.value||!mf.addr2.value){
			alert('주소를 입력하세요');
			mf.addr2.focus();
			return false;
		}
		
		return true;
	}
</script>

<div class="col-md-10 col-md-offset-1">
	<h1>Member Info Edit</h1>
	<form name="mf" action="userEditEnd.jsp" 
	method="post" onsubmit="return check()">
		<table class="table">
			<tr>
				<th width="20%">회원번호</th>
				<td width="80%">
					<input name="idx" value="<%=userVO.getIdx() %>" class="form-control"
					type="text" placeholder="회원번호" readonly>
				</td>
			</tr>
			<tr>
				<th width="20%">이름</th>
				<td width="80%">
					<input name="name" class="form-control" type="text" 
					placeholder="이름를 입력하세요" value="<%=userVO.getName() %>">
				</td>
			</tr>
			<tr>
				<th width="20%" style="vertical-align: middle">아이디</th>
				<td width="80%">
					<div style="padding-left: 0px" class="col-md-8">
					<input name="userid" class="form-control" 
					type="text" placeholder="아이디를 입력하세요" readonly
					value="<%=userVO.getUserid() %>">
					</div>
					<div class="col-md-2" style="padding-left: 0px">
					<button type="button" onclick="idCheck()" 
					class="btn btn-success">아이디 중복체크</button>
					</div>
				</td>
			</tr>
			<tr>
				<th width="20%" style="vertical-align: middle">비밀번호</th>
				<td width="80%">
				<input name="pwd" style="margin-bottom: 5px" 
				class="form-control" type="password" 
				placeholder="비밀번호를 입력하세요">
				<span class="text-info">* 비밀번호는 4자이상 8자 이내여야 해요</span>
				</td>
			</tr>
			<tr>
				<th width="20%" style="vertical-align: middle">비밀번호 확인</th>
				<td width="80%"><input name="pwd2" class="form-control" 
				type="password" placeholder="비밀번호를 다시 입력하세요"></td>
			</tr>
			<tr>
				<th width="20%" style="vertical-align: middle">이메일</th>
				<td width="80%"><input name="email" class="form-control" 
				type="email" placeholder="Email을 입력하세요"
				value="<%=userVO.getEmail() %>"></td>
			</tr>
			<tr>
				<th width="20%" style="vertical-align: middle">연락처</th>
				<td width="80%">
					<div class="col-md-2" style="padding-left: 0px">
					<input name="hp1" maxlength="3" value="<%=userVO.getHp1() %>"
					class="form-control" type="text" placeholder="HP1">
					</div>
					<div class="col-md-2" style="padding-left: 0px">
					<input name="hp2" maxlength="4" value="<%=userVO.getHp2() %>"
					class="form-control" type="text" placeholder="HP2">
					</div>
					<div class="col-md-2" style="padding-left: 0px">
					<input name="hp3" maxlength="4" value="<%=userVO.getHp3() %>"
					class="form-control" type="text" placeholder="HP3">
					</div>
				</td>
			</tr>
			<tr>
				<th width="20%" style="vertical-align: middle">우편번호</th>
				<td width="80%">
				<div style="padding-left: 0px" class="col-md-8">
					<input name="zipcode" maxlength="5" readonly 
					class="form-control" type="text" placeholder="우편번호"
					value="<%=userVO.getZipcode() %>">
					</div>
					<div class="col-md-2" style="padding-left: 0px">
					<button type="button" onclick="postCheck()" 
					class="btn btn-success">우편번호 찾기</button>
					</div>
				</td>
			</tr>
			<tr>
				<th width="20%" style="vertical-align: middle">주소</th>
				<td width="80%">
				<input name="addr1" class="form-control" type="text" 
				placeholder="주소1" value="<%=userVO.getAddr1() %>" readonly>
				<input name="addr2" style="margin-top: 10px" 
				class="form-control" type="text" placeholder="주소2"
				value="<%=userVO.getAddr2() %>">
				</td>
			</tr>
			<tr>
				<th width="20%">마일리지</th>
				<td width="80%">
					<input name="mileage" value="<%=userVO.getMileage() %>" class="form-control"
					type="text" readonly>
				</td>
			</tr>
			<tr>
				<th width="20%">회원상태</th>
				<td width="80%">
					<span class="label label-info" style="margin-right: 10px">
					<%=userVO.getMstateInfo() %></span>
					<%
						String chk0=null,chk1=null,chk2=null;
						if(userVO.getMstate()==0){
							chk0="checked";
						}else if(userVO.getMstate()==-1){
							chk1="checked";
						}else if(userVO.getMstate()==-2){
							chk2="checked";
						}
					%>
					<input name="mstate" value="0" class=""
					type="radio" <%=chk0 %>>일반회원
				
					<input name="mstate" value="-1" class="" 
					type="radio" <%=chk1 %>>정지회원
				
					<input name="mstate" value="-2" class=""
					type="radio" <%=chk2 %>>탈퇴회원
					
				</td>
			</tr>
			<tr class="text-center">
				<td colspan="2">
					<button type="submit" class="btn btn-primary">회원정보수정</button>
					<button class="btn btn-warning" type="reset">다시입력</button>
				</td>
			</tr>
		</table>
	</form>
</div>

<jsp:include page="/foot.jsp"/>