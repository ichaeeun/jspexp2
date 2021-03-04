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
	var ckInsert = "${param.ename}";
	if( ckInsert!="" ){
		if(confirm("등록했습니다\n조회화면으로 이동하시겠습니까?")){
			location.href='${path}/emp.do';
		}
	}
	$(document).ready(function(){
		
		
		$("#insBtn").on("click",function(){
			if($("[name=ename]").val()==""){
				alert("사원명 공백데이터 입력입니다")
				$("[name=ename]").focus();
				return false;
			}
			if($("[name=mgr]").val()==""){
				alert("관리자 공백데이터 입력입니다")
				$("[name=mgr]").focus();
				return false;
			}else{
				if(isNaN( $("[name=mgr]").val())){
					alert("관리자 번호는 숫자형이어야 합니다.")
					$("[name=mgr]").val("");
					$("[name=mgr]").focus();
					return false;					
				}
			}
			
			$("form").submit(); // form의 모든 데이터 전송 처리.
		});
	});
</script>
</head> 
<body>
	<h3>사원등록페이지</h3>
	<form method="post">
	<table>
		<tr><th>사원명</th><td><input type="text" name="ename"/></td></tr>
		<tr><th>직책</th><td><input type="text" name="job"/></td></tr>
		<tr><th>관리자</th><td><input type="text" name="mgr"/></td></tr>
		<tr><th>입사일</th><td><input type="text" name="hiredate_s" placeholder="YYYY-MM-DD"/></td></tr>
		<tr><th>급여</th><td><input type="text" name="sal"/></td></tr>
		<tr><th>보너스</th><td><input type="text" name="comm"/></td></tr>
		<tr><th>부서번호</th><td><input type="text" name="deptno"/></td></tr>
		<tr><td colspan="2"><input type="button" id="insBtn" value="등록"/>
			<input type="button" value="메인페이지이동" 
				onclick="location.href='${path}/emp.do'"/>
			<%--
			${path}는 context명으로 설정된다. tomcat과 연동한 프로젝트명으로
			설정되는데, 변경이 일어날 때는 대비하여 사용한다.
			${path}/emp.do : servlet으로 된 controller명
			${path}/z01_img/show.jpg : WebContent하위 폴드에 z01_img로 접근하게 해준다.
			
			
			 --%>	
		</td></tr>
	</table>
	</form>
</body>
</html>