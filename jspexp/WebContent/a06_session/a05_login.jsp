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
<%--
# session 처리 로그인
1. 로그인 화면 구현(a05_login.jsp)
2. 요청값 받아서 session에 할당.(a05_login.jsp)
	기본 member객체에 point는 1000로 설정.
	session 설정 후, session값 확인페이지 이동
3. session 값 확인 페이지(a06_mem_sess.jsp)
	session이 없을 때, session값 없습니다. 로그인 페이지 이동 메시지 표기.
	페이지를 호출할 때, 마다 point1 씩 증감..
	id : @@@ point : @@@
	[로그아웃 클릭] ==> session 종료 페이지 이동
4. session 종료 페이지(a07_end_sess.jsp)
	invalidate()호출.
	다시 로그인 
	session 확인 페이지.. 
	
	
--%>
<%
	String id = request.getParameter("id");
	if(id!=null){ // 초기 페이지와 구분..
		session.setAttribute("mem",new Member(id,1000));
		response.sendRedirect("a06_mem_sess.jsp");
	}
%>
<body>
	<h3>로그인(session)</h3>
	<form method="post"> 
	<!-- 다른 페이지에서 요청값을 처리할 때는 
	action="요청을 처리할 페이지"를 활용한다. -->
	<table>
		<tr><th>아이디</th>
			<td><input type="text" 
				name="id"/></td></tr>
		<tr><td colspan="2">
			<input type="submit" value="로그인"/></td></tr>
	</table>
	</form>
</body>
</html>