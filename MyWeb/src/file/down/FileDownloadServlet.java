package file.down;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.WriteListener;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

/**
 * Servlet implementation class FileDownloadServlet
 */
@WebServlet("/FileDown")
public class FileDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		download(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		download(request,response);
	}

	private void download(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// 1. 다운로드할 파일명 받아오기
		String fname = request.getParameter("fname");
		
		// 2. 업로드 디렉토리의 절대 경로 얻기(MyWeb/Upload)
		ServletContext app = request.getServletContext();
		String upDir = app.getRealPath("/Upload");
		String filePath = upDir+File.separator+fname;
		//System.out.println(filePath);
		
		//스트림 연결해서 클라이언트 쪽에 내보내자.(출력스트림)
		// 3. response헤더에 컨텐트타입을 지정하는데 브라우저는 컨텐트 타입을
		// 본인이 모르는 타입이면 다운로드 창을 실행시킨다.
		//response.setContentType("application/unknown");
		response.setContentType("application/octet-stream");
		
		// 한글 파일명 인코딩 처리
		String fname_en 
			= new String(fname.getBytes(),"ISO-8859-1");
		
		String attach = "attachment; filename="+fname_en;
		response.setHeader("Content-Disposition", attach);
		
		//4. 스트림 연결해서 파일을 읽고 클쪽으로 내보내기
		/* 데이터소스 : 파일(filePath)
		 *  => FileInputStream => BufferedInputStream
		 * 데이터목적지 : 클라이언트(response)
		 *  => ServletOutputStream => BufferedOutputStream
		 * */
		
		byte[] data = new byte[4000];
		int n=0;
		BufferedInputStream bis 
			= new BufferedInputStream(new FileInputStream(filePath));
		
		BufferedOutputStream bos
			= new BufferedOutputStream(response.getOutputStream());
		while((n=bis.read(data))!=-1) {
			bos.write(data, 0, n);
			bos.flush();
		}
		
		bos.close();
		bis.close();
	}

}
