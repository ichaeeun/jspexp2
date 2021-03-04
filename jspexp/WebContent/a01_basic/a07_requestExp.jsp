<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<%--
ex1)
http://localhost:7080/jspexp/a01_basic/a07_requestExp.jsp?name=홍길동&age=25
	실행했을 때, 화면에 이름과 나이를 출력되게 하세요. ~ 15:05
ex2) a07_requestExp.jsp?hobby=독서&hobby=pc게임&hobby=여행
	로 실행시	
	취미 내용이 출력되게 하세요.	~15:13
ex3) a08_formExp.jsp에서 위에 query string으로 넘겨주는 것을
	form안에 등록하고, action값으로 a07_requestExp.jsp설정해서
	이름, 나이, 선택된 취미 내용이 출력되게하세요.  ~ 15:25	
 --%>
	<%
	String name = request.getParameter("name");
	if(name==null) name="";
	String ageS = request.getParameter("age");
	if(ageS==null) ageS="0";
	int age = Integer.parseInt(ageS);
	String []hbs = request.getParameterValues("hobby");	
	%>
	<h3>요청값 처리 연습</h3>
	<table>
		<tr><th>이름</th><td><%=name%></td></tr>
		<tr><th>나이</th><td><%=age%></td></tr>
		<%
		  if(hbs!=null){
		  	for(String hb:hbs){%>
				<tr><th>취미</th><td><%=hb%></td></tr>
		<%	}
		  }
		 %>
	</table>
</body>
</html>