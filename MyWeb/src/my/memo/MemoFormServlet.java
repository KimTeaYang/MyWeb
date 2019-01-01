package my.memo;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemoFormServlet
 */
@WebServlet("/MemoForm")
public class MemoFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, 
			HttpServletResponse res) 
			throws ServletException, IOException {
		res.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = res.getWriter();
		
		String idx = req.getParameter("idx");
		if(idx==null) {
			res.sendRedirect("/MemoList");
			return;
		}
		String str="function check(){\r\n" + 
				"		if(!f.name.value){\r\n" + 
				"			window.alert('�ۼ��ڸ� �Է��ϼ���');\r\n" + 
				"			f.name.focus();\r\n" + 
				"			return;\r\n" + 
				"		}\r\n" + 
				"		\r\n" + 
				"		if(!f.msg.value){\r\n" + 
				"			alert('�޸𳻿��� �Է��ϼ���');\r\n" + 
				"			f.msg.focus();\r\n" + 
				"			return;\r\n" + 
				"		}\r\n" + 
				"		\r\n" + 
				"		var len = f.msg.value.length;\r\n" + 
				"		if(len>100){\r\n" + 
				"			alert('�޸𳻿��� 100�ڸ� �ʰ��ϸ� �ȵǿ�');\r\n" + 
				"			f.msg.select();\r\n" + 
				"			return;\r\n" + 
				"		}\r\n" + 
				"			\r\n" + 
				"		f.submit();\r\n" + 
				"	}";
		
		out.println("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">");
		out.println("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css\">");
		out.println("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>");
		out.println("<script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js\"></script>");
		out.println("<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js\"></script>");
		out.println("<script type=\"text/javascript\">");
		out.println(str);
		out.println("</script>");
		out.println("<body>");
		out.println("<div class='container'>");
		
		out.println("<form name='f' action='MemoUpdate' method='post'>");
		out.println("<h1 class=\"text-center\">::�޸��� ����::</h1>");
		out.println("<input type='hidden' name='idx1' value='"+idx+"'>");
		out.println("�۹�ȣ:<input tpye='text' name='idx' readonly value='"+idx+"'><p>");
		out.println("�ۼ���:<input type='text' name='name'><p>");
		out.println("�޼���:<input type='text' name='msg'><p>");
		out.println("<button type='button' onclick=check()>����</button>");
		out.println("</form>");
		out.println("</div>");
		out.println("</body>");
		
		out.close();
	}
}
