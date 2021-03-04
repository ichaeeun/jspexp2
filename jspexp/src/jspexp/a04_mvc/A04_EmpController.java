package jspexp.a04_mvc;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspexp.a03_database.A01_Dao;
import jspexp.z01_vo.Emp;

/**
 * Servlet implementation class A04_EmpController
 */
@WebServlet(name = "emp.do", urlPatterns = { "/emp.do" })
public class A04_EmpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A04_EmpController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// # MVC를 통한 EMP 조회 처리.
		// 1. 요청
		// 	1) 한글에 대한 encoding
		request.setCharacterEncoding("utf-8");
		String ename = request.getParameter("ename");
		String job = request.getParameter("job");
		System.out.println("## 이름:"+ename);
		System.out.println("## 직책:"+job);
		// 2. 모델
		// =================service단계 시작=================
		if(ename == null) ename="";
		if(job == null) job="";
		
		// Db 접속에 메서드를 통해서 모델 데이터 처리..
		// =================service 단계에서 dao단 호출 
		// =================dao단계시작=================
		A01_Dao dao = new A01_Dao();
		// =================dao단계끝================= 
		ArrayList<Emp> list = dao.empList2(ename, job);
		// =================service단계 끝=================
		// DB에서 온 ArrayList<Emp>데이터를 모델명을 empList로 선언한다.
		// 이 모델명 empList는 view단에서 el ${empList}로 활용된다.
		request.setAttribute("empList", list); 
		
		// 3. view처리
		String page="a11_mvc\\a03_empList.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
		// ex) A05_DeptController를 통해서 MVC로 부서정보 조회 처리하세요 16:45
		
		
		
		
		
		
	}

}
