package jspexp.a04_mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspexp.a03_database.A02_DeptDao;
import jspexp.z01_vo.Dept;

/**
 * Servlet implementation class A05_DeptInsertController
 */
@WebServlet(name = "deptInsert.do", urlPatterns = { "/deptInsert.do" })
public class A05_DeptInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A05_DeptInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		// 부서정보 등록 controller
		// 1.요청
		//   DB처리
		
		String deptno = request.getParameter("deptno");
		if(deptno==null || deptno.trim().equals("")) deptno="0";
		String dname = request.getParameter("dname");
		if(dname==null) dname="";
		String loc = request.getParameter("loc");
		if(loc==null) loc="";
		log("deptno:"+deptno);
		log("dname:"+dname);
		log("loc:"+loc);
		if(!dname.equals("")){
			A02_DeptDao dao = new A02_DeptDao();
			dao.insertDept(new Dept(new Integer(deptno),dname, loc));		
		}
		
		// 2.화면 호출.
		String page = "a11_mvc\\a04_deptInsert.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);		
		
	}

}
