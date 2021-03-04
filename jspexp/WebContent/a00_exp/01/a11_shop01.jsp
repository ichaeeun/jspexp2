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
	function buy(){
		// js로 페이지 이동
		location.href="a12_shop02.jsp";
	}
</script>
</head>
<%--
[중] 2. 장바구니(session범위)에 담은 Product객체가 a01_shop1.jsp(초기설정) 후,  
		a02_shop2.jsp를 호출할 때마다 구매갯수가 계속 1씩 증가하게 처리하세요.
         Product(물건명,가격,갯수)-a01_shop1.jsp에서 초기 설정
페이별로 session으로 설정된 cart를 이용해서 물건을 구매하고, 장바구니 내역에서
최종적으로 결재하는 처리의 기초 내용이다.
1. session 처리할 Product객체 생성 
2. a01_shop1.jsp에 해당 객체 생성과 session값을 설정.
	a02_shop2.jsp로 이동, a href, location.href로 이동 처리. 
3. a02_shop2.jsp에서 저장된 Product객체로 설정된 session 값 가져오기
4. a02_shop2.jsp를 호출할 때 마다.
	session저장된 Product 객체를 가져오고, 물건 갯수를 증가한 후, 다시
	session에 저장처리.
	

 --%>
<%
	session.setAttribute("prod", new Product("사과",2000,10));
%> 
<body>
	<h3>물건 session 설정</h3>
	<h3 onclick="buy()">물건 구매</h3>
	<%
	// 설정된 session 확인
	Product prod = (Product)session.getAttribute("prod");
	%>
	<table>
		<tr><th>물건명</th><td><%=prod.getName()%></td></tr>
		<tr><th>가격</th><td><%=prod.getPrice()%></td></tr>
		<tr><th>갯수</th><td><%=prod.getCnt()%></td></tr>
	</table>
</body>
</html>