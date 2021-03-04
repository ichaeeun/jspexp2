<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
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
<!-- 
?name=홍길동&age=25&loc=서울신림동
 -->
	<h3>받는 정보</h3>
	<table>
		<tr><td><%=request.getParameter("name") %></td></tr>
		<tr><td><%=request.getParameter("age") %></td></tr>
		<tr><td><%=request.getParameter("loc") %></td></tr>
	</table>
</body>
</html>