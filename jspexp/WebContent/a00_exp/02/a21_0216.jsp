<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"
    %>
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

</script>
</head>
<%--        
[JSP]
[중] 1. 2/10숙제의 상세화면에서 물건정보를 수정 처리하세요.
--%>
<%--  
[js]
[하] 1. 강제이벤트란 무엇인가? 개념을 설명하고, 기본예제로 기술하세요.
		실제 이벤트가 발생하지 않지만, 객체.on이벤트명();으로 js 코드로 
		이벤트 발생했을 때, 핸들러 함수를 수행하는 것을 말한다.
		h3Obj.onclick=function(){
			this.innerText+="★";
		}
		setInterval(function(){
			h3Obj.onclick(); // 강제 이벤트 발생 처리(1초마다)
		},1000);
[하] 2. 특정 페이지를 서버에 요청값으로 처리할 때, 유효성 처리 이벤트에 대해 기술하세요.
        1) 이벤트명 : submit 
        2) 유효성 처리 방법
        	선택한form객체.onsubmit=function(){
        		요청값으로 form하위에 있는 요소객체에 대한 유효성 check
        		해당 값이 유효성에 문제가 있을 때, return false 처리하여
        		전송하지 못하게 방지한다.
        	}
[하] 3. 키 이벤트를 이용하여  h3 7개를 아래 위로 키를 입력시 
	이동되어 배경색상과 글자 색상이 변경되게 처리하세요.
--%>
<body>
	<h2>키 이벤트 처리.</h2>
	<h3>안녕하세요!!</h3>
	<h3>안녕하세요!!</h3>
	<h3>안녕하세요!!</h3>
	<h3>안녕하세요!!</h3>
	<h3>안녕하세요!!</h3>
	<h3>안녕하세요!!</h3>
	<h3>안녕하세요!!</h3>
</body>
<script type="text/javascript">
	window.onload=function(){
		
		var idx=0;
		var h3Arry = document.querySelectorAll("h3");
		// event.keyCode
		this.onkeyup=function(e){
			for(var i=0;i<h3Arry.length;i++){
				h3Arry[i].style.backgroundColor="";
				h3Arry[i].style.color="";
			}		
			if(e.keyCode==38){
				idx--;
			}
			if(e.keyCode==40){
				idx++;
			}
			if(idx<0) idx=0;
			if(idx>6) idx=6;
			h3Arry[idx].style.backgroundColor="blue";
			h3Arry[idx].style.color="yellow";
		}	
	};	


</script>
</html>