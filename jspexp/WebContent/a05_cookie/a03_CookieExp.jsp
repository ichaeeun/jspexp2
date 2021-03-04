<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
    import="java.net.*" 
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
ex) 사원 id 등록
	아이디[  ] 이름[   ] [사원등록]
	==> 아이디는 쿠키의 name,  이름 쿠키의 value로
	등록하여 다음 페이지에서
	현재 등록된 사원 리스트 출력.. 
	아이디   이름
	@@@    @@
	@@@    @@
	@@@    @@
	[계속등록] : 등록페이지로 이동 처리. ~11:45
	

 --%>
<body>
	<h3>사원 ID 등록</h3>
	<form method="post">
	<table>
		<tr><th>아이디</th><td><input name="id"/></td></tr>
		<tr><th>이름</th><td><input name="name"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="사원등록"/></td></tr>
	</table>
	</form>
	<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	if(id!=null){
		Cookie c1 = new Cookie(URLEncoder.encode(id),
								URLEncoder.encode(name));
		response.addCookie(c1);
		response.sendRedirect("a04_list.jsp");
	}
	
	%>
</body>
</html>