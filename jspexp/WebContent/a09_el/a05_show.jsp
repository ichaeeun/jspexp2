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

	$(document).ready(function(){
		$("h3").text("등록 내용");
	});
</script>
</head>
<body>
	<h3></h3>
	<%-- use Bean을 통해서 session범위로 저장되어 있는 내용은
	el을 이용하서 바로 호출하여 사용할 수 있다. ${bean아이디.속성} --%>
	<table>
		<tr><th>도서명</th><td>${bk.title}</td></tr>
		<tr><th>저자</th><td>${bk.writer}</td></tr>
		<tr><th>출판사</th><td>${bk.publisher}</td></tr>
	</table>
</body>
</html>