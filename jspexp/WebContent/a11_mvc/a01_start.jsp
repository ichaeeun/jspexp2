<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" 
	href="${path}/a00_com/a00_com.css">
<style>

</style>
<script type="text/javascript" 
  src="${path}/a00_com/jquery-3.5.1.js"></script>
<script type="text/javascript">
<%--
 
 
--%>
//
	$(document).ready(function(){
		
	});
</script>
</head>
<body>
	<h3>view단 입니다.</h3>
	<table>
		<col width="50%">
		<tr><th>이름</th><td>${stud.name}</td></tr>
		<tr><th>국어</th><td>${stud.kor}</td></tr>
		<tr><th>영어</th><td>${stud.eng}</td></tr>
		<tr><th>수학</th><td>${stud.math}</td></tr>
		<tr><th>총점</th><td>${stud.tot}</td></tr>
		<tr><th>평균</th><td>${stud.avg}</td></tr>
	</table>
</body>
</html>