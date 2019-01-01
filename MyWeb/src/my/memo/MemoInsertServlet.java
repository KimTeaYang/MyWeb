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
			//memo.html�������� �̵���Ų��.
			res.sendRedirect("memo/memo.html");
			//sendRedirect()�� ������ �̵��� ��Ű�� �������� �̵��� ���Ŀ���
			//������ ��� �����Ѵ�. ���� return���� ����� ��.
			return;
		}
		
		MemoVO mvo = new MemoVO(0,name,msg,null);
		MemoDAO mdao = new MemoDAO();
		int result = mdao.insertMemo(mvo);
		
		String str = (result>0)?"�޸��� ����":"�޸��� ����";
		String loc = (result>0)?"MemoList":"javascript:history.back()";
		
		out.println("<script>");
		out.println("alert('"+str+"');");
		out.println("location.href='"+loc+"';");
		out.println("</script>");
		
		
		out.close();
	}

}
