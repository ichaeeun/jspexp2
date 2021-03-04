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
<%
	Member m = (Member)session.getAttribute("mem");
	boolean hasSession =false;
	if(m!=null){
		hasSession =true;
	}
%>
<script>
	// 서버프로그램과 client와의 만남..
	// 1. 숫자/boolean   바로 expression으로 할당.
	// 2. 문자열  "", ''사이에 expression으로 할당.
	var hasSession = <%=hasSession%>;
	if(!hasSession){
		alert("세션이 없습니다.\n로그인페이지로 이동하겠습니다.")
		location.href="a05_login.jsp";
	}
</script>
</head>
<%--
	session이 없을 때, session값 없습니다. 로그인 페이지 이동 메시지 표기.
	페이지를 호출할 때, 마다 point1 씩 증감..
	id : @@@ point : @@@
	[로그아웃 클릭] ==> session 종료 페이지 이동
--%>
<body>
	<%if(hasSession){
	%>
	<h3>로그인 정보</h3>
	<table>
		<tr><th>아이디</th><td><%=m.getId()%></td></tr>
		<tr><th>포인트</th><td><%=m.getPoint()%></td></tr>
		<tr><td colspan="2">
			<input type="button" value="로그아웃" 
			onclick="location.href='a07_end_sess.jsp'"/></td></tr>
		
	</table>
	<% m.setPoint(m.getPoint()+10);
	} %>
</body>
</html>