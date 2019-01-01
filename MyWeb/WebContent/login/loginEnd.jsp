<%@ page import="user.model.LoginDAO,user.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="/login/errorAlert.jsp"%>

<%@ include file="/include/function.jsp" %>

<%	
	/* 
		1. 사용자가 입력한 아이디와 비번받기
		2. 유효성 체크
		3. LoginDAO 빈 생성
			loginCheck(userid, pwd)
			[1] 아이디와 비밀번호가 member테이블과 일치하는 경우
				=> 로그인 인증 처리 (session 사용)
			[2] 아이디가 존재하지 않는 경우
				=> 사용자정의 예외를 발생
			[3] 아이디는 존재하지만 비밀번호가 틀린 경우
				=> 사용자정의 예외를 발생
	*/
	
	String userid = request.getParameter("userid");
	String pwd = request.getParameter("pwd");
	
	// ID저장, 쿠키 이용=> 체크되면 On, 안되면 null
	String saveId = request.getParameter("saveId"); 
	
	if(userid==null||userid.trim().isEmpty()
			||pwd==null||pwd.trim().isEmpty()){
		goBack("잘못 들어온 경로입니다.", out);
		return;
	}
	
%>

<%-- 
<jsp:useBean id="conPool" class="jdbc.util.ConnectionPoolBean" 
scope="application" />
 --%>
<jsp:useBean id="loginDAO" class="user.model.LoginDAO" 
scope="session" />

<%-- 
<jsp:setProperty property="pool" name="loginDAO" 
value="<%=conPool %>" /> 
--%>

<%-- 
	ConnectionPoolBean conPool = new ConnectionPoolBean();
	LoginDAO loginDAO = new LoginDAO();
	loginDAO.setPool(conPool); 동일한코드
--%>

<%
	UserVO loginUser 
		= loginDAO.loginCheck(userid.trim(), pwd.trim());
	if(loginUser!=null){
		//로그인 인증을 받았다면
		//session에 로그인한 회원정보를 저장하자.
		//session : 내장객체 HttpSession 타입
		/*
			servlet에서 작성한다면 
			HttpSession session = request.getSession();
		*/
		session.setAttribute("loginUser", loginUser);
	
		//로그인한 시간
		java.util.Date loginTime = new java.util.Date();
		session.setAttribute("loginTime", loginTime);
		
		//아이디 저장에 체크했다면 => 쿠키 생성(사용자 아이디를 저장)
		Cookie ck = new Cookie("saveId",loginUser.getUserid());
		if(saveId!=null){
			ck.setMaxAge(7*24*60*60);
		}else{
			ck.setMaxAge(0);
		}
		ck.setPath("/");
		response.addCookie(ck);
	}
	response.sendRedirect("../index.jsp");
%>












