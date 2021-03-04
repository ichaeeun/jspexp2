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

<%--        
[JSP]
[하] 1. 쿠키값의 life cycle과 필요한 메서드를 기술하세요.
		1) 쿠키 생성(서버) : Cookie c = new Cookie(이름,값)
		2) 쿠키 생성 내용 전달(서버)
			response.addCookie(c);
		3) 쿠키 저장(브라우저)
			브라우저의 특정 위치에 저장됨.
		4) 쿠키 저장 내용 전달(브라우저)
			request에 의해 전달, 페이지 호출.
		5) 전달 되어온 쿠키 확인처리(서버)
			Cookie[] c = request.getCookie();
[하] 2. 쿠키값을 요청값에 의해 삭제 처리되는 코드를 기술하세요
		1) 삭제할 쿠키값을 요청값으로 전달
			get방식/post 방식으로 전달
			ex) <input type="checkbox" 
					name="dcks" value="<%=c.getName%>"
			String dck = request.getParameterValues("dcks");		
		2) 삭제할 요청된 쿠키값과 저장된 쿠키값을 비교
			for(Cookie c:request.getCookies())
				for(int idx=0;idx<dck.length;idx++){
					if(c.getName().equals(dck[idx])){
		3) 쿠키 사용 기간값 0으로 설정.
			조건에 해당하는 쿠키의 기간
				c.setMaxAge(0)
		4) response객체로 해당 쿠키를 전송
				response.addCookie(c);


--%>
<%--  
[js]
[하] 1. 배열의 forEach(), map(), filter()의 기본 형식을 기술하세요.
		1) 배열.forEach(function(단위객체, index, 배열){ });
			배열의 단위 객체에 데이터를 처리할 때, 활용된다.
		2) var 새로운 배열 = 배열.map(function(단위객체){
				return 단위객체; // 값이 변경된 단위객체
		   });
		3) var 새로운배열 = 배열.filter(function(단위객체, index,배열){
				return 조건;
		   });   
		   해당 배열에 조건에 맞는 새로운 배열을 만들어 준다.
--%>

<script>
	window.onload=function(){
		<%-- 		   
		[하] 2. 1000단위 물건가격 5개를 임의로 만들어, 5000이상 고가 그외 저가 구분하여
		        표기하세요
		--%>
		var prices = [];
		for(var cnt=1;cnt<=5;cnt++){
			var price = Math.floor(Math.random()*9+1); // 1~9
			price *=1000; // 1000~9000
			prices.push(price);
		}
		console.log(prices);
		var Vprices = prices.map(function(price){
			return price>=5000?price+":고가":price+":저가";
		});
		console.log(Vprices);
		<%--        
		[하] 3. json객체의 문자열 변환 및 객체 변환 메서드를 기본예제를 통해 기술하세요.
		 --%>		
		var book={
			title:"jsp중급",
			price:32000,
			publisher:"IT서적"
		}
		// 문자열 변환처리
		var bookStr = JSON.stringify(book);
		console.log(bookStr);
		// 다시 객체로 변환 처리.
		var book2 = JSON.parse(bookStr);
		console.log(book2);
	};
</script>
</head>
<body>
	<h3>제목</h3>
	<table>
		<tr><th>타이틀</th></tr>
		<tr><td>내용</td></tr>
	</table>
</body>
</html>