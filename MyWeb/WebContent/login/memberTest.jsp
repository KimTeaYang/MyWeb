<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp"/>

<!-- 로그인 체크 모듈을 include -->
<%@ include file="/login/loginCheckModule.jsp" %>
<!-- -------------------------- -->

<div class="text-center">
	<h1>회원 인증 페이지</h1>
	<h2>로그인한 회원만 들어올 수 있어요</h2>
	<h2 style='color:red'>
	<%=member.getName() %>[<%=member.getUserid() %>]님 환영합니다.
	</h2>
</div>

<jsp:include page="/foot.jsp"/>