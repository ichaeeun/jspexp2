<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
    import="jspexp.z01_vo.*"
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
	function buy(){
		// js로 페이지 이동
		location.href="a12_shop02.jsp";
	}	
</script>
</head>
<body>
	<h3 onclick="buy()">물건 구매</h3>
	<%
	// 저장된 session값을 가져와서.
	Product prod = (Product)session.getAttribute("prod");
	// 속성값을 변경하고,
	prod.setCnt(prod.getCnt()+1);
	// session 저장.
	session.setAttribute("prod", prod);
	%>
	<table>
		<tr><th>물건명</th><td><%=prod.getName()%></td></tr>
		<tr><th>가격</th><td><%=prod.getPrice()%></td></tr>
		<tr><th>갯수</th><td><%=prod.getCnt()%></td></tr>
	</table>
</body>
</html>