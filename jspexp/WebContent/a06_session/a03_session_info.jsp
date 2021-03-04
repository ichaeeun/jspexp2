<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
    import="jspexp.z01_vo.*"
    import="java.text.SimpleDateFormat"
    %>
<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션정보</title>
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
Date time = new Date(); // java Date객체 생성.
SimpleDateFormat 
	formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
	<h3>세션 정보</h3>
	<table>
		<tr><th>아이디</th><td><%=session.getId() %></td></tr>
		<%
			//세션생성 session.getCreateionTime()
			time.setTime(session.getCreationTime());
		%>
		<tr><th>세션생성시간</th>
			<td><%=formatter.format(time)%></td></tr>
		<%
			time.setTime(session.getLastAccessedTime());
		%>	
		<tr><th>최근접근시간</th>
			<td><%=formatter.format(time)%></td></tr>			
	</table>
	<h4 onclick="location.href='a04_sessionClose.jsp'">세션 종료</h4>
</body>
</html>