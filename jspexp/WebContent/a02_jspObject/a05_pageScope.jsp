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
<%--
page변수 : show "안녕하세요"
request변수 : prodName "사과"
session변수 : id(himan), point(5000)
application변수 : DBServer "192.243.32.12"

a05_pageScope.jsp
a06_requestScope.jsp
a07_sessionScope.jsp
a08_applicationScope.jsp

 --%>
<%
	pageContext.setAttribute("show", "안녕하세요");
	request.setAttribute("prodName", "사과");
	session.setAttribute("m01", new Member("himan",5000));
	application.setAttribute("DBServer", "192.243.32.12");
	request.getRequestDispatcher("a06_requestScope.jsp").forward(request, response);
%>
<body>
	<h3>page</h3>
	<table>
		<tr><th>page</th><td><%=pageContext.getAttribute("show")%></td></tr>
		<tr><th>request</th><td><%=request.getAttribute("prodName")%></td></tr>
		<%Member m01 = (Member)session.getAttribute("m01");%>
		<tr><th>session</th><td><%=m01.getId()%>:<%=m01.getPoint()%></td></tr>
		<tr><th>application</th><td><%=application.getAttribute("DBServer")%></td></tr>
	</table>
</body>
</html>


