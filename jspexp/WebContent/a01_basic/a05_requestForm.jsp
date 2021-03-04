<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script>
	window.onload=function(){
		
	};
</script>
</head>
<body>
<%--
GET방식으로 전송
	a06_requestRev.jsp?name=홍길동&address=서울신림동&pet=dog&pet=cat&pet=pig
POST방식으로 전송
	form속성 method="post"
	url 주소 : a06_requestRev.jsp
	전송되는 데이터 : name=홍길동&address=서울신림동&pet=dog&pet=cat&pet=pig
 --%>
	<h3>요청값 처리</h3>
	<form action="a06_requestRev.jsp" method="post">
	이름: <input type="text" name="name" size="10"> <br>
	주소: <input type="text" name="address" size="30"> <br>
	좋아하는 동물:
		<input type="checkbox" name="pet" value="dog">강아지
		<input type="checkbox" name="pet" value="cat">고양이
		<input type="checkbox" name="pet" value="pig">돼지
	<br>
	<input type="submit" value="전송">
	</form>
</body>
</html>
</body>
</html>