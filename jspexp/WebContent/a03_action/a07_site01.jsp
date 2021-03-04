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
<body>
<%@ include file="a07_siteCom.jsp" %>
<%int tot=50000-(int)(50000*dis); %>
	<h2>놀이공원에 오신것을 환영합니다.</h2>
	<h3>기본 입장료(50,000원)</h3>
	<h3>나이(<%= age%>)</h3>
	<h3>할인율(<%= (int)(dis*100)%>%)</h3>
	<h3>최종입장료(<%= tot%>원)</h3>
</body>
</html>