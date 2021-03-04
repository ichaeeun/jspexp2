<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
    import="jspexp.z01_vo.*"
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
<%--

--%>
<body>
<%
ArrayList<Person> plist = 
(ArrayList<Person>)session.getAttribute("plist");
%>
	<h3>리스트 session데이터 확인</h3>
	<table>
		<tr><th>이름</th><th>나이</th><th>사는곳</th></tr>
		<%for(Person p:plist){%>
		<tr><td><%=p.getName() %></td>
			<td><%=p.getAge() %></td>
			<td><%=p.getLoc()%></td></tr>
		<%}%>
	</table>
	<h4 onclick="location.href='a03_session_info.jsp'">
		세션 정보 확인.</h4>
</body>
</html>