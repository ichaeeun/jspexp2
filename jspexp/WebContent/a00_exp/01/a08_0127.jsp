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
<body>
<%--
[중] 4. upgrade판인 연산자도(+,-,*,/)도 임의로 나오게 하고, 
		총 10문제가 임의로 나오게 처리하세요. 확인 클릭시, 
		결과 100점 만점에 맞춘만큼 점수도 표기
# 처리 순서
1. 임의 두개의 숫자 (1~9)
2. 연산자 4개중에 하나 나오게 {"+","-","*","/"}
3. 연산 정답값 조건문/배열에 정답 설정 {num01+num02,num01-num02,
	num01*num02,num01/num02}
4. 임의의 연산자와 정답값 설정 ranIdx(0~3)
5. 화면에 출력 내용 구성.
	<form action="전송할페이지">	
	@@ 연산자 @@ = [  ] hidden으로 정답을 mapping[ ]
	[확인]	
	</form>
6. 전송받아서 처리할 페이지..
	1) 입력된 값.
	String innum = request.getParameter("innum");
	2) 정답 값
	String cornum = request.getParameter("cornum");
	3) 숫자로 변환
	맞을 때, 점수 처리 int tot=0;
	tot+=10;
	4) 총 점수 화면 출력.
7. 위내용을 10개 문제로 처리할 때, 해야할 부분.
	1) 초기페이지..	
		5. 화면에 출력 내용 구성. for(1~10)
			@@ 연산자 @@ = [  ] hidden으로 정답을 mapping[ ]
	2) 전송 받은 페이지..	
		String []innum = request.getParameterValues("innum");
		String []cornum = request.getParameterValues("cornum");
		for(배열 단위데이터)
			각데이터 숫자형 변환
			비교 tot+=10
		총점수 출력 : @@@
		
# 핵심키워드.
(int)(Math.random()*경우의수+시작수) : 임의의 숫자 처리.
String  calArr[] = {" + ", " - ", " * ", " / "};
int corArr[] = {num01+num02,num01-num02,num01*num02,num01/num02};
int rIdx = (int)(Math.random()*4) : 배열의 임의의 index 선택 if(조건문 대용 처리)
calArr[rIdx] :임의 연산식 선택, corArr[rIdx] :임의의 연산결과
String []inArry = request.getParameterValues("innum");
int totPoint=0;  for 밖에서 for안에서 누적해서 데이터 처리를 할때, 전역변수로 선언.
for(int idx=0;idx<inArry.length;idx++){
    Integer.parseInt(inArry[idx])
<form action="a09_0127.jsp" method="post">		
<input type="hidden" name="cornum" value="<%=cor%>"/>
:전송을 해야하지만 현재화면에서 보여서는 안되는 데이터 처리.
 --%>
<%
	// 연산자 임의처리를 위한 배열 선언
	String  calArr[] = {" + ", " - ", " * ", " / "};
%> 
	<h3>수학 게임</h3>
	<form action="a09_0127.jsp" method="post">
	<table>
		<col width="15%">
		<tr><th>번호</th><th>문제</th><th>정답입력</th></tr>
		<%for(int cnt=1;cnt<=10;cnt++){ 
			// 임의의 두개의 수..
			int num01 = (int)(Math.random()*9+1);
			int num02 = (int)(Math.random()*9+1);
			// 정답을 위한 배열 선언.
			int corArr[] = {num01+num02,num01-num02,
							num01*num02,num01/num02};
			// 임의의 연산식 idx 설정
			int rIdx = (int)(Math.random()*4); // 0~3
			// 선택된 내용 연산식과 정답값.
			String cal = calArr[rIdx];
			// 정답
			int cor = corArr[rIdx];		
		%>
		<tr><td><%=cnt%></td>
			<td><%=num01%> <%=cal%> <%=num02%></td>
			<td><input type="text" name="innum" size="2"/>
			<input type="hidden" name="cornum" value="<%=cor%>"/>
		</td></tr>
		
		<%} %>
		<tr><td colspan="3"><input type="submit"/></td></tr>
	</table>
	</form>
</body>
</html>



