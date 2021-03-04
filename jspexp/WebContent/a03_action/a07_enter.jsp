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
<form method="post">
	나이:<input type="text" name="age"/><br>
	사이트:
	<select name="site">
		<option value="a07_site01.jsp">놀이공원-50,000원</option>
		<option value="a07_site02.jsp">뮤지엄-30,000원</option>
		<option value="a07_site03.jsp">아쿠아리엄-40,000원</option>
	</select><br>
	<input type="submit" value="입장"/>
</form>
<%
	String site=request.getParameter("site");
	if(site!=null){ // 초기 페이지에 에러 제거  ~16:45
%>
	<jsp:forward page="<%=site%>"></jsp:forward>
<%}%>
</body>
</html>