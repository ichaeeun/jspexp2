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
# <jsp:include>액션 태그와 include 디렉티브 비교
				<jsp:include>      	include 디렉티브<%@ include file=""%>
1. 처리시간 		요청시간에 처리       	jsp파일을 자바 소스로 변환
2. 기능단위        각각의 jsp로 따로    	포함된 파일을 함께 컴파일
				사용된다.		   		servlet는 하나의 파일
				servlet수는 포함
				파일따로 
3. 데이터전달  	    <jsp:param>을 이용	   같은 파일이기 때문에 하나의
				request.getParameter   변수로 사용가능하다.
				
							
4. 용도 			화면의 레이아웃의 	    다수의 jsp페이지에서 공통의
				일부분을 모듈화할때	    사용변수를 지정하는 코드나
									저작권과 같은 문장를 포함할 때
									

 --%>
<body>
<h2>메인 화면</h2>
<%
String name="홍길동";
%>
<%@ include file="a04_sub.jsp"%>
<h3>나이는 <%=age %></h3>
<h3>하단 화면</h3>
</body>
</html>