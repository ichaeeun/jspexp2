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
# <jsp:forward>액션 태그
1. 하나의 jsp페이지에서 다른 jsp 페이지로 요청 처리를
	전달할 때 사용된다.
2. request, response를 포함 시켜 전송한다.	
 --%>
<body>
	<h2>권한에 따른 페이지 전환</h2>
	<form method="post">
		권한:<select name="auth">
				<option>관리자</option>
				<option>일반사용자</option>
				<option>방문자</option>
			</select><br>
		아이디:<input type="text" name="id"/><br>
		<input type="submit" value="로그인"/>
	</form>
<%
	String auth = request.getParameter("auth");
	if(auth!=null){
		String page1="";
		if(auth.equals("관리자")) page1="a06_admin.jsp";
		if(auth.equals("일반사용자")) page1="a06_normal.jsp";
		if(auth.equals("방문자")) page1="a06_quest.jsp";
%>
		<%-- 요청값으로 입력한 데이터도 request에 의해서 함께
		전달할 수 있다.  --%>
		<jsp:forward page="<%=page1%>"/>
		<%--
		RequestDispatcher rd= request.getRequestDispatcher("페이지");
		rd.forward(request, response);를 포함된 것과 동일하게
		처리한다.
	
		
		
		 --%>		
<%		
	}
%>
<%--
ex) 사이트별 이동 및 나이에 따른 입장료 할인처리  a07_enter.jsp
나이:[     ]   - 3미만 65이상 무료, 3~7 50%  8~13 40% 14-20 30%
사이트: select
[놀이공원-50,000원]   a07_site01.jsp 놀이공원
[뮤지엄-30,000원]    a07_site02.jsp  뮤지엄
[아쿠아리엄-40,000원] a07_site03.jsp  아쿠아리엄
                   a07_stieCom.jsp 나이에 따른 할인율 계산
   [입장] 
@@@에 오신 것을 환영합니다.
나이 @@  할인율 @@  입장료 @@@원입니다. ~16:30
 --%>	
</body>
</html>