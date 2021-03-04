<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isErrorPage="true"
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
	<h3 align="center">데이터값 없음 에러 발생했습니다.</h3>
	<table>
		<tr><th>에러 타입</th><td><%=exception.getClass().getName() %></td></tr>
		<tr><th>에러 메시지</th><td><%=exception.getMessage() %></td></tr>
		<tr><td colspan="2">데이터베이스 데이터 확인하거나 객체 생성확인하세요!!</td></tr>
		<tr><td colspan="2">잠시 쉬셨다가 힘을 내시고 시작합니다!! ^^</td></tr>
	</table>
</body>
</html>