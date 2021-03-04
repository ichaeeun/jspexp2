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
    private int paramInt(String s) {
    	int ret = 0; 
    	try {
    		ret = Integer.parseInt(s);
    	}catch(Exception e) {
    		System.out.println(e.getMessage());
    	}
    	return ret;
    }
    
    private String paramStr(String s) {
        String ret="";
        if(s!=null) ret=s;
        return ret;
     }
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 1. 요청값 
		request.setCharacterEncoding("utf-8");
		String pnoS = request.getParameter("pno");
		String proc = request.getParameter("proc");
//		if(pnoS==null) pnoS="0";
//		int pno = Integer.parseInt(pnoS);
		int pno = paramInt(pnoS); // null이나 문자열 형태도 0으로 리턴처리 된다. 
		// 2. 모델데이터 
		A03_ShopDao dao = new A03_ShopDao();
		if(proc!=null) {
			if(proc.equals("ins")) {
				
				dao.insertProduct(new Product2(pno,
										paramStr(request.getParameter("name")),
										paramInt(request.getParameter("price")),	
										paramInt(request.getParameter("cnt")),	
										paramStr(request.getParameter("credteS")),
										paramStr(request.getParameter("company")),
										paramStr(request.getParameter("incomedteS")),
										paramStr(request.getParameter("inmanager"))
									));
				pno = dao.getMaxPno();
				
			}
			
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
		
		// 3. 화면 
		String page = "/a00_exp/03/a37_0303proDetail.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

}
