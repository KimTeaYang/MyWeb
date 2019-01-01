<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04_스크립트요소.jsp</title>
</head>
<body>
	<h1>Scripting Element - 스크립트 요소</h1>
	<h2>[1] 선언문(declaration) : 멤버변수 선언, 메소드를 구성</h2>
	<h2>[2] 실행문(scriptlet) : 자바코드 영역. 여기서 선언된 변수는 지역변수</h2>
	<h2>[3] 출력식(expression) : 변수나 메소드 반환값을 출력</h2>
	
	<%!
		//선언문
		String str = "나는 멤버변수";
	
		public String plus(int a, int b){
			return a+"+"+b+"="+(a+b);
		}
		String result = plus(1,2);
		 
	%>
	
	<%  //실행문
		String var = "나는 지역변수";
		String res = plus(1,2);
		//scriptlet에서 선언된 변수들은 모두 지역변수
		//왜? 여기서 작성된 코드들은 모두 _jspService()메소드 안에 정의됨.
	%>
	<hr color="red">
	<h2><%=str %></h2>
	<h2><%=var %></h2>
	<h2><%=result %></h2>
	<h2><%=res %></h2>
	<h2><%=plus(1,2) %></h2>
</body>
</html>