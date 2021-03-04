<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
    import="jspexp.z01_vo.*"
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
	window.onload=function(){
		
	};
</script>
</head>

<%--        
[JSP]
[하] 1. session의 life cycle을 메서드와 함께 기술하세요.
		1) session의 생성
			session.setAttribute("key", Object );
		2) session의 활용/호출
			단일 속성값 : session.getAttribute("key");
			객체 참조 = (객체)session.getAttribute("key"); 
			(typecasting 필요)
			
		3) session의 종료
			#특정 session종료
				위 session.setAttribute()에 해당 key null값을 설정으로
				종료를 시킨다. 
			#전체 session종료
			session.invalidate();(이벤트-기능처리시)
			session.setMaxInactiveInterval(초단위);(시간 후, 종료)
			web.xml(서버단위로 session 종료 시간 분단위로 설정)
				<session-config>
					<session-timeout>30<session-timeout>(분단위)
[중] 2. 로그인 id : [    ] pass:[   ]로그인
        요청값 himan/7777 session 값 처리를 설정하고, 그 외에는 다시 로그인
        로그인 성공 후에는 session 값으로id 확인 @@@님 로그인 중, 
        로그아웃 클릭시, session값을 없애고 다시 로그인 페이지 이동 처리하는
        기능을 구현하세요.
[하] 1. DB서버를 접속하기 위한 환경과 필요한 핵심 api의 기능을 서술하세요
		# 환경 설정.
		1) DB 서버 정상 설정 - 서버 정보 확인 ip, port, sid, 계정
		2) jdbc드라이버를 웹에서 활용할 수 있게	
			jspexp\WebContent\WEB-INF\lib 저장.
		# 핵심 api.
			import java.sql.*;
			1) 연결 : Connection
			2) 대화 객체 : Statement, PreparedStatement
			3) 결과 객체 : ResultSet
--%>

<%--  
[js]
[하] 1. document.getElementXXXX() 메서드와 document.querySelectorXXX() 메서드를 
    선택자별로 비교하여 기술하세요.
    1) id값으로 접근
    	<h1 id = "아이디명"></h1>
    	var idObj1 = document.getElementById("아이디명");
    	var idObj2 = document.querySelector("#아이디명");
    2) tag접근.(배열접근/객체)
    	var tagArry1 = document.getElementsByTagName("태그명");	
    	var tagArry2 = document.querySelectorAll("태그명");	
    	var tagObj = document.querySelector("태그명");
    3) class 접근.
    	var clsArry1 = document.getElementsByClassName("클래스명");
      	var clsArry2 = document.querySelectorAll(".클래스명");	
    	var clsObj = document.querySelector(".클래스명");
    4) 속성 name 접근. name=속성값
    	var nameArry1 = document.getElementsByName("name의 속성값");
       	var nameArry2 = document.querySelectorAll("[name=속성값]");	
    	var nameObj = document.querySelector("[name=속성값]");   	
[하] 2. DOM객체의 속성 설정 및 호출 2가지, 출력 처리 메서드를 2가지를 예제와 함께 기술하세요.
		1) 속성
		var domObj = document.getElementById("아이디명");
		domObj.setAttribute("속성","속성값");
		domObj.속성 = "속성값";
		2) 출력 
		- html으로 랜더링 처리.
		domObj.innerHTML = "<h3>안녕하세요</h3>";
		- 단순 출력
		domObj.textContent = "안녕하세요!";
		domObj.innerText = "안녕하세요!";

[중] 3. DOM 요소객체 생성 코드(createElement)와 속성값 접근을 활용하여, 2X2테이블을
        만들고 화면에 출력하세요.(특정한 cell 배경색상 노랑색 설정)
        1) js에서 요소객체 만들기
        	var domObj1 = document.createElement("태그명");
        2) js에서 내용이 들어가는 객체 만들기.
        	var txtObj2 = document.createTextNode("문자열출력내용");
        3) html 화면의 최상위 요쳥 지정.
        	var body = document.body;
        4) 계층간의 객체 추가.
        	body.appendChild(domObj1);			
       	5) 특정한 요소객체 지정(화면에 태그로 있는 내용)
       		var domObj1 = document.querySelector("태그명");
--%>
<body>
		
</body>
<script>
	var h1Obj = document.createElement("h2");
	var h1TxtObj = document.createTextNode("안녕하세요");
	// 상위.appendChild(하위)
	h1Obj.appendChild(h1TxtObj);
	document.body.appendChild(h1Obj);
/*	1단계
 	h1 안녕하세요
 	2단계
 	<table><tr><td>안녕</td></tr></table>
 	3단계
 	<table>
 		<tr>
 			<td></td><td></td>
 		</tr>
 		<tr>
			<td></td><td></td>
		</tr>		
 	</table>*/	
	
	var tab1Obj = document.createElement("table");
 	var cnt=1;
 	var ranCnt = Math.floor(Math.random()*4+1);
 	for(var row=1;row<=2;row++){
		var tr1Obj = document.createElement("tr");
		for(var col=1;col<=2;col++){	
			var td1Obj = document.createElement("td");
			if(ranCnt==cnt){
				td1Obj.style.backgroundColor="orange"; 
			}
			var txtObj = document.createTextNode(cnt++);
			td1Obj.appendChild(txtObj);
			tr1Obj.appendChild(td1Obj);
		}
		tab1Obj.appendChild(tr1Obj);
 	}
	// 최종 계증(body) 구조에 할당.
	document.body.appendChild(tab1Obj);
/*
	td1Obj.setAttribute("style","background-color:yellow;");
	td1Obj.style.backgroundColor="orange"; 
 */	
	
	

</script>
</html>