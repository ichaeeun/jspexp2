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
 
 
*/
//
	$(document).ready(function(){
		$("h3").text("계층 선택자");
		// $("부모 > 자식") :  부모 자식 관계에서 자식에 대한 선택..
		$( "ul.topnav > li" ).css( "border", "3px double red" );
		console.log($( "ul.topnav > li" ).length);
		// $("상위 하위") : 계층 레벨에 상관없이 상위요소 객체를 가진 하위 요소객체 선택..
		$( "form input" ).css( "border", "2px dotted blue" );
		$( "form fieldset input" ).css( "background-color", "yellow" );
		// label을 앞으로 둔 input객체에 대한 속성과 값의 설정.
		// .val() : form하위 객체의 value값을 저장하거나 호출할 때, 사용된다.
		$( "label + input" ).css( "color", "blue" ).val( "Labeled!" );
	});
</script>
</head>
<body>
	<h3>계층관계 선택자</h3>
	<form>
	  <div>기본 폼</div>
	  <label for="name">기본 폼의 자식</label>
	  <input name="name" id="name">
	  <fieldset>
	    <label for="newsletter">기본 폼의 자손, 필드셋의 자식</label>
	    <input name="newsletter" id="newsletter">
	  </fieldset>
	</form>
	기본 폼의 형제: <input name="none">	<!-- ~14:30 -->
	<ul class="topnav">
	  <li>아이템 1</li>
	  <li>아이템 2
		  <ul>
			  <li>중첩 아이템 1</li>
			  <li>중첩 아이템 2</li>
			  <li>중첩 아이템 3</li>
		  </ul>
	  </li>
	  <li>아이템 3</li>
	</ul>
</body>
</html>