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
		
		//폼에서 넘어온 데이터를 받아줌
		int num = Integer.parseInt(request.getParameter("num"));
		String password = request.getParameter("password"); //사용자로부터 입력받은 패스워드
		String pass = request.getParameter("pass"); // 실제 데이터베이스에 저장되어있는 패스워드 값
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		//password값과 pass값을 비교해야됨
		if(password.equals(pass)){
			BoardDAO bdao = new BoardDAO();
			bdao.UpdateBoard(num, subject, content);
			
			
			RequestDispatcher dis = request.getRequestDispatcher("BoardListCon.do");
			dis.forward(request, response);
		} else {
			request.setAttribute("msg", "비밀번호가 맞지 않습니다.");
			RequestDispatcher dis = request.getRequestDispatcher("BoardListCon.do");
			dis.forward(request, response);
		}
	}

}
