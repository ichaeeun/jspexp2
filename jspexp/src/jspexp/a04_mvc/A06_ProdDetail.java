package jspexp.a04_mvc;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspexp.a03_database.A03_ShopDao;
import jspexp.z01_vo.Product2;

/**
 * Servlet implementation class A06_ProdDetail
 */
@WebServlet(name = "prodDetail.do", urlPatterns = { "/prodDetail.do" })
public class A06_ProdDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A06_ProdDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String pnoS = request.getParameter("pno");
		String proc = request.getParameter("proc");
		if(pnoS==null) pnoS="0";
		int pno = Integer.parseInt(pnoS);
		A03_ShopDao dao = new A03_ShopDao();
		if(proc!=null) {
			if(proc.equals("upt")) {
				String name = request.getParameter("name");
				String priceS = request.getParameter("price");
				if(priceS==null) priceS="0";
				int price = Integer.parseInt(priceS);
				String cntS = request.getParameter("cnt");
				if(cntS==null) cntS="0";
				int cnt = Integer.parseInt(cntS);
				String credteS = request.getParameter("credteS");
				String company = request.getParameter("company");
				String incomedteS = request.getParameter("incomedteS");
				String inmanager = request.getParameter("inmanager");
				dao.updateProduct(new Product2(pno,  name,  price,  cnt, 
						 credteS,  company,  incomedteS,
						 inmanager));
			}
			
			if(proc.equals("del")) {
				System.out.println("삭제 준비 완료:"+pno);
				dao.deleteProduct(pno);
			}
		}
		
		request.setAttribute("prod", dao.getProd(pno));
		
		
		String page = "/a00_exp/03/a37_0303proDetail.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

}
