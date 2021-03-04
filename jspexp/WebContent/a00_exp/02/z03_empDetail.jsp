<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();
%>    

	<jsp:useBean id="dao" class="jspexp.a03_database.A01_Dao"/>
	<c:set var="emp" value="${dao.getEmp(param.empno)}"/>
	<h3>사원 상세화면</h3>
	<table>
		<col width="20%"><col width="30%">
		<col width="20%"><col width="30">
		<tr><th>사원번호</th><td>${emp.empno}</td><th>사원명</th><td>${emp.ename}</td></tr>
		<tr><th>관리자번호</th><td>${emp.mgr}</td><th>직책</th><td>${emp.job}</td></tr>
		<tr><th>급여</th><td>${emp.sal}</td><th>보너스</th><td>${emp.comm}</td></tr>
		<tr><th>입사일</th><td>${emp.hiredate}</td><th>부서번호</th><td>${emp.deptno}</td></tr>
		<tr><td colspan="4">
				<input type='button' value='창닫기' onclick='closeEmp()'/>
			</td></tr>
	</table>
