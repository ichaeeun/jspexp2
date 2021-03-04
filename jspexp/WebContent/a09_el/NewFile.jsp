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
		$("h3").text("시작");
	});
</script>
</head>
<body>
	<h3>제목</h3>
	<table>
		<tr><th>타이틀</th></tr>
		<tr><td>내용</td></tr>
	</table>
</body>
</html>