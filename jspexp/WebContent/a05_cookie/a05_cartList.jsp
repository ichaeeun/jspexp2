<%@page import="java.net.URLDecoder"%>
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
<%
	String ck[] = request.getParameterValues("ck");
	Cookie cks[] = request.getCookies();
%>
<body>
	<h3>장바구니리스트</h3>
	<form method="post">
	<table>
		<tr><th>ch</th><th>물건명</th><th>가격</th><th>갯수</th></tr>
		<%
		if(cks!=null){
			for(Cookie c : cks){
				// 쿠키는 default로 JSESSIONID를 가지고 있다.
				// 저장된 쿠키를 표기할 때는 JSESSIONID를 제외한다.
				if(!c.getName().equals("JSESSIONID")){
					if(ck!=null){
						for(String cn:ck){
							if(cn.equals(c.getName())){
								c.setMaxAge(0);
								response.addCookie(c);
							}
						}						
					}
					// 한개 이상의 value값을 처리할 때, 구분자를 이용하여 처리한다.
					// 구분자는 String객체에서 지원하는 split()를 이용한다.
					// 구분자를 표시할 때, java에서는 \(역슬래시)를 이용해서 처리한다.
					// 문자열에서 역슬래시를 표기할 때는 \한번 더 사용한다.
					String []pct = c.getValue().split("\\^");
		%>
		<tr><td><input type="checkbox" name="ck" value="<%=c.getName()%>"/></td>
				<td><%=URLDecoder.decode(c.getName()) %></td>
				<td><%=pct[0] %></td>
				<td><%=pct[1] %></td>
				</tr>
		<%
				}
			}
		}
		if(ck!=null){
			response.sendRedirect("a05_cartList.jsp");
		}
		%>
		<tr><td colspan="4"><input type="submit" value="장바구니삭제"/></td></tr>
	</table>
	</form>
	<h3 align="center" onclick="location.href='a05_cart.jsp'">
		장바구니 등록하기</h3>
</body>
</html>