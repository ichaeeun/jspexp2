<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<% request.setCharacterEncoding("UTF-8");%>    
<jsp:useBean id="dao" class="jspexp.a03_database.A04_MemberDao"></jsp:useBean>
<c:set var="hasMember" value="${dao.hasMember(param.id)}"/>
{"hasMember":${hasMember}}
<%-- 
{"hasMember":${dao.hasMember(param.id)}}
dao의 hasMember()메서드의 리턴값을 boolean이기에 가능하다.
--%>