package my.memo;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemoDeleteServlet
 */
@WebServlet("/MemoDelete")
public class MemoDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, 
			HttpServletResponse res) 
			throws ServletException, IOException {
		res.setContentType("text/html; charset=UTF-8");
		
		String idx = req.getParameter("idx");
		if(idx==null) {
			res.sendRedirect("/MemoList");
			return;
		}
		
		PrintWriter out = res.getWriter();
		
		MemoVO mvo = new MemoVO();
		mvo.setIdx(Integer.parseInt(idx));
		MemoDAO mdao = new MemoDAO();
		
		int result = mdao.deleteMemo(mvo);
		String str = (result>0)?"삭제 성공":"삭제 실패";
		
		out.println("<script>");
		out.println("alert('"+str+"');");
		out.println("location.href='MemoList'");
		out.println("</script>");
		
		out.close();
	}

}
