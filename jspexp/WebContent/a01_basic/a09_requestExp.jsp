<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
http://localhost:7080/jspexp/a01_basic/a09_requestExp.jsp?pname=사과&cnt=3000&price=2&
ex1) ?pname=사과&cnt=5&price=2  출력
ex2) a09_requestExp.jsp??pay=현금&address=서울신림동&ps=바나나&ps=딸기&ps=오렌지
ex3) form 활용  전송페이지 a10_buyResult.jsp
		물건명 : [   ]
		가격 : [   ]
		갯수 :[   ]
		구매방법 : [현금/카드/포인트]select(단일선택)
		배송지 :()서울방배동()서울신림동()경기수원 radio(단일선택)
		기타관심 물건 :[]바나나[]딸기[]수박[]오렌지[]키위(다중선택)
		[구매]
		
--%>
<%
	String pname = request.getParameter("pname"); if(pname==null) pname="";
	String priceS = request.getParameter("price"); if(priceS==null) priceS="0";
	int price = Integer.parseInt(priceS);
	String cntS = request.getParameter("cnt"); if(cntS==null) cntS="0";
	int cnt = Integer.parseInt(cntS);
	String pay = request.getParameter("pay"); if(pay==null) pay="";
	String address = request.getParameter("address"); if(address==null) address="";
	String []ps = request.getParameterValues("ps");
	if(ps==null) ps=new String[]{};
	
%>
<body>
	<h3>구매내역</h3>
	<table>
		<tr><th>물건명</th><td><%=pname %></td></tr>
		<tr><th>가격</th><td><%=price %></td></tr>
		<tr><th>갯수</th><td><%=cnt %></td></tr>
		<tr><th>계</th><td><%=price*cnt %></td></tr>
		<tr><th>구매방법</th><td><%=pay %></td></tr>
		<tr><th>배송지</th><td><%=address %></td></tr>
		<%for(int idx=0;idx<ps.length;idx++){%>
		<tr><th>관심물건 <%=(idx+1)%></th><td><%=ps[idx]%></td></tr>
		<%}%>
	</table>
</body>
</html>