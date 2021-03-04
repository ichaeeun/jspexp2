<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
    import="jspexp.z01_vo.Member" 
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
	<h3>request</h3>
	<a href="a07_sessionScope.jsp">session 범위 이동</a>
	<table>
		<tr><th>page</th><td><%=pageContext.getAttribute("show")%></td></tr>
		<tr><th>request</th><td><%=request.getAttribute("prodName")%></td></tr>
		<tr><th>session</th><td>
		<%
		/*
		1. setAttribute를 설정할 때, 객체인 경우
			session.setAttribute("key", Object );
			1) String인 경우에는 하위에 있는 메서드를 호출하지 않는 한
				null로 표기되어 에러를 발생하지 않는다.
			2) 일반 객체의 경우에는 메서드를 호출하여 NullPointerException을 
				발생하기에 반드시 사전에 if(조건문)으로 예외 처리를 하여야 한다.
				stack  	heap
				참조변수   실제객체			
				참조변수.메서드() 호출 - heap객체가 없는 상황에서는 NullPointerException
				과 함께 프로그램이 중단되어 버린다.
		*/
		
		
		  if(session.getAttribute("m01")!=null){
			  Member m01 = (Member)session.getAttribute("m01");
			  m01.setPoint(m01.getPoint()+1);
			  session.setAttribute("m01",m01);
		%>
		<%=m01.getId()%>:<%=m01.getPoint()%>
		<%	}%>
		</td></tr>
		<tr><th>application</th><td><%=application.getAttribute("DBServer")%></td></tr>
	</table>
</body>
</html>