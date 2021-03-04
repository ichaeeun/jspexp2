<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
    import="jspexp.z01_vo.*"
    %>
<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();
/*
	invalidate()호출.
	다시 로그인 
	session 확인 페이지.. 
*/   
   
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
<body>
<%
session.invalidate();
%>
	<h3>로그아웃</h3>
	<table>
		<tr><th onclick="location.href='a05_login.jsp'">
				로그인 페이지 이동</th></tr>
		<tr><td onclick="location.href='a06_mem_sess.jsp'">
				세션페이지 확인</td></tr>
	</table>
</body>
</html>