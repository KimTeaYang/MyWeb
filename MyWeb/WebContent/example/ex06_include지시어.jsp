<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex06_include지시어</title>
</head>
<body>
	<h1>다른 페이지를 include하는 방법</h1>
	<h2>[1] include지시어를 이용</h2>
	<h2>[2] include액션을 이용</h2>
	<hr color="red">
	<h1>ex06_include지시어.jsp 페이지입니다.</h1>
	<h2>include지시어로 ex04_스크립트요소.jsp 페이지를 포함시킵니다.</h2>
	<p>
		include지시어는 다른 파일(ex04_스크립트요소.jsp)의 소스를 현재 위치
		(ex06_include지시어.jsp)에 삽입시킨 후, jsp를 서블릿 파일로 변환하고
		컴파일 하는 방식이다.
	</p>
	<hr color="blue">
	<%@ include file="ex04_스크립트요소.jsp" %>
	
	<hr color="green">
	<h2><%=str %></h2>
	<h2><%=var %></h2>
	<h2><%=plus(100,200) %></h2>
</body>
</html>