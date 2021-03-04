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
<jsp:useBean id="dao" class="jspexp.a03_database.A04_MemberDao"></jsp:useBean>
<c:set var="memberList" value="${dao.memberList(param.id, param.name)}"/>
<body>
	<h3>회원 정보</h3>
	<h4>${memberList.size()}건</h4>
	<table>
		<tr><th>아이디</th>
			<th>패스워드</th>
			<th>이름</th>
			<th>포인트</th>
			<th>주소</th>
			<th>등록일</th>
			<th>권한</th>
		</tr>
		<c:forEach var="mem" items="${memberList}">
		<tr><td>${mem.id}</td>
			<td>${mem.pass}</td>
			<td>${mem.name}</td>
			<td>${mem.point}</td>
			<td>${mem.address}</td>
			<td>${mem.regdte}</td>
			<td>${mem.auth}</td></tr>
		</c:forEach>	
	</table>
</body>
</html>