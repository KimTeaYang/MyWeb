<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- fuction.jsp -->

<%-- 
	사용자 정의 메소드를 모아두는 페이지.
	=> 선언문에서 해야함 <%! %>
	선언문 내에서는 내장객체들을 사용할 수 없다.
	내장객체들은 __jspService()안에서 선언된 지역변수이므로.
--%>

<%! 
	public void goUrl(String msg, String loc, JspWriter o)
	throws Exception {
		o.println("<script>");
		o.println("alert('"+msg+"')");
		o.println("location.href='"+loc+"'");
		o.println("</script>");
	}

	public void goBack(String msg, JspWriter o)
	throws Exception {
		o.println("<script>");
		o.println("alert('"+msg+"')");
		o.println("history.back()");
		o.println("</script>");
	}
%>