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
</script>
</head>
<body>
	<h3>VVIP페이지 입니다!!</h3>
      <table>
      <tr><td>구매자</td><td><%=request.getParameter("name") %></td></tr>
      <tr><td>물건명</td><td><%=request.getParameter("pname") %></td></tr>
      <tr><td>가격</td><td><%=request.getParameter("price") %>원</td></tr>
      <tr><td>개수</td><td><%=request.getParameter("cnt") %>개</td></tr>
      <tr><td>총계</td><td><%=request.getAttribute("tot") %>원</td></tr>
      </table>
</body>
</html>