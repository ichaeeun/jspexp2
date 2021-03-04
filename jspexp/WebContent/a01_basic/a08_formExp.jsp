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
	<h3>요청 form</h3>
	<form action="a07_requestExp.jsp" method="post">
	<table>
		<tr><th>이름</th><td><input type="text" name="name"/></td></tr>
		<tr><th>나이</th><td><input type="text" name="age"/></td></tr>
		<tr><th>취미생활</th>
			<td>
				<label><input type="checkbox" name="hobby" value="음악감상"/>음악감상</label>
				<label><input type="checkbox" name="hobby" value="컴퓨터게임"/>컴퓨터게임</label>
				<label><input type="checkbox" name="hobby" value="독서"/>독서</label>
				<label><input type="checkbox" name="hobby" value="여행"/>여행</label>
			
			</td></tr>
		<tr><td colspan="2" style="text-align:center;"><input type="submit" value="등록"/></td></tr>
	</table>
	</form>
</body>
</html>