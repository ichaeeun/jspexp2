<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"  %>
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
<script type="text/javascript" 
  src="<%=path%>/a00_com/jquery-3.5.1.js"></script>
<script type="text/javascript">
/* 
 
 
*/
//
	$(document).ready(function(){
		//$("h3").text("시작");
	});
</script>
</head>
<body>
	<h3>el 세션 설정값 확인</h3>
	<h3>아이디:${mem.id}</h3>
	<h3>이름:${mem.name}</h3>
	<h3>비번:${mem.pass}</h3>
	<h3>권한:${mem.auth}</h3>
</body>
</html>