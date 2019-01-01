<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp"/>

<div class="">
	<h1>response 객체에 대해 살펴봅시다.</h1>
	<form action="ex10_response.jsp" name="f" role="form" 
	class="form-inline">
		아이디:<input type="text" name="uid" class="form-control" 
		placeholder="아이디를 입력하세요.">
		<button class="btn btn-success">전송</button>
	</form>
</div>

<jsp:include page="/foot.jsp"/>