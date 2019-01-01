package my.com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloServlet
 * web.xml�� ����ϴ� ������ ������̼����� ����� �� �ֵ��� �ϰ� �ִ�.
 * @webServlet("/url����");
 * 
 * http://localhost:9090/MyWeb/aaa �ϸ� HelloServlet�� �����
 */
@WebServlet("/aaa")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	/* ��� ��û�� ���� ������ Thread�� service()�� ȣ���Ѵ�
	 * service()�������� ��û��Ŀ� ���� 
	 * get����̸� => doGet
	 * post      => doPost
	 * delete    => doDelete()
	 * put       => doPut() ���� ȣ���Ѵ�.
	 * */
	
	/* restfull ���
	 *  get    => Read
	 *  post   => Create
	 *  put    => Update
	 *  delete => Delete
	 * */
	
	@Override
	protected void service(HttpServletRequest req,
			HttpServletResponse res)
			throws ServletException, IOException {
		res.setContentType("text/html; charset=UTF-8");
		
		//���������� ����� �� �ִ� ��Ʈ�� ���
		PrintWriter pw = res.getWriter();
		
		pw.println("<html><head><title>HelloServlet</title></head>");
		pw.println("<body>");
		pw.println("<h1>Hello MyWeb Servlet</h1>");
		//��û ��� �˾Ƴ���
		String method = req.getMethod();
		
		pw.println("<h2 style='color:red'>��û���: "+method+"</h2>");
		
		//WAS�� service()������ ��û����� �˾Ƴ��� ��û�����
		//get����̸� doGet()�� ȣ���ϰ�, post�̸� doPost()�� ȣ���Ѵ�.
		
		//POST����� ��� �ѱ� ���ڵ� ó��
		req.setCharacterEncoding("UTF-8");
		
		//����ڰ� �Է��� �� �˾Ƴ���=> req ���ؼ�
		//String getParameter("�Ķ���͸�") => input name�� �Ķ���͸�
		String id = req.getParameter("uid");
		String pwd = req.getParameter("upw");
		
		pw.println("<h3>����� ���̵�: "+id+"</h3>");
		pw.println("<h3>����� ��й�ȣ: "+pwd+"</h3>");
		pw.println("</body>");
		pw.println("</html>");
		
		pw.close();
	}
}
