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
//
<%--
js코드와 java 코드에 대한 처리는 순서를 생각하면서 처리하여야 한다. 
특히, 초기값이 없을 때는 감안하여서 문제가 발생하지 않게 처리하여야 한다. 
1. 요청값이나 모델데이터를 받아서 처리할 때, 공백에 대하여 감안하여 처리, 
2. var 숫자형 = ${모델숫자형}; 
	숫자형이나 boolean이라도 없을 때를 대비해서 ""으로 처리하여야 한다. 
	ex) var num = 25; 
		var num1 =;
3. 프로세스 흐름이 server(backend)단에서 만들어진 내용(html,js,css)을 최종적으로 	
	client(frontend)단에 전달하여, 소스코드가 화면에 만들어 진다는 사실을 잊지말자. 
	
--%>
	var proc = "${param.proc}";
	if(proc=="upt"){
		if(confirm("수정되었습니다.\n조회회면으로 이동하시겠습니까?")){
			location.href='${path}/emp.do';
		}
		
	}
	if(proc=="del"){
		alert("삭제되었습니다.");
		location.href='${path}/emp.do';
	}	

	$(document).ready(function(){
		$("#uptBtn").on("click",function(){
			if(confirm("수정하시겠습니까?")){
				// 유효성 check
				$("[name=proc]").val("upt");
				$("form").submit();
			}
		});
		$("#delBtn").on("click",function(){
			if(confirm("삭제하시겠습니까?")){
				// 유효성 check
				$("[name=proc]").val("del");
				$("form").submit();
			}
		});		
		
		
		
	});
</script>
</head>
<body>
	<h3>사원상세정보[${param.empno }]</h3>
	<form method="post">
		<input type="hidden" name="proc" value=""/>
	<table>
		<c:choose>
			<c:when test="${not empty emp.ename}">
				<tr><th>사원번호</th><td><input type="text" name="empno" 
				value="${emp.empno}"/></td></tr>
				<tr><th>사원명</th><td><input type="text" name="ename" value="${emp.ename}"/></td></tr>
				<tr><th>직책</th><td><input type="text" name="job" value="${emp.job}"/></td></tr>
				<tr><th>관리자번호</th><td><input type="text" name="mgr" value="${emp.mgr}"/></td></tr>
				<tr><th>입사일</th><td>
					
				<input type="text" name="hiredate_s" 
						value="<fmt:formatDate type='date' 
							pattern='yyyy-MM-dd' value='${emp.hiredate}'/>" 
						placeholder="yyyy-MM-dd"/></td></tr>
				<tr><th>급여</th><td><input type="text" name="sal" value="${emp.sal}"/></td></tr>
				<tr><th>보너스</th><td><input type="text" name="comm" value="${emp.comm}"/></td></tr>
				<tr><th>부서번호</th><td><input type="text" name="deptno" value="${emp.deptno}"/></td></tr>
			</c:when>	
			<c:otherwise>
				<tr><td colspan="2">데이터가 없습니다!</td></tr>
			</c:otherwise>
		</c:choose>
		<tr><td colspan="2">
			<input type="button" value="수정" id="uptBtn"/>
			<input type="button" value="삭제" id="delBtn"/>
			<input type="button" value="메인페이지이동" 
				onclick="location.href='${path}/emp.do'"/>
		
		</td></tr>
		
	</table>
	</form>
</body>
</html>