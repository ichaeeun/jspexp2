package jspexp.a04_mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspexp.z01_vo.Calcu;

/**
 * Servlet implementation class A02_Controller
 */
@WebServlet(name = "mvc02.do", urlPatterns = { "/mvc02.do" })
public class A02_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A02_Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// /mvc02.do?num01=25&num02=30
		
		// 1. 요청값 처리.
		String num01S = request.getParameter("num01");
		String num02S = request.getParameter("num02");		
		// 2. 모델 데이터 만들기..
		//    Vo Calcu(int num01, int num02)
		//    setAttribute("cal", ....);  
		int num01 = 0; if(num01S!=null) num01=Integer.parseInt(num01S);
		int	num02 = 0; if(num02S!=null) num02=Integer.parseInt(num02S);		
		// 3. view단 호출..(a11_mvc\a02_calcu.jsp)   25 + 30 = 55 출력

		request.setAttribute("calcu", new Calcu(num01,num02));
		
		// 3. View단 호출..
		String page="a11_mvc\\a02_calcu.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);		
		
		
	}

}
