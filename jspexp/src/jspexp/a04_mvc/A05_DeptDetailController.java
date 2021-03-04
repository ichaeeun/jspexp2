package jspexp.a04_mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspexp.a03_database.A01_Dao;
import jspexp.a03_database.A02_DeptDao;

/**
 * Servlet implementation class A05_DeptDetailController
 */
@WebServlet(name = "deptDetail.do", urlPatterns = { "/deptDetail.do" })
public class A05_DeptDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A05_DeptDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		//1. 요청값 처리
		// 	1)기본 조회
		
		String deptnoS = request.getParameter("deptno");
		if(deptnoS==null) deptnoS="0";
		int deptno = Integer.parseInt(deptnoS);
		System.out.println("#detpno:"+deptno);
		
		//2. 모델 처리
		A02_DeptDao dao = new A02_DeptDao();
		
		
		
		request.setAttribute("dept", dao.getDept(deptno));
		
		
		
		//3. 뷰호출
		String page = "a11_mvc\\a04_deptDetail.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);		
	}

}
