package my.memo;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 * Servlet implementation class MemoInsertServlet
 */
@WebServlet("/MemoInsert")
public class MemoInsertServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, 
			HttpServletResponse res) 
			throws ServletException, IOException {
		
		res.setContentType("text/html; charset=UTF-8");
		
		
		PrintWriter out = res.getWriter();
		
		String name = req.getParameter("name");
		String msg = req.getParameter("msg");
		
		if(name==null||msg==null) {
			//memo.html페이지로 이동시킨다.
			res.sendRedirect("memo/memo.html");
			//sendRedirect()로 페이지 이동을 시키면 페이지가 이동된 이후에도
			//로직은 계속 수행한다. 따라서 return문을 써줘야 함.
			return;
		}
		
		MemoVO mvo = new MemoVO(0,name,msg,null);
		MemoDAO mdao = new MemoDAO();
		int result = mdao.insertMemo(mvo);
		
		String str = (result>0)?"메모등록 성공":"메모등록 실패";
		String loc = (result>0)?"MemoList":"javascript:history.back()";
		
		out.println("<script>");
		out.println("alert('"+str+"');");
		out.println("location.href='"+loc+"';");
		out.println("</script>");
		
		
		out.close();
	}

}
