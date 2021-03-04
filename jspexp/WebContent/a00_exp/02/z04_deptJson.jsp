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
<c:set var="dlist" value="${dao.deptList2(dept)}"/>
[
	<c:forEach var="d" items="${dlist}" varStatus="sts">
		{"deptno":${empty d.deptno?0:d.deptno},
		 "dname":"${d.dname}","loc":"${d.loc}"}
		<c:if test="${!sts.last}">,</c:if>
	</c:forEach>
]