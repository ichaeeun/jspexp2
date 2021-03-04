package jspexp.a04_mvc;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspexp.a03_database.A03_ShopDao;
import jspexp.z01_vo.Product2;

/**
 * Servlet implementation class A06_ProdController
 */
@WebServlet(name = "product.do", urlPatterns = { "/product.do" })
public class A06_ProdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A06_ProdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 1. 요청값.
		request.setCharacterEncoding("utf-8");
		// name, fr_price, to_price
		String name = request.getParameter("name");
		String fr_priceS = request.getParameter("fr_price");
		String to_priceS = request.getParameter("to_price");
		// 2. 모델데이터 만들기.
		if(name==null) name="";
		if(fr_priceS==null||fr_priceS.equals("")) fr_priceS="0";
		if(to_priceS==null||to_priceS.equals("")) to_priceS="9999999";
		int fr_price = Integer.parseInt(fr_priceS);
		int to_price = Integer.parseInt(to_priceS);
		A03_ShopDao dao = new A03_ShopDao();
		request.setAttribute("plist", 
				dao.shopList(new Product2(name,fr_price,to_price )));
		// 3. view호출
		String page = "a00_exp\\03\\a35_proList.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
		
	}

}
