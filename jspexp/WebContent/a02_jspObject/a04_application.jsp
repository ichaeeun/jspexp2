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
	<h3>application scope</h3>
	<%--
	# 서버만 구동되고 있으면 데이터를 가지고 있는 범위 : application
	1. 브라우저(client)는 상관없이 데이터를 가지고 있다.
		해당 서버에서 만든 데이터.
	2. 서버를 재기동하거나 다른 서버를 사용할 때, 사라지게 된다. 
	
	 --%>
	<table>
		<tr><th>페이지범위</th><td><%=pageContext.getAttribute("pageVar")%></td></tr>
		<tr><th>요청범위</th><td><%=request.getAttribute("reqVar")%></td></tr>
		<tr><th>세션범위</th><td><%=session.getAttribute("sessVar")%></td></tr>
		<tr><th>어플리케이션범위</th><td><%=application.getAttribute("appVar")%></td></tr>
	</table>
</body>
</html>