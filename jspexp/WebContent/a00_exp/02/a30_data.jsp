<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<% request.setCharacterEncoding("UTF-8");%>    
<jsp:useBean id="dao" class="jspexp.a03_database.A03_ShopDao"/>
<c:set var="prod" value="${dao.getProd(param.pno)}"/>
{"pno":${empty prod.pno?0:prod.pno},"name":"${prod.name}",
 "price":${empty prod.price?0:prod.price},"cnt":${empty prod.cnt?0:prod.cnt},
 "credte":"${prod.credte}","company":"${prod.company }",
 "incomedte":"${prod.incomedte}","inmanager":"${prod.inmanager}"}
