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
<body>
	<h2>요청시 에러가 발생했습니다!!(모든 예외처리)</h2>
	<h2>에러 타입:<%=exception.getClass().getName() %></h2>
	<h2>에러 메시지:<%=exception.getMessage() %></h2>
	<h2>잠시 기다리시면 담당자와 통화가 가능합니다!</h2>
	<h2>담당자 :신길동 대리 (010-8888-8888)</h2>
</body>
<%--
ex) web.xml에 java.lang.NullPointerException
과 z05_null_exception.jsp로 등록하고,
해당 에러나 나왔을 때, 처리를 하세요..


 --%>
</html>