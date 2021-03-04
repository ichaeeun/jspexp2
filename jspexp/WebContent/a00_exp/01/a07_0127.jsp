<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
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
[jsp]
[하] 1. 요청의 header에 들어가는 key와 value를 나열해보세요.
		headerName과 headerValue
		host : ip주소와 port
		connection : 연결유지 keep-alive
		user-agent : 지원브라우저.
		accept : 전송가능한 형태 html, 파일.. pdf
		upgrade-insecure-requests : 보안 요청 값
		 sec-fetch-site : none
		sec-fetch-mode : navigate
		sec-fetch-user : ?1
		sec-fetch-dest : document
		accept-encoding : gzip, deflate, br
		accept-language : ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7
		cookie : JSESSIONID=D2BAFC54ED6E459B8A4A9CDA4A560CC3
			쿠키값으로 브라우저(client에 저장되는 데이터로 서버에 전달시 사용)
[하] 2. jsp에서 result.jsp로 요청값 name=himan을 전송하는 경우와 
		js에서 동일한 내용을 처리하는 코드를 기술하세요.
		form으로 전송
			<form action="result.jsp">
				<input name="name" value="himan"/>
		url로 전송
			response.sendRedirect("result.jsp?name=himan");
		js에서 전송
			location.href="result.jsp?name=himan";		
[하] 3. jsp에서 요청값 한개 부터 시작해서, 숫자형 데이터 처리, 
	다중의 데이터 처리까지 form페이지와 함께 처리한 코드를
    기술하세요. (수업예제 제외)
    	a01_basic\a21_form.jsp 참고 진행.  
[하] 4. 구구단예제 기반(수업중)으로 하여, 임의의 (-)문제를 처리하게 하세요.
		

[중] 4. upgrade판인 연산자도(+,-,*,/)도 임의로 나오게 하고, 총 10문제가 임의로 나오게 처리하세요.
        확인 클릭시, 결과 100점 만점에 맞춘만큼 점수도 표기
[js]
[하] 1. id와 point를 등록해서 서버에 전송할려고 한다. 입력값을 받드시 넣어야 하고, 
		point는 숫자값이 되게 js로 처리한 후, result.jsp에서 해당 값을 출력하세요 

 --%>
<body>
<%
//Math.random()
	// 랜덤 범위 
	int num01 = (int)(Math.random()*100+1); //1~100 
	int num02 = (int)(Math.random()*100+1); //1~100
	int corNum = num01-num02;
	String innumS = request.getParameter("innum");
	String corNumS = request.getParameter("corNum");
	if(innumS!=null){ //데이터를 입력했을 때.
		int innum = Integer.parseInt(innumS);
		int cor = Integer.parseInt(corNumS);
		if(cor == innum){ // 정답일때.
			response.sendRedirect("a18_succ.jsp?innum="+innum);
		}else{
			// 오답일 때, 정답과 오답을 요청값으로 전송 처리..
			response.sendRedirect("a19_fail.jsp?innum="
				+innum+"&corNum="+cor);
		}
	}
%> 
<body>
	<h3>수학게임(-)연산처리.</h3>
	<form method="post">
	<table>
		<tr><th><%=num01 %> X <%=num02%> = ?</th></tr>
		<tr><td>정답입력 : <input type="text" name="innum"/>
						<input type="hidden" name="corNum" value="<%=corNum %>"/>
						<!-- 
						보이지는 않지만( type="hidden")
						 정답확인 클릭후, 실제 현재 문제에 대한 정답을 전송한다.
						 -->
						</td></tr>
		<tr><td><input type="button" value="정답확인" onclick="valid()"/></td></tr>
	</table>
	</form>
<%--
[하] 1. id와 point를 등록해서 서버에 전송할려고 한다. 입력값을 받드시 넣어야 하고, 
		point는 숫자값이 되게 js로 처리한 후, result.jsp에서 해당 값을 출력하세요 

 --%>	
	<h3>유효성 연습</h3>
	<form id="chkFrm">
		<table>
			<tr><th>아이디</th><td><input type="text" name="id"/></td>
			<tr><th>포인트</th><td><input type="text" name="point"/></td>
			<tr><td colspan="2"><input type="button" onclick="valid2()" value="등록"/></td>
		</table>
	</form>	
</body>
<script type="text/javascript">
	function valid2(){
		var idObj = document.querySelector("#chkFrm [name=id]");
		var pointObj = document.querySelector("#chkFrm [name=point]");
		var isValid=true;
		if(idObj.value==""){
			alert("아이디 입력해주세요");
			idObj.focus();
			isValid=false;
		}
		if(pointObj.value==""){
			alert("포인트 입력해주세요");
			pointObj.focus();
			isValid=false;
		}else{
			if(isNaN( pointObj.value )){
				alert("포인트는 숫자를 입력해주세요");
				pointObj.value="";
				pointObj.focus();
				isValid=false;
			}
		}
		if(isValid){
			// 유효성 check에 해당 하지 않을 때만, 서버에 요청값으로 전송 처리..
			document.querySelector("#chkFrm").submit();
		}
		
	}



	function valid(){
		var inNumObj=document.querySelector("input[name=innum]");
		if(inNumObj.value==""){
			alert("데이터를 입력하세요.");
			inNumObj.focus();
			
		}else{
			if(isNaN( inNumObj.value ) ){
				alert("숫자를 입력하세요.");
				inNumObj.value="";
				inNumObj.focus();				
			}else{
				// 정상 데이터로 입력했을 때, 전송 처리..
				document.querySelector("form").submit();
			}
		}
	}
</script>
</html>