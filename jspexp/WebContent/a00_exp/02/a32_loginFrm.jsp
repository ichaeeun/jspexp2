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
		var isSuccess="${isSuccess}";
		///alert(isSuccess);
		if(isSuccess=="false"){
			alert("${param.id}님 로그인 실패");
		}		
		$("[name=id]").focus();
	});
</script>
</head>
<body>
	<h3>로그인</h3>
	<form method="post">
	<table>
		<tr><th>아이디</th><td><input type="text" name="id"/></tr>
		<tr><th>패스워드</th><td><input type="password" name="pass"/></tr>
		<tr><td colspan="2"><input type="submit" value="로그인"/></td></tr>
	</table>
	</form>
</body>
</html>