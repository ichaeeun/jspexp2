package jspexp.a04_mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspexp.a03_database.A01_Dao;
import jspexp.z01_vo.Emp;

/**
 * Servlet implementation class A04_EmpDetail
 */
@WebServlet(name = "empDetail.do", urlPatterns = { "/empDetail.do" })
public class A04_EmpDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A04_EmpDetail() {
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
		String proc = request.getParameter("proc");
		
		String empnoS = request.getParameter("empno");
		if(empnoS==null) empnoS="0";
		int empno = Integer.parseInt(empnoS);
		//2. 모델 처리
		A01_Dao dao = new A01_Dao();
		if(proc!=null) {
			if(proc.equals("upt")) {
				String ename = request.getParameter("ename");
				String job = request.getParameter("job");
				String mgr = request.getParameter("mgr");
				String hiredate_s = request.getParameter("hiredate_s");
				String sal = request.getParameter("sal");
				String comm = request.getParameter("comm");
				String deptno = request.getParameter("deptno");						
				Emp upt = new Emp(empno, ename, job, 
						Integer.parseInt(mgr), hiredate_s, 
						Double.parseDouble(sal), Double.parseDouble(comm),
						Integer.parseInt(deptno) );
				dao.updateEmp(upt);				
			}
			if(proc.equals("del")) {
				System.out.println("삭제 준비 완료:"+empno);
				dao.deleteEmp(empno);				
			}
		}
		request.setAttribute("emp", dao.getEmp(empno));
		
		
		//3. 뷰호출
		String page = "a11_mvc\\a03_empDetail.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

}
