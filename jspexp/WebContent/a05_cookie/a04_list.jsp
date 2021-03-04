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
<body>

<% 
	String []delMem = request.getParameterValues("delMem");
	// check가된 쿠키의 name을 배열로 받는다.
	//  submit를 클릭시, delMan = {"goodMan","himan"};
	
	Cookie[] cks = request.getCookies();
%>
<%--
# 쿠키값의 삭제
1. 서버에서 삭제를 할 수 없고, 서버에는 삭제할 대상이 되는 쿠키의
	생명 주기를 0으로 설정하고, addCookie(삭제대상쿠키)로 client에
	전송하면, 이것을 받은 client(브라우저)에서는 쿠키를 삭제하게 된다.

--%>

	<h3>등록된 회원</h3>
	<form method="post">
	<table>
		<tr><th>선택</th><th>아이디</th><th>이름</th></tr>
		<%for(Cookie c:cks){
			if(delMem!=null){
				for(String mem:delMem){
					// check되어 넘겨온 값과 쿠키의 name이 같으면 
					if(	mem.equals( c.getName() ) ){
						// 생명 주기를 0으로 설정
						c.setMaxAge(0);
						// 삭제할 cookie를 client로 전송..
						response.addCookie(c);
					}
				}
			}			
			
			if(!c.getName().equals("JSESSIONID")){
		%>
		<tr><td><input type="checkbox" name="delMem" 
					value="<%=c.getName()%>"/></td>
			<td><%=URLDecoder.decode(c.getName()) %></td>
			<td><%=URLDecoder.decode(c.getValue()) %></td></tr>
		<%	}
		}
		%>
		<tr><td colspan="3">
				<input type="submit" value="회원삭제"/></td></tr>
	</table>
	</form>
	<h3 align="center"
		onclick="location.href='a03_CookieExp.jsp'">
		회원등록 하러가기</h3>
	<%
	// 삭제할 내용이 있으면 현재 페이지를 재호출하여,
	// 쿠키 삭제가 반영된 페이지 내용을 확인한다.
	if(delMem!=null){
		response.sendRedirect("a04_list.jsp");
	}
	
	
	%>	
</body>
</html>