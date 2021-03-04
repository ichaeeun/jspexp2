<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.a03_database.A01_Dao"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<% request.setCharacterEncoding("UTF-8");%>    
<jsp:useBean id="dao" class="jspexp.a03_database.A01_Dao"></jsp:useBean>
<c:set var="empList" value="${dao.empList2(param.ename, param.job)}"/>
{"tot":${empList.size()},"empList":[
	<c:forEach var="emp" items="${empList}" varStatus="sts">
		{"empno":${emp.empno},"ename":"${emp.ename}","job":"${emp.job}",
		 "mgr":${emp.mgr},"hiredate":"${emp.hiredate}","sal":${emp.sal},
		 "comm":${emp.comm },"deptno":${emp.deptno} }
		<c:if test="${!sts.last}">,</c:if>
	</c:forEach>
]}
<%-- 
# json 데이터 형식
1. 기본 객체 선언 
	{}
2. 배열 션언
	[]
3. 객체 안에 여러 속성 선언.
	{"속성":"문자열","속성":숫자, "속성":boolean, "속성":function(){},
	"속성":{객체}, "속성",[배열데이터]};
	ex)
	{"name":"홍길동","age":25, "isMarried":false,"show":function(){},
	 "girlfriend":{"name":"김현아","age":24},
	 "friendNames":["이철수","김현우","홍길동"]}
4. 가져온 데이터 json 유효성 check	
	json validator 
	https://jsonformatter.curiousconcept.com/#
	
	
	
	
	
	
	
		
	


--%>