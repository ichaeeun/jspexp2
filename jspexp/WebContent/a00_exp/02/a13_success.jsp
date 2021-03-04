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
1. 로그인 성공 페이지..
	Member m =(Member)session.getAttribute("mem");
	if(m!=null){
	
		<%=m.getId()%>님 로그인 성공입니다.
		<input type="button" value="로그아웃" onclick="logout()"/>
	}else{
		로그인 하세요 처리 페이지..
	}		
	<script>
		function logout(){
			if(confirm("로그아웃하시겠습니까?")){
				location.href=""a14_logout.jsp; (로그아웃페이지)
			}
		}
--%>
<body>
<%
	Member m =(Member)session.getAttribute("mem");
	log("객체:"+m);

	boolean isLogin=false;
	if(m!=null){
		log("객체:"+m.getId());
		isLogin=true; // 정상 로그인..
%>
		<h3><%=m.getId()%>님 로그인 성공입니다.</h3>
		<input type="button" value="로그아웃" onclick="logout()"/>	
<%	}
%>
	<script type="text/javascript">
		function logout(){
			if(confirm("로그아웃하시겠습니까?")){
				location.href="a14_logout.jsp";// (로그아웃페이지)
			}
		}
		// js변수로 java 설정..
		// 숫자형/boolean 그대로 expression으로 할당, 
		// 문자열은 ''/""사이로 할당.
		var isLogin = <%=isLogin%>;
		if(!isLogin){
			alert("로그인이 안되었습니다\n로그인 페이지 이동");
			location.href="a11_0205.jsp";
		}
	
	</script>
</body>
</html>