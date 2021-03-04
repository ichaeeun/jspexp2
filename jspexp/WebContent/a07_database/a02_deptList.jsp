<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.A01_Dao"
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

--%>
<%
A01_Dao dao = new A01_Dao();
%>
<body>
	<h3>부서정보</h3>
	<table>
		<tr><th>부서번호</th><th>부서명</th><th>부서위치</th></tr>
		<%for(Dept d: dao.deptList()){ %>
			<tr>
				<td><%=d.getDeptno()%></td>
				<td><%=d.getDname()%></td>
				<td><%=d.getLoc()%></td>
			</tr>
		<%} %>
	</table>
</body>
</html>