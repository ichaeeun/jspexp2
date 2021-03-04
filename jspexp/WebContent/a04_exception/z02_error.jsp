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
<title>Insert title here</title>
<link rel="stylesheet" 
	href="<%=path%>/a00_com/a00_com.css">
<style>
	body {
		background-image : 
		url('<%=path%>/a04_exception/img02.jpg');
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
<body style="background-image: url('img02.jpg');">
	<h2>요청시 에러가 발생했습니다!!</h2>
	<h2>에러 타입:<%=exception.getClass().getName() %></h2>
	<h2>에러 메시지:<%=exception.getMessage() %></h2>
	<h2>에러 경로:<%exception.printStackTrace(); %></h2>
	<h2>잠시 기다리시면 담당자와 통화가 가능합니다!</h2>
	<h2>담당자 : 홍길동 대리 (010-8888-8888)</h2>
</body>
</html>