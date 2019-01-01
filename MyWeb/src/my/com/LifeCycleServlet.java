package my.com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 서블릿의 생명주기를 살펴보는 예제
 * - init() : 클라이언트의 첫 요청이 왔을 때 딱 한번 호출되는 메소드
 * - service() 
 *    [서비스 메소드 내에서
 *    요청방식에  따라 doGet(), doPost(), doPut()...메소드 호출]
 *    : 클라이언트 요청이 있을 때마다 호출되는 메소드로
 *      스레드에 의해 service()가 호출된다.
 *      
 * - destroy(): WAS서버가 SHUTDOWN될 때 딱 한번 호출되는 메소드
 * 				정상종료시에 호출됨. 비정상 종류시는 호출X   
 */
@WebServlet("/LifeCycle")
public class LifeCycleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	int count;
	
	public LifeCycleServlet() {
		System.out.println("LifeCycleServlet()생성자...");
	}
	
	@Override
	public void init() throws ServletException{
		super.init();
		count=0;
		System.out.println("init()호출됨...");
		//첫 클라이언트 요청시 딱 한번 호출됨
	}
	
	@Override
	public void service(HttpServletRequest req,
			HttpServletResponse res) 
	throws IOException,ServletException
	{
		System.out.println("service()메소드 호출됨");
		res.setContentType("text/html; charset=UTF-8");
		String method=req.getMethod();
		System.out.println("요청 method: "+method);
		//doGet과 doPost메소드는 스레드가 호출하는 메소드
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
		
		//현재 실행 중인 스레드의 이름을 출력해보자.
		Thread tr=Thread.currentThread();
		String name=tr.getName();
		pw.println("<h2>스레드 이름: "+name+"</h2>");
		
		//가용 메모리
		Runtime rt=Runtime.getRuntime();
		long memory=rt.freeMemory();
		pw.println("<h3>가용 메모리: "+memory+"</h3>");
		
		if(count>10) {
			//Garbage Collector 호출
			System.gc();
			memory=rt.freeMemory();
			pw.println("<h3 color='red'>GC호출후 가용메모리:"
					+memory+"</h3>");
			count=0;
		}
		
		
		pw.close();
	}
	
	@Override
	public void destroy() {
		super.destroy(); //자원 해제 등의 작업이 있다면 여기서 구현
		System.out.println("destroy()호출됨...");
		//WAS서버가 정상적인 종료를 할 때 딱 한번 호출된다.
	}
	

}






