package jspexp.a04_mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class A03_LoginCtrl
 */
@WebServlet(name = "mvc4.do", urlPatterns = { "/mvc4.do" })
public class A03_LoginSessCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A03_LoginSessCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
/*
mvc4.do?id=himan&pass=7777로 controller단에 요청값을 넘기고
        himan/7777일 때는 view단(jsp)에 @@님 환영합니다. 그외에는 @@@님은 인증된 계정이 아닙니다.
        출력하세요. 
 */		
		// 1. 요청값 처리..
		String id = request.getParameter("id"); 
		String pass = request.getParameter("pass");
		
		// 2. 모델 데이터 처리
		//    1) 초기 페이지 - 초기 로그인 페이지 설정.
		//    2) 입력 후 페이지. - 입력 후 정상일 때 페이지 설정.
		if(id==null) id="";
		if(pass==null) pass="";
		String page = "a32_loginFrm.jsp";
		if(!id.equals("") && !pass.equals("") ) {
			if(id.equals("himan") && pass.equals("7777")) {
				request.setAttribute("isSuccess", true);
				// DB 연동의 경우, session값을 설정해서 model데이터를 매핑한다.
				// HttpSession session = request.getSession();
				// session.setAttribute("member", dao.login(id,pass));
				//a00_exp\02\a32_loginFrm.jsp
				page="a33_successForm.jsp";
			}else {
				request.setAttribute("isSuccess", false);
			}
		}	
		// 3. 화면단 호출.
		RequestDispatcher rd = 
				request.getRequestDispatcher("a00_exp\\02\\"+page);
		rd.forward(request, response);
		
		
		
	}

}
