package my.memo;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemoUpdateServlet
 */
@WebServlet("/MemoUpdate")
public class MemoUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest req, 
			HttpServletResponse res) 
			throws ServletException, IOException {
		res.setContentType("text/html; charset=UTF-8");
		
		req.setCharacterEncoding("UTF-8");
		
		String idx = req.getParameter("idx");
		String name = req.getParameter("name");
		String msg = req.getParameter("msg");
		
		if(idx==null||name==null||msg==null) {
			res.sendRedirect("MemoList");
			return;
		}
		
		PrintWriter out = res.getWriter();
		
		MemoVO mvo = new MemoVO();
		mvo.setIdx(Integer.parseInt(idx));
		mvo.setName(name);
		mvo.setMsg(msg);
		
		MemoDAO mdao = new MemoDAO();
		
		int result = mdao.updateMemo(mvo);
		String str = (result>0)?"수정 성공":"수정 실패";
		
		out.println("<script>");
		out.println("alert('"+str+"');");
		out.println("location.href='MemoList'");
		out.println("</script>");
		
		out.close();
	}

}
