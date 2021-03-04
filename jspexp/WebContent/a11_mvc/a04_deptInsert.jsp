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
	var ckInsert = "${param.dname}";
	if( ckInsert!="" ){
		if(confirm("등록했습니다\n조회화면으로 이동하시겠습니까?")){
			location.href='${path}/dept.do';
		}
	}

	$(document).ready(function(){
		
	});
</script>
</head>
<body>
	<h3>부서정보등록</h3>
	<form method="post">
	<table>
		<tr><th>부서번호</th><td><input type="text" name="deptno"/></td></tr>
		<tr><th>부서명</th><td><input type="text" name="dname"/></td></tr>
		<tr><th>위치</th><td><input type="text" name="loc"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="부서등록"/>
				<input type="button" value="메인화면으로"
			onclick="location.href='${path}/dept.do'"/>
		</td></tr>
	</table>
	</form>
</body>
</html>