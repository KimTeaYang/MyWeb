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
 * web.xml에 등록하던 서블릿을 어노테이션으로 등록할 수 있도록 하고 있다.
 * @webServlet("/url패턴");
 * 
 * http://localhost:9090/MyWeb/aaa 하면 HelloServlet이 실행됨
 */
@WebServlet("/aaa")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	/* 모든 요청이 있을 때마다 Thread는 service()를 호출한다
	 * service()내에서는 요청방식에 따라 
	 * get방식이면 => doGet
	 * post      => doPost
	 * delete    => doDelete()
	 * put       => doPut() 등을 호출한다.
	 * */
	
	/* restfull 방식
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
		
		//웹브라우저에 출력할 수 있는 스트림 얻기
		PrintWriter pw = res.getWriter();
		
		pw.println("<html><head><title>HelloServlet</title></head>");
		pw.println("<body>");
		pw.println("<h1>Hello MyWeb Servlet</h1>");
		//요청 방식 알아내기
		String method = req.getMethod();
		
		pw.println("<h2 style='color:red'>요청방식: "+method+"</h2>");
		
		//WAS는 service()내에서 요청방식을 알아내어 요청방식이
		//get방식이면 doGet()을 호출하고, post이면 doPost()를 호출한다.
		
		//POST방식일 경우 한글 인코딩 처리
		req.setCharacterEncoding("UTF-8");
		
		//사용자가 입력한 값 알아내기=> req 통해서
		//String getParameter("파라미터명") => input name이 파라미터명
		String id = req.getParameter("uid");
		String pwd = req.getParameter("upw");
		
		pw.println("<h3>사용자 아이디: "+id+"</h3>");
		pw.println("<h3>사용자 비밀번호: "+pwd+"</h3>");
		pw.println("</body>");
		pw.println("</html>");
		
		pw.close();
	}
}
