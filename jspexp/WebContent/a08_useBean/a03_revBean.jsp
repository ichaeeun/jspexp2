<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"
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
request.getParameter("name")
?name=사과&price=3000&cnt=5
setName(String name) 이 있으면 자동으로 해당 요청key, set property를 확인해서 자동으로 할당.
setPrice(int price)
setCnt(int c)  property에 해당하는 메서드가 있으면 자동할당 된다.
--%>
<!-- 1. 객체 생성 -->
<jsp:useBean id="p01" class="jspexp.z01_vo.Product" scope="session"></jsp:useBean>
<!-- 2. setProperty에 의해서 요청값을 해당객체에 저장하기.
		1) property="*" 모든 setXXX메서드를 사용한다
		2) 요청 key와 property명이 동일할 때, type이 같으면 할당이 자동으로 된다.
		&name=사과
		request.getParameter("name")
		bean class로 선언한 객체가 메서드 중에
		setName(String name) 형식으로 property가 name이고 해당 데이터를 할당하는
			형식과 동일할 때, 해당 메서드를 통해서 데이터가 할당이 된다.
 -->
<jsp:setProperty property="*" name="p01"/>

<body>
	<h3>저장된 Person</h3>
	<table>
		<tr><th>물건명</th><td><%=p01.getName() %></td></tr>
		<tr><th>가격</th><td><%=p01.getPrice() %></td></tr>
		<tr><th>갯수</th><td><%=p01.getCnt() %></td></tr>
	</table>
</body>
</html>