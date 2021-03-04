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
		// # 상세화면에서 수정/삭제 프로세스를 구분하기 위하여 처리 
		String proc = request.getParameter("proc");
		
		String empnoS = request.getParameter("empno");
		// 숫자형 데이터에 대한 처리(에러 및 예외 처리) 
		if(empnoS==null) empnoS="0";
		int empno = 0; 
		// 숫자형을 입력하지 않더라도 에러로 수행을 정지시키는 것을 막을 수 있다. 
		// 문자열형으로 입력하면 empno를 0으로 처리 
		try {
			empno = Integer.parseInt(empnoS);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
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
		// 수정 후에 상세 내용을 확인할 수 있도록 하단에 위치시킨다. 
		request.setAttribute("emp", dao.getEmp(empno));
		
		
		//3. 뷰호출
		String page = "a11_mvc\\a03_empDetail.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

}
