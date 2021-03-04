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
		var uptBtn = document.querySelector("#uptBtn");
		uptBtn.onclick=function(){
			document.querySelector("[name=proc]").value="upt";
			document.querySelector("form").submit();
		};
		var delBtn = document.querySelector("#delBtn");
		delBtn.onclick=function(){
			if(confirm("삭제하시겠습니까?")){
				document.querySelector("[name=proc]").value="del";
				document.querySelector("form").submit();
			}
		}
		
		
	};
</script>
</head>
<%--

--%>
<%
	String proc = request.getParameter("proc");
	log("### proc:"+proc);
	String pnoS = request.getParameter("pno");
	int pno = 0;
	if(pnoS!=null&&!pnoS.equals("")) pno = Integer.parseInt(pnoS);
	A03_ShopDao dao = new A03_ShopDao();
	if(proc!=null){
		if(proc.equals("upt")){
			String name = request.getParameter("name");
			int price = Integer.parseInt(request.getParameter("price"));
			int cnt = Integer.parseInt(request.getParameter("cnt"));
			String company = request.getParameter("company");
			String inmanager = request.getParameter("inmanager");
			String credteS = request.getParameter("credteS");
			String incomedteS = request.getParameter("incomedteS");
			Product2 upt= new Product2(pno,name,price,cnt, 
					credteS, company,incomedteS,inmanager);
			dao.updateProduct(upt);
		}
		if(proc.equals("del")){
			System.out.println("# 삭제 처리!!:"+pno);
			dao.deleteProduct(pno);
		}
	}
	Product2 pro = dao.getProd(pno);
%>
<body>
	<script type="text/javascript">
		var proc = "<%=proc%>";
		if(proc=="upt"){
			if(confirm("수정완료\n메인페이지로 이동하시겠습니까?")){
				location.href='a16_0210.jsp';
			}
		}	
		if(proc=="del"){
			alert("삭제 처리 성공\n메인페이지 이동!!");
			location.href='a16_0210.jsp';
			
		}
	</script>
	<h3>상세화면</h3>
	<form method="post">
		<input type="hidden" name="proc"/>
	<table>
		<%if(pro!=null){ %>
		<tr><th>물건번호</th><td><input type="text" name="pno" value="<%=pro.getPno()%>"/></td></tr>
		<tr><th>물건명</th><td><input type="text" name="name" value="<%=pro.getName()%>"/></td></tr>
		<tr><th>물건가격</th><td><input type="text" name="price" value="<%=pro.getPrice()%>"/></td></tr>
		<tr><th>물건재고량</th><td><input type="text" name="cnt" value="<%=pro.getCnt()%>" /> </td></tr>
		<tr><th>제조사</th><td><input type="text" name="company" value="<%=pro.getCompany()%>"/></td></tr>
		<tr><th>입고책임자</th><td><input type="text" name="inmanager" value="<%=pro.getInmanager()%>"/></td></tr>
		<tr><th>신규등록일</th><td><input type="date"  name="credteS" value="<%=pro.getCredte()%>"/></td></tr>
		<tr><th>최근입고일</th><td><input type="date" name="incomedteS" value="<%=pro.getIncomedte()%>"/></td></tr>
		
		<%}else{ %>
		<tr><td colspan="2">데이터가 없습니다</td></tr>
		<%} %>
		<tr><td colspan="2">
				<input type="button" id="uptBtn" value="수정"/>
				<input type="button" id="delBtn" value="삭제"/>
				<input type="button" value="메인화면이동"
					onclick="location.href='a16_0210.jsp'"/>
			</td></tr>
	</table>
	</form>
</body>
</html>