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
<%--
[jsp]
[하] 1. request, response 참조변수의 원래 객체의 명은 무엇인가?(servlet클래스 참조)
		HttpServletRequest, HttpServletResponse
[하] 2. jsp에서 객체선언없이 사용하는 내장된 참조객체를 기술하세요.
		request, response, out, session
		jsp ==> servlet로 변경할때, 위객체는 선언되어 있기 때문에 선언없이 사용이 가능하다.
[하] 3. request객체의 메서드의 각자 특징과 내용을 기술하세요.
	1) request.getParameter("key") : 단일데이터 String
	   request.getParameterValue("key") :다중데이터 String[]
 	    client가 주소창이나 form객체를 통해서 전송하는 매개값을 
 		처리하는 객체를 말한다. (value값을 받아옴) 
 		페이지명?key=value&key=value (GET)
 		form mothod="post"
 			name="key"	value="value" (POST) 
 	2) request.getRemoteAddr() 
 		웹서버에 연결된 클라이언트의 ip주소를 구한다. 
 		ex) 웹서버에 접속된 여러 클라이언트 정보를 저장할 때 사용된다. 
 	3) request.getMethod()
 		요청값을 전달할 때, 전송하는 방식을 가져온다. (get/post) 
 	4) request.getContextPath()
 		위 주소에 해당하는 context명을 말한다. 웹서버에 등록하여 할당하는 
 		프로젝트명이기도 하다. 
 		WebContent 폴더를 기본경로로 하여 다른 자원을 호출할 때 사용된다.
 	5) request.getRequestURI()
 		웹 브라우저가 요청한 url경로: 위 주소에서 context명/폴더/파일.jsp 에 해당한다. 
 	6) request.getServerPort()
 		ex) 7080 
 	7) request.getServerName()
 		연결할 때 사용한 서버이름 		
[하] 4. request객체의 메서드 가운데 요청값을 처리하는 메서드의 특징을 기술하세요.
	request.getParameter("key")
 		form mothod="post" name="key"	value="value" 에서 value값을 받아온다. 
 	request.getParameterValues("key") 
 		요청한 key의 여러개의 value값을 받아서 배열로 저장한다. 
 	request.getParameterNames();
 		요청되는 모든 내용을 key값을 가져온다. 
 		Enumeration enum = request.getParameterNames();
	request.getParameterMap();
 		요청된 모든 내용을 key/value형식으로 map에 할당되어 가져온다. 

[중] 5. 구매할물건과 갯수를 queryString으로 페이지와 함께 만들고, 해당 페이지에서 
        데이터를 처리하세요 page.jsp?name=사과&cnt=2&price=3000&name=바나나&cnt=5&price=4000&pay=신용카드&pay=현금&pay=포인트
http://localhost:7080/jspexp/a00_exp/01/a04_0126.jsp?name=%EC%82%AC%EA%B3%BC&cnt=2&price=3000&name=%EB%B0%94%EB%82%98%EB%82%98&cnt=5&price=4000&pay=%EC%8B%A0%EC%9A%A9%EC%B9%B4%EB%93%9C&pay=%ED%98%84%EA%B8%88&pay=%ED%8F%AC%EC%9D%B8%ED%8A%B8        
        
        
        1) get방식으로 바로 출력
        2) form 처리 방식 입력 후, 출력.
            구매물건
            물건명  가격  갯수
            [   ] @@@ [  ]
            [   ] @@@ [  ]
            [   ] @@@ [  ]
            구매방법 []신용카드[]현금[]포인트

[js]
[하] 1. json객체의 메서드 속성에 대하여 기술하세요.
		
[하] 2. json형식으로 좋아하는 연예인 이름 분야 나이, showConsole(), 
 showTable() 로 해서 console에 출력하는 것과 화면 DOM에 테이블로 출력하는 것을 처리하세요.

 --%>
<%
	String []names = request.getParameterValues("name");
	if(names==null) names=new String[]{}; // NullPointerException 방지.
	String []cnts = request.getParameterValues("cnt");
	if(cnts==null) cnts=new String[]{};
	String []prices = request.getParameterValues("price");
	if(prices==null) prices=new String[]{};
	String []pay = request.getParameterValues("pay");
	if(pay==null) pay=new String[]{};
	
	
	// 전체 총계
	int sum = 0;
%>    
<body>
	<h3>구매내역</h3>
	<table>
		<tr><th>no</th><th>물건명</th><th>가격</th><th>갯수</th>
			<th>계</th></tr>
		<%		
		for(int idx=0;idx<names.length;idx++){
			int tot = Integer.parseInt(prices[idx])*
						Integer.parseInt(cnts[idx]);
			sum+=tot;
		%>
		<tr><td><%=idx+1%></td>
			<td><%=names[idx]%></td>
			<td><%=prices[idx]%></td>
			<td><%=cnts[idx]%></td>
			<td><%=tot%></td></tr>
		<%}%>
		<tr><th colspan="2">총계</th>
			<td colspan="3" style="text-align:right;">
				<%=sum%>
			</td>
		</tr>			
		<tr><th colspan="2">구매방법</th>
			<td colspan="3">
			<%for(String str:pay){%>
				<%=str%>&nbsp;&nbsp;
			<%}%>
		</td></tr>		
	</table>
</body>
</html>