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
<script type="text/javascript" 
  src="<%=path%>/a00_com/jquery-3.5.1.js"></script>
<script type="text/javascript">
/* 
# $("요소객체[속성]") 관련 내용.
1. $("요소객체[속성*=속성값]") : 해당요소객체에 속성에 속성값이 포함되어 있는 경우.
2. $("요소객체[속성~=속성값]") : 해당요소객체에 속성에 속성값이 단어(띄워쓰기로 해당 단어 구분)로
							포함되어 있는 경우. 

*/
//
	$(document).ready(function(){
		$( "input[name*='man']" ).val( "man 글자 포함" );
		$( "input[name~='man']" ).css("border" , " 3px solid red");		
	});
</script>
</head>
<body>
	<input name="man-news">
	<input name="milk man">
	<input name="letterman2">
	<input name="newmilk">
	<input name="superman">
</body>
</html>