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
<script>
	window.onload=function(){
		
	};
</script>
</head>
<%
String num01S = request.getParameter("num01");
String num02S = request.getParameter("num02");
// Integer.parseInt("25") : 숫자형문자열 ==> 정수로 변환.
int num01=0; if(num01S!=null) num01 = Integer.parseInt(num01S);
int num02=0; if(num02S!=null) num02 = Integer.parseInt(num02S);
%>
<body>
	<h3>숫자 요청값 처리.</h3>
	<table>
		<tr><th><%=num01%> + <%=num02%> = <%=(num01+num02)%></th></tr>
	</table>
</body>
</html>