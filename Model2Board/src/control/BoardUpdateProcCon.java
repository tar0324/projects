package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDAO;


@WebServlet("/BoardUpdateProcCon.do")
public class BoardUpdateProcCon extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request,response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		//������ �Ѿ�� �����͸� �޾���
		int num = Integer.parseInt(request.getParameter("num"));
		String password = request.getParameter("password"); //����ڷκ��� �Է¹��� �н�����
		String pass = request.getParameter("pass"); // ���� �����ͺ��̽��� ����Ǿ��ִ� �н����� ��
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		//password���� pass���� ���ؾߵ�
		if(password.equals(pass)){
			BoardDAO bdao = new BoardDAO();
			bdao.UpdateBoard(num, subject, content);
			
			
			RequestDispatcher dis = request.getRequestDispatcher("BoardListCon.do");
			dis.forward(request, response);
		} else {
			request.setAttribute("msg", "��й�ȣ�� ���� �ʽ��ϴ�.");
			RequestDispatcher dis = request.getRequestDispatcher("BoardListCon.do");
			dis.forward(request, response);
		}
	}

}
