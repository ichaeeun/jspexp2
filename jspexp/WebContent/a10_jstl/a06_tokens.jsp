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
# forTokens 
1. 구분자에 의해서 데이터를 처리하는 것을 말한다.
2. 기본 형식
	<c:forTokens var="변수명" items="구분자포함데이터"
		delims="구분자" varStatus="sts변수"
		${변수명} : 단위 데이터
	특정한 컬럼의 데이터 사과^바나나^딸기	
3. 속성
	1) var : 구분자에 의해서 추출된 하나의 데이터
	2) items :구분자가 있는 문자열
	3) delims : 구분자 
	4) varStatus : index, count, first, last 등의
		효과적인 변수를 활용 가능
--%>
</script>
</head>
<body>
	<h3>구분자처리</h3>
	<c:forTokens var="color" items="red, green, blue" 
		delims=",">
		<h2>${color}</h2>	
	</c:forTokens>
<%--ex) 과일명  사과;오렌지;수박;딸기;  를 구분자로 처리하여 2X2테이블에 출력하세요.
	
 --%>	
 	<c:set var="cnt" value="1"/>
 	<table>
	<c:forTokens var="fruit" items="사과;오렌지;수박;딸기" delims=";" 
		varStatus="sts">
		<c:if test="${cnt%2==1}"><tr></c:if>
			<td>${fruit}[${sts.index}]</td>
		<c:if test="${cnt%2==0}"></tr></c:if>
		<c:set var="cnt" value="${cnt+1}"/>
	</c:forTokens> 
	</table>
	<%--

	<c:forEach var="fruit" items="사과;오렌지;수박;딸기" delims=";" 
		varStatus="sts">
		<c:if test="sts.count%2==1"><tr></c:if>
		<td>${fruit}${sts.count}</td>
		<c:if test="sts.count%2==0"></tr></c:if>
	</c:forEach>
	
	
	<table>
		<tr><td>사과1</td><td>오렌지2</td></tr>
		<tr><td>수박3</td><td>딸기4</td></tr>
		<tr><td>수박5</td><td>딸기6</td></tr>
		<tr><td>수박7</td><td>딸기8</td></tr>
		<tr><td>수박9</td><td>딸기10</td></tr>
		<tr><td>수박11</td><td>딸기12</td></tr>
	</table>
	
	sts.count기준으로 1, 3일 때, 시작 <tr>을 추가 
		홀수일때, tr을 추가  sts.count%2==1 나머지연산자로 나머지가 1일 경우에 tr추가.
		ex) 3X3일 때는 sts.count%3==1
		ex) 4X4일 때는 sts.count%4==1
	sts.count기준으로 2, 4일 때, 닫는 </tr>을 추가.
		짝수일때, </tr>을 추가.. sts.count%2==0 
		나머지연산자로 나머지가 0일 경우에 </tr>추가.
		ex) 3X3일 때는 sts.count%3==0
		ex) 4X4일 때는 sts.count%4==0		
	
	
	
	
	<tr>
	<c:forEach var="fruit" items="사과;오렌지;수박;딸기" delims=";">
		<td>${fruit}</td>
	</c:forEach>
	</tr>
	<table>
		<tr><td>사과1</td><td>오렌지2</td><td>수박3</td><td>딸기4</td></tr>
	</table>
	
	<c:forEach var="fruit" items="사과;오렌지;수박;딸기" delims=";">
		<tr><td>${fruit}</td></tr>	
	</c:forEach>
	
	<table>
		<tr><td>사과1</td></tr>
		<tr><td>오렌지2</td></tr>
		<tr><td>수박3</td></tr>
		<tr><td>딸기4</td></tr>
	</table>
		
	
	
	
	 --%>
	
	
	
	
	
	
 
 
</body>
</html>