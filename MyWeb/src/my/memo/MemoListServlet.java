package my.memo;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemoListServlet
 */
@WebServlet("/MemoList")
public class MemoListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, 
			HttpServletResponse res) 
			throws ServletException, IOException {
		res.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = res.getWriter();
		
		out.println("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">");
		out.println("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css\">");
		out.println("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>");
		out.println("<script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js\"></script>");
		out.println("<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js\"></script>");
		out.println("<body>");
		out.println("<div class='container'>");
		out.println("<h1 class='text-center text-primary  mt-5 mb-5'>::한줄 메모장 목록::</h1>");
		out.println("<table class='table table-striped table-hover'>");
		out.println("<tr class='bg-warning text-center'>");
		out.println("<th>글번호</th><th width='50%'>메모내용</th><th>작성자</th>");
		out.println("<th>수정|삭제</th>");
		out.println("</tr>");
		
		MemoDAO mdao = new MemoDAO();
		ArrayList<MemoVO> arr = mdao.listMemo();
		if(arr==null||arr.size()==0) {
			out.println("<tr><td colspan='4'>");
			out.println("<b>서버 오류이거나 데이터가 없습니다.");
			out.println("</tr>");
		}else {
			for(MemoVO mvo:arr) {
				out.println("<tr class='text-center'>");
				out.println("<td>"+mvo.getIdx()+"</td>");
				out.println("<td class='text-left'>"+mvo.getMsg());
				out.println("<span class='float-right badge badge-success'>["+mvo.getWdate()+"]</span>");
				out.println("</td>");
				out.println("<td>"+mvo.getName()+"</td>");
				out.println("<td><a href='MemoForm?idx="+mvo.getIdx()+"'>수정</a> |");
				out.println("<a href='MemoDelete?idx="+mvo.getIdx()+"'>삭제</a></td>");
				out.println("</tr>");
			}
		}
		
		out.println("<script>");
		out.println("function update(){"
				+ "}");
		out.println("</script>");
		
		out.println("</table>");
		out.println("</div>");
		out.println("</body>");
		
		out.close();
	}

}
