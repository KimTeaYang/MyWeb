<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex07_include액션</title>
</head>
<body>
	<h1>다른 페이지를 include하는 방법</h1>
	<h2>[1] include지시어를 이용</h2>
	<h2>[2] include액션을 이용</h2>
	<hr color="red">
	<h1>ex07_include액션.jsp 페이지입니다.</h1>
	<h2>include액션 ex04_스크립트요소.jsp 페이지를 포함시킵니다.</h2>
	<p>
		include액션은 실행결과를 포함시키는 방식이다.
		jsp의 흐름을 ex04_스크립트요소.jsp페이지로 이동시켜 그 실행 결과물을 현재
		위치에 포함시킨다.
	</p>
	<hr color="blue">
	<jsp:include page="ex04_스크립트요소.jsp"></jsp:include>
	<%-- <%=plus(2,3) %> =>오류 발생함 --%>
</body>
</html>