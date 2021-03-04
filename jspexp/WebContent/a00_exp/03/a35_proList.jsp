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
		$(".data").on("dblclick",function(){
			var pno =  $(this).children().eq(0).text();
			location.href="${path}/prodDetail.do?pno="+pno;
		});
		
		$("#regBtn").on("click",function(){
			if(confirm("등록하러 갈까요?")){
				$("form").attr("action","${path}/prodDetail.do");
				$("form").submit();
			}
		});
	});
</script>
</head>
<body>
	<h3>물건 조회</h3>
	<%--
	action의 default(설정되지 않았을 때)는 현재 화면을 호출한 jsp, controller
	을 처리해준다.
	ex) /product.do로 된 controller가 현재 jsp(view)를 호출하였으면,
	submit할 때도 다시 action="/product.do"로 호출하여 해당 controller에
	요청값을 전송한다.
	 --%>
	<form method="post">
	<input type="hidden" name="proc" value="insFrm"/>
	<table>
		<tr><th>물건명</th><td><input type="text" name="name"  
			value="${param.name }"/></td></tr>
		<tr><th>가격</th>
			<td>
			<input name="fr_price" 
				value="${param.fr_price }"/> ~ 
			<input  name="to_price" 
				value="${param.to_price }" />
			</td></tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="조회"/>
				<input type="button" value="등록" id="regBtn"/>
			</td></tr>		
	</table>
	</form>
	<table>
		<tr><th>번호</th><th>물건명</th><th>가격</th><th>갯수</th>
		<th>등록일</th><th>생산지(회사)</th><th>최근입고일</th><th>입고담당자</th></tr>
		<c:forEach var="prod" items="${plist}">
		<tr class="data">
			<td>${prod.pno}</td>
			<td>${prod.name}</td>
			<td>${prod.price}</td>
			<td>${prod.cnt}</td>
			<td><fmt:formatDate value="${prod.credte}"/></td>
			<td>${prod.company}</td>
			<td><fmt:formatDate value="${prod.incomedte}"/></td>
			<td>${prod.inmanager}</td>
		</tr>
		</c:forEach>
	</table>
	<%-- MVC 패턴은 jsp에서 시작(X), controller를 호출하면 jsp가 호출된다. --%>	
</body>
</html>