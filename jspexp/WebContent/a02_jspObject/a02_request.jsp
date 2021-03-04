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
	<h3>request scope</h3>
	<a href="a03_session.jsp">고고!! session page!!</a>
	<table>
		<!-- page범위에 있는 데이터를 사라진다. -->
		<tr><th>페이지범위</th><td><%=pageContext.getAttribute("pageVar")%></td></tr>
		<tr><th>요청범위</th><td><%=request.getAttribute("reqVar")%></td></tr>
		<tr><th>세션범위</th><td><%=session.getAttribute("sessVar")%></td></tr>
		<tr><th>어플리케이션범위</th><td><%=application.getAttribute("appVar")%></td></tr>
		
		
		
	</table>
</body>
</html>