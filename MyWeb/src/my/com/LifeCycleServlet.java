package my.com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * ������ �����ֱ⸦ ���캸�� ����
 * - init() : Ŭ���̾�Ʈ�� ù ��û�� ���� �� �� �ѹ� ȣ��Ǵ� �޼ҵ�
 * - service() 
 *    [���� �޼ҵ� ������
 *    ��û��Ŀ�  ���� doGet(), doPost(), doPut()...�޼ҵ� ȣ��]
 *    : Ŭ���̾�Ʈ ��û�� ���� ������ ȣ��Ǵ� �޼ҵ��
 *      �����忡 ���� service()�� ȣ��ȴ�.
 *      
 * - destroy(): WAS������ SHUTDOWN�� �� �� �ѹ� ȣ��Ǵ� �޼ҵ�
 * 				��������ÿ� ȣ���. ������ �����ô� ȣ��X   
 */
@WebServlet("/LifeCycle")
public class LifeCycleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	int count;
	
	public LifeCycleServlet() {
		System.out.println("LifeCycleServlet()������...");
	}
	
	@Override
	public void init() throws ServletException{
		super.init();
		count=0;
		System.out.println("init()ȣ���...");
		//ù Ŭ���̾�Ʈ ��û�� �� �ѹ� ȣ���
	}
	
	@Override
	public void service(HttpServletRequest req,
			HttpServletResponse res) 
	throws IOException,ServletException
	{
		System.out.println("service()�޼ҵ� ȣ���");
		res.setContentType("text/html; charset=UTF-8");
		String method=req.getMethod();
		System.out.println("��û method: "+method);
		//doGet�� doPost�޼ҵ�� �����尡 ȣ���ϴ� �޼ҵ�
		/*
		if(method.equalsIgnoreCase("GET")) {
			doGet(req,res);
			//m85-607-442
		}else if(method.equalsIgnoreCase("post")) {
			doPost(req,res)
		}
		*/
		
		PrintWriter pw=res.getWriter();
		
		pw.println("<h1>Servlet Life Cycle</h1>");
		
		count++;
		pw.println("<h2>"+count+"</h2>");
		
		//���� ���� ���� �������� �̸��� ����غ���.
		Thread tr=Thread.currentThread();
		String name=tr.getName();
		pw.println("<h2>������ �̸�: "+name+"</h2>");
		
		//���� �޸�
		Runtime rt=Runtime.getRuntime();
		long memory=rt.freeMemory();
		pw.println("<h3>���� �޸�: "+memory+"</h3>");
		
		if(count>10) {
			//Garbage Collector ȣ��
			System.gc();
			memory=rt.freeMemory();
			pw.println("<h3 color='red'>GCȣ���� ����޸�:"
					+memory+"</h3>");
			count=0;
		}
		
		
		pw.close();
	}
	
	@Override
	public void destroy() {
		super.destroy(); //�ڿ� ���� ���� �۾��� �ִٸ� ���⼭ ����
		System.out.println("destroy()ȣ���...");
		//WAS������ �������� ���Ḧ �� �� �� �ѹ� ȣ��ȴ�.
	}
	

}






