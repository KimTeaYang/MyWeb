<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.*" 
    errorPage="/example/error.jsp"%>
<!-- joinEnd.jsp -->

<%-- 
	1. 사용자가 입력한 값 받기 (10개)
	2. 유효성 체크(이름, 아이디, 비밀번호)
	3. 사용자가 입력한 값을 UserVO객체 생성해서 담아주기
	4. UserDAO 생성해서 createUser()메소드 호출하기
	5. 결과에 따라 메시지 처리후 페이지 이동하기
--%>

<%
	//request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String userid = request.getParameter("userid");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	String hp1 = request.getParameter("hp1");
	String hp2 = request.getParameter("hp2");
	String hp3 = request.getParameter("hp3");
	String zipcode = request.getParameter("zipcode");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	
	if(name==null||userid==null||pwd==null){
		response.sendRedirect("join.jsp");
		return;
	}
	
	UserVO userVO = new UserVO(name,userid,pwd,email,hp1,hp2,hp3,zipcode,addr1,addr2);
	UserDAO userDAO = new UserDAO();
	int n = userDAO.createUser(userVO);
	String msg = (n>0)?"회원가입 성공":"회원가입 실패";
	String loc = (n>0)?"../index.jsp":"javascript:history.back()";
	
%>
	<script>
		alert('<%=msg%>');
		location.href='<%=loc%>';
	</script>

