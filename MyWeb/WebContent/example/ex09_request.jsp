<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp"/>

<div class="">
	<h1>request내장객체: HttpServletRequest의 주요 메소드</h1>
	<%
		String server = request.getServerName(); // 서버 ip주소
		int port = request.getServerPort(); // 서버 포트번호
		String url = request.getRequestURL().toString(); // 전체 주소
		String uri = request.getRequestURI(); // 실행하고 있는 파일 주소
		//URL= 프로토콜://도메인명/파일위치/파일
		//	    프로토콜://호스트:포트/파일위치/파일
		//URI= URL에서 프로토콜과 호스트, 포트번호를 제외한 부분
		
		// get방식일때 주소에서 ? 이후의 변수명과 값을 말함
		String qstr = request.getQueryString(); 
		// 컨텍스트명=> /MyWeb
		String myctx = request.getContextPath(); // 패키지 명
		
		//클라이언트 IP주소
		String cip = request.getRemoteAddr(); // 클라이언트 ip주소
		String protocol = request.getProtocol(); // C 프로토콜 버전정보
	%>
	<h3>서버 도메인명: <%=server %></h3> 
	<h3>서버 포트번호: <%=port %></h3>
	<h3>요청 URL: <%=url %></h3>
	<h3>요청 URI: <%=uri %></h3>
	<h3>쿼리 스트링: <%=qstr %></h3>
	<h3>컨텍스트명 :<%=myctx %></h3>
	<h3>클라이언트 ip: <%=cip %></h3>
	<h3>클라이언트 프로토콜: <%=protocol %></h3>
	
	<hr color="red">
	<%
		String str = uri.substring(myctx.length());
		int a = str.indexOf(".");
		String str2 = str.substring(0,a);
	%>
	<h3><%=str %></h3>
	<h3><%=str2 %></h3>
	
	<h1>request의 헤더 정보</h1>
	<%
		Enumeration<String> en = request.getHeaderNames();
		while(en.hasMoreElements()){
			String key = en.nextElement();
			String val = request.getHeader(key);
			out.println("<h5><li>"+key+": "+val+"</li></h5>");
		}
	%>
</div>

<jsp:include page="/foot.jsp"/>