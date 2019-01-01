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
		// 1. �ٿ�ε��� ���ϸ� �޾ƿ���
		String fname = request.getParameter("fname");
		
		// 2. ���ε� ���丮�� ���� ��� ���(MyWeb/Upload)
		ServletContext app = request.getServletContext();
		String upDir = app.getRealPath("/Upload");
		String filePath = upDir+File.separator+fname;
		//System.out.println(filePath);
		
		//��Ʈ�� �����ؼ� Ŭ���̾�Ʈ �ʿ� ��������.(��½�Ʈ��)
		// 3. response����� ����ƮŸ���� �����ϴµ� �������� ����Ʈ Ÿ����
		// ������ �𸣴� Ÿ���̸� �ٿ�ε� â�� �����Ų��.
		//response.setContentType("application/unknown");
		response.setContentType("application/octet-stream");
		
		// �ѱ� ���ϸ� ���ڵ� ó��
		String fname_en 
			= new String(fname.getBytes(),"ISO-8859-1");
		
		String attach = "attachment; filename="+fname_en;
		response.setHeader("Content-Disposition", attach);
		
		//4. ��Ʈ�� �����ؼ� ������ �а� Ŭ������ ��������
		/* �����ͼҽ� : ����(filePath)
		 *  => FileInputStream => BufferedInputStream
		 * �����͸����� : Ŭ���̾�Ʈ(response)
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
