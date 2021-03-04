package jspexp.a04_mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspexp.z01_vo.Student;


/**
 * Servlet implementation class A01_StartController
 */
@WebServlet(name = "mvc01.do", urlPatterns = { "/mvc01.do" })
public class A01_StartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A01_StartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/* 
		# MVC 개발 패턴
		웹 개발을 Model과 View와 Controller로 역할 분담하여 처리하는 
		commander 패턴 개발 방식을 말한다.
		
		1. Controller 클래스
			1) servlet으로 클라이언트가 요청을 하면 해당 요청값을 가지고
			2) model에게 해당 요청값으로 데이터를 요청하고,
				view단에 보내줄 핵심 데이터를 setAttribute객체에 할당한다.
			3) View단을 호출.
		2. Model 클래스/model처리
			1) 데이터베이스를 호출하는 dao 클래스를 객체로 만들거나, 핵심 로직으로
				view단에 넘겨줄 데이터를 저장한다.
		3. View단(.jsp)
			1) controller에서 넘겨준 모델 데이터를 화면에 뿌려주는 형식(보여주는 형식)
				을 말한다.
				
		http://localhost:7080/jspexp/mvc01.do		
		http://localhost:7080/jspexp/mvc01.do?name=홍길동&kor=80&eng=90&math=100		
		 **/
		// 1. 요청값 처리 받기.
		String name = request.getParameter("name");
		String korS = request.getParameter("kor");
		String engS = request.getParameter("eng");
		String mathS = request.getParameter("math");
		
		// 2. Model데이터 만들기(다른 클래스로 분리해서 처리하는 경우가 많음.)
		int kor = 0; if(korS!=null) kor=Integer.parseInt(korS);
		int	eng = 0; if(engS!=null) eng=Integer.parseInt(engS);
		int math = 0; if(mathS!=null) math=Integer.parseInt(mathS);
		//    1) 모델데이터 설정 : view에서 사용할 수 있게 처리..
		//       ctrl+shift+o (자동 import)
		request.setAttribute("stud", new Student(name,kor,eng,math));
		
		// 3. View단 호출..
		String page="a11_mvc\\a01_start.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
		
		
		
	}

}
