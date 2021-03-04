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
	<h3>session scope</h3>
	<a href="a04_application.jsp">어플리케이션 범위로??</a>
	<!-- 
	[서버와 연결한 브라우저]에서 호출된 페이지는 해당 session값을 가지고 있다.
	key, value 
	1. 서버와 연결한 브라우저가 아닌 브라우저
		1) 다 닫고 실행 했을 때.
		2) 다른 종류의 브라우저를 실행 했을 때.
	 -->
	<table>
	<!-- session, application 범위에 데이터만 출력한다. -->
		<tr><th>페이지범위</th><td><%=pageContext.getAttribute("pageVar")%></td></tr>
		<tr><th>요청범위</th><td><%=request.getAttribute("reqVar")%></td></tr>
		<tr><th>세션범위</th><td><%=session.getAttribute("sessVar")%></td></tr>
		<tr><th>어플리케이션범위</th><td><%=application.getAttribute("appVar")%></td></tr>
	</table>
</body>
</html>