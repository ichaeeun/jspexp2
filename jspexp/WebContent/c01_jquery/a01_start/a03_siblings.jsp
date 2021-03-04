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
 
# 형제관계 선택자
$("형제1 + 형제2") : 형제1을 앞으로 둔 형제2 요소객체에 대한 
	선택자 처리.
$("형제1 ~ 형제2") : 형제1을 앞으로 둔 모든 형제2 요소객체 대한	
# [속성] 선택자
$("[속성]") : 해당 속성을 가진 모든 요소객체
$("[속성=속성값]") : 해당 속성에 속성값을 가진 모든 요소객체
$("[속성!=속성값]") : 해당 속성에 속성값을 가지지 않는 모든 요소객체
$("[속성^=속성값]") : 해당 속성에 속성값으로 시작하는 모든 요소객체
$("[속성$=속성값]") : 해당 속성에 속성값으로 끝나는 모든 요소객체

$("요소객체[속성=속성값]") : 특정 요소선택자 안에 속성과 속성값이 있을 때,
	해당 내용을 선택하여 처리.
*/
//
	$(document).ready(function(){
		$("h3").text("형제 관계");
		$( "#prev ~ div" ).css( "border", "3px groove blue" );
		$( "[id]" ).css( "font-size", "30px" );
		$( "a[href='https://naver.com']").css( "font-size", "40px" );
		$( "a[href !='https://naver.com']").css( "color", "red" );
		$( "a[href^='https']").css( "background-color", "pink" );
		$( "a[href$='net']").css( "border", "1px solid green" );		
	});
</script>
</head>
<body>
	<h3>제목</h3>
    <a href="http://naver.com">one</a><br/>
    <a href="https://naver.com" target="_blank">two</a><br/>
    <a href="https://daum.net">three</a><br/>
    <a href="http://daum.net" target="_blank">four</a><br/>
    <a href="https://korea.com">five</a><br/>
    <a href="http://korea.com" target="_blank">six</a><br/>	
	<div>div 아이템 1</div>
	<span id="prev">span 아이템 1</span>
	<div>div 아이템 2</div>
	<div>div 아이템 3<div id="small">중첩 div아이템 1</div></div>
	<span>span 아이템 2</span>
	<div>div 아이템 4</div>
</body>
</html>