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
<%
	String id=request.getParameter("id");
%>
<script>
	window.onload=function(){
		// java, js의 연동 처리..
		if(confirm("<%=id%>님 로그인 실패\n로그인 화면이동 하시겠습니까?")){
			// js로 페이지 이동 처리
			location.href="a14_login.jsp";
		}
	};
</script>
</head>
<body>
	<h3>로그인 실패</h3>
</body>
</html>