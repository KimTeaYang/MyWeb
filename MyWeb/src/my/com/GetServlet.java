package my.com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetServlet
 */
@WebServlet("/GetServlet")
public class GetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req,
			HttpServletResponse res) 
			throws ServletException, IOException {
		res.setContentType("text/html; charset=UTF-8");
		
		PrintWriter pw = res.getWriter();
		pw.println("<html><head><title>GetServlet.html</title></head><body>");
		
		pw.println("<h1>GetServlet</h1>");
		
		req.setCharacterEncoding("UTF-8");
		
		String id = req.getParameter("uid");
		String pwd = req.getParameter("upw");
		
		pw.println("<h3 style='color:red'>아이디: "+id+"</h3>");
		pw.println("<h3 style='color:blue'>비밀번호: "+pwd+"</h3>");
		
		pw.println("</body></html>");
		pw.close();
	}

}