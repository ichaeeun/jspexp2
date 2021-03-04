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
		$("#regBtn").on("click",function(){
			// location.href="${path}/empInsert.do";
			// # jquery에서는 js코드를 사용 가능
			$(location).attr("href","${path}/empInsert.do");
		});
		$(".data").on("dblclick",function(){
			// $(this) : 클릭한 class data를 지정
			// .children() : 바로 밑 하위 td들을 지정.
			// .eq(0): tr하위 td의 첫번째.
			var empno = $(this).children().eq(0).text();
			location.href="${path}/empDetail.do?empno="+empno;
		});
	});
</script>
</head>
<body>
	<h3>사원 정보 조회(MVC)</h3>
	<form method="post">
	<table>
		<tr><th>사원명</th>
			
			<td><input type="text" name="ename" value="${param.ename}"/></td></tr>
			<%-- 데이터를 입력후, 요청 후 다시 화면에서 확인시 반드시 필요. --%>
		<tr><th>직책명</th>
			<td><input type="text" name="job" value="${param.job }"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"/>
			<input type="button" value="등록" id="regBtn"/>
		</td></tr>
	</table>
	</form>
	<table>
		<tr><th>사원번호</th><th>사원명</th>
			<th>직책명</th>
			<th>급여</th>
			<th>부서번호</th>
		</tr>
		<%--
		controller에서 넘겨온 model데이터 empList
		request.setAttribute("empList", dao.empList2(...));
		 --%>
		<c:forEach var="emp" items="${empList}">
		<tr class="data">
			<td>${emp.empno}</td>
			<td>${emp.ename}</td>
			<td>${emp.job}</td>
			<td>${emp.sal}</td>
			<td>${emp.deptno}</td></tr>
		</c:forEach>	
	</table>	

</body>
</html>