<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
    import="jspexp.z01_vo.*"
    isErrorPage="true"
    %>
<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404에러</title>
<link rel="stylesheet" 
	href="<%=path%>/a00_com/a00_com.css">
<style>
	body {
		background-image : 
		url('<%=path%>/a04_exception/img01.jpg');
		background-repeat : no-repeat;
		background-size : cover;
		color:yellow;
	}
</style>
<script>
	window.onload=function(){
		
	};
</script>
</head>
<body>
	<h3 align="center">요청한 페이지가 없습니다.</h3>
</body>
</html>