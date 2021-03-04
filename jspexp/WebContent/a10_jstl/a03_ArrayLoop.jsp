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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" 
	href="<%=path%>/a00_com/a00_com.css">
<style>

</style>
<script type="text/javascript" 
  src="<%=path%>/a00_com/jquery-3.5.1.js"></script>
<script type="text/javascript">
<%--
# 배열형 반복처리 속성
1. <c:forEach var="단위데이터변수" 
	items="${배열형데이터}" varStatus="변수명">
	<c:forEach var="str" items="${arry}" varStatus="sts">
		${str}
		${sts.index} : 0부터 시작하여 증가하는 index번호 출력
		${sts.count} : 1부터 시작하여 증가하는 카운트번호 출력
		${sts.first} : 해당 반복의 첫번째인지 여부 boolean
			ex) <c:if test="${sts.first}">
		${sts.last} : 해당 반복의 마지막인지 여부 boolean
			ex) <c:if test="${sts.last}">
 vs) int idx=0;
     int count=1;
 	 for(String str:arry){
  		if(idx==0){ // 첫번째데이터
  		
  		}
  		<h2><%=str%></h2>
  		if(idx+1==arry.length){ // 마지막데이터
  		
  		}
  		idx++;
  		count++;
     }
	
--%>
	$(document).ready(function(){
		
	});
</script>
</head>
<body>
<%
	pageContext.setAttribute("fruits",new String[]{"사과","바나나","딸기"});
%>
	<h3>varStatus변수와 함께 하는 forEach구분</h3>
	<table>
		<tr>
			<th>count</th><th>index</th>
			<th>첫번째값?</th><th>마지막값?</th><th>단위데이터</th>
		</tr>
		<c:forEach var="fruit" items="${fruits}" varStatus="sts">
		<tr>
			<td>${sts.count}</td>
			<td>${sts.index}</td>
			<td>${sts.first}</td>
			<td>${sts.last}</td>
			<td>${fruit}</td>
		</tr>
		</c:forEach>
	</table>
	<%--
	ex) h4 배열로 무지개 색상(7개)을 선언한 후, 출력하되,
			첫번째와 마지막의 배경색상은 노랑색으로 처리하세요.. ~11:40
	 --%>
<%
pageContext.setAttribute("rainbow", 
		new String[]{"red","orange","yellow","green","blue","navy","purple"});
%>
	<c:forEach var="color" items="${rainbow}" varStatus="sts">
		<c:choose>
			<c:when test="${sts.first or sts.last}">
				<h4 align="center" style="background:yellow;color:${color}">
			</c:when>
			<c:otherwise>
				<h4 align="center" style="color:${color}">
			</c:otherwise>
		</c:choose>
		${color}</h4>
	</c:forEach>		 
</body>
</html>


