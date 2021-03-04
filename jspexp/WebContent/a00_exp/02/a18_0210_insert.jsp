<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.A03_ShopDao"
    %>
<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" 
	href="<%=path%>/a00_com/a00_com.css">
<style>

</style>
<script>
	window.onload=function(){
		
	};
</script>
</head>
<%--
제품번호, 물건명, 물건가격, 물건재고량, 신규등록일, 
        		제조사, 최근입고일, 입고책임자
--%>
<body>
<%
	String name= request.getParameter("name");
	if(name==null) name="";
	int price=0;
	String priceS = request.getParameter("price");
	if(priceS!=null&&!priceS.equals("")) price= new Integer(priceS);
	int cnt=0;
	String cntS = request.getParameter("cnt");
	if(cntS!=null&&!cntS.equals("")) cnt= new Integer(cntS);
	String company= request.getParameter("company");
	if(company==null) company="";
	String inmanager= request.getParameter("inmanager");
	String credteS = "";
	String incomedteS = "";
	if(inmanager==null) inmanager="";	
	if(!name.equals("")){ // 초기화면과 구분..
		A03_ShopDao dao = new A03_ShopDao();
		dao.insertProduct(new Product2(0,name, price,cnt, credteS, 
						company, incomedteS, inmanager));
		
	}
%>
	<script type="text/javascript">
		var name = "<%=name%>";
		if(name!=''){
			if(confirm("등록 완료!!\n조회페이지로 이동하시겠습니까?")){
				location.href='a16_0210.jsp';
			}
		}
	
	</script>
	<h3>물품등록</h3>
	<form method="post">
	<table>
		<tr><th>물건명</th><td><input type="text" name="name"/></td></tr>
		<tr><th>물건가격</th><td><input type="text" name="price"/></td></tr>
		<tr><th>물건재고량</th><td><input type="text" name="cnt"/></td></tr>
		<tr><th>제조사</th><td><input type="text" name="company"/></td></tr>
		<tr><th>입고책임자</th><td><input type="text" name="inmanager"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="등록"/>
				<input type="button" value="메인화면이동"
					onclick="location.href='a16_0210.jsp'"/>
			</td></tr>
	</table>
	</form>
</body>
</html>