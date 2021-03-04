<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
    import="jspexp.z01_vo.Member" 
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
	<h3>session</h3>
	<a href="a08_applicationScope.jsp">application 범위 이동</a>
	<table>
		<tr><th>page</th><td><%=pageContext.getAttribute("show")%></td></tr>
		<tr><th>request</th><td><%=request.getAttribute("prodName")%></td></tr>
		<tr><th>session</th><td>
		<%
		  if(session.getAttribute("m01")!=null){
			  Member m01 = (Member)session.getAttribute("m01");
			  m01.setPoint(m01.getPoint()+1);
			  session.setAttribute("m01",m01);
		%>
		<%=m01.getId()%>:<%=m01.getPoint()%>
		<%	}%>
		</td></tr>
		<tr><th>application</th><td><%=application.getAttribute("DBServer")%></td></tr>
	</table>
</body>
</html>