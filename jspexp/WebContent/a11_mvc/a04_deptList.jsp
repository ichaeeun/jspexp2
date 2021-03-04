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
		$("#regBtn").click(function(){
			location.href="${path}/deptInsert.do";
		});
		$(".data").on("dblclick",function(){
			var deptno = $(this).children().eq(0).text();
			//alert(deptno);
			location.href="${path}/deptDetail.do?deptno="+deptno;
		});		
		
	});
</script>
</head>
<body>
	<h3>부서정보검색</h3>
	<form method="post">
	<table>
		<tr><th>부서명</th>
			<td><input type="text" name="dname" value="${param.dname}"/></td></tr>
		<tr><th>지역</th>
			<td><input type="text" name="loc" value="${param.loc}"/></td></tr>
		<tr><td colspan="2">
			<input type="submit" value="검색"/>
			<input type="button" value="등록" id="regBtn"/>
			</td></tr>
	</table>
	</form>
	<table>
		<tr><th>부서번호</th><th>부서명</th><th>부서위치</th></tr>
		<c:forEach var="dept" items="${dlist}">
			<tr class="data">
				<td>${dept.deptno}</td>
				<td>${dept.dname}</td>
				<td>${dept.loc}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>