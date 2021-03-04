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
	<!-- top.jsp에 로그인한 아이디를 넘겨줌 -->
	<jsp:include page="a03_top.jsp">
		<jsp:param value="홍길동" name="id"/>
	</jsp:include>
	<hr>
	<table >
		<col width="20%">
		<col width="80%">
		<tr>
		<td >
			<!-- 왼쪽 메뉴에 선택한 index값을 넘겨줌 -->	
			<jsp:include page="a03_left.jsp"></jsp:include>
		</td>
		<td>
			<!--  받은 text를 출력 처리.. -->
			<h3 align="center">메인!</h3>
		</td>
		
		</tr>
	</table>	
</body>
</html>