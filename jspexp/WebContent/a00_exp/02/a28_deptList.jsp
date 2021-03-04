<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<% request.setCharacterEncoding("UTF-8");%>    
	<jsp:useBean id="dao" class="jspexp.a03_database.A02_DeptDao"/>
	<jsp:useBean id="dept" class="jspexp.z01_vo.Dept"/>
	<jsp:setProperty property="*" name="dept"/>
	<table>
		<tr><th>부서번호</th><th>부서명</th><th>부서위치</th></tr>
		<c:forEach var="d" items="${dao.deptList2(dept)}">
		<tr><td>${d.deptno}</td><td>${d.dname}</td><td>${d.loc}</td></tr>
		</c:forEach>
	</table>
