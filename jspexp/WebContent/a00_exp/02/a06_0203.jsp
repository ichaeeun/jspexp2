<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
    import="java.net.*" 
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
[데이터베이스]
[하] 1. 정규화의 개념과 원자값, 완전함수종속성, 이행적 함수종속성에 관련하여 기술하세요.
		원자값 : 컬럼에 데이터는 단일데이터를 입력해야지 이중으로 데이터를 입력하여서는
			않된다.
		완전함수종속성 : 테이블의  컬럼간 데이터가 해당 하나의 키 기준으로 종속적으로
			식별할 수 있게 저장되어야 한다.
		이행적 함수 종속성 : X->Y->Z 형식의 컬럼이 있을 때, X->Z도 데이터가
			종속이 되어야 된다.
[js]
[하] 1. 날짜설정의 기본형식을 기술하세요.
		1) 오늘 날짜 : var today = new Date();
		2) 지정한 날짜
		Date("영문월 날짜");
		Date("영문월 날짜, 년도");
		Date("영문월 날짜, 년도 시:분:초");
		Date(년도, 월index, 날짜);
		Date(년도, 월index, 날짜, 시, 분, 초);
		Date(년도, 월index, 날짜, 시, 분, 초, 1/1000초);
		3) 지원메서드. 	
	    getXXX() : 호출
	    setXXX(저장데이터) : setDay(X)
	    XXX : FullYear, Month, Date, Day, Hours,
	    	Minutes, Seconds, Milliseconds,  Time(1970/1/1)	
	    4) 출력형식
	    toOOOString()
	    OOO : Date, GMT, ISO, JSON, LocaleDate, Locale, LocaleTime, 
	          Time    	    			
--%>
<%--
[하] 2. 입사일 날짜를 (yyyy/mm/dd)형식으로 입력하고, 해당 날짜별 인턴기간(3개월)으로 계산하여 출력하세요.
--%>
	입사일:<input type="text" placeholder="yyyy/mm/dd" 
		name="regdate"/>
	<input type="button" value="인턴기간만료일" onclick="calInter()"/><br>
	<h2 id="show"></h2>
	<script>
		function calInter(){
			var regdate= document.querySelector("[name=regdate]").value;
			console.log(regdate.split("/"));
			var date = regdate.split("/");
			var yyyy = date[0];
			var mm = Number(date[1])-1;
			var dd = Number(date[2]);
			var hiredate = new Date(yyyy,mm,dd); // 입사일
			hiredate.setMonth(hiredate.getMonth()+3); 
			// 인턴기간 만료일계산..
			var showObj = document.querySelector("#show");
			showObj.innerHTML = hiredate.toLocaleDateString();
		}
	</script>
<%--
[하] 3. 아래와 같은 형식으로 입력하여, 두 날짜 사이의 차이를 구하세요
        [@@@@/@@/@@] ~[@@@@/@@/@@] [기간구하기]
        @@ 일
--%>
	<input type="text" name="date01" placeholder="yyyy/mm/dd"/> ~
	<input type="text" name="date02" placeholder="yyyy/mm/dd"/>
	<input type="button" value="기간구하기" onclick="calcuTerm()"/><br>
	<h3 id="show2"></h3>
	<script>
		function calcuTerm(){
			var date01 = document.querySelector("[name=date01]").value;
			var date02 = document.querySelector("[name=date02]").value;
			var data01Arry = date01.split("/"); 
			// ["2021","02","04"]
			var data02Arry = date02.split("/");
			// var startDate = new Date(2021,1,4);
			var startDate = new Date(data01Arry[0],
					Number(data01Arry[1])-1, data01Arry[2]);
			var endDate = new Date(data02Arry[0],
					Number(data02Arry[1])-1, data02Arry[2]);
			// 시작과 마지막 날짜의 1/1000초 시간을 추출..
			var interval = endDate.getTime()-startDate.getTime();
			var dateResult = Math.floor(interval / (1000 * 60 * 60 * 24));
			document.querySelector("#show2").innerHTML =  dateResult+"일";			
		}
	</script>
	 
<%--
[jsp]        
[하] 1. 쿠키의 생성과 확인을 request와 response를 기준으로 메서드를 활용하여 기술하세요
		1) 생성(서버)
			Cookie c = new Cookie(키,값)
		2) 전달과 저장(서버 --> 클라이언트)
			response.addCookie(c);
		3) 다시 서버로 전송(클라이언트 --> 서버)
			Cookie[] cookies = request.getCookies();
					
--%>
<%--
[하] 2. 좋아하는 음식 [     ][주문] ==> 주문 클릭시, 쿠키값을 저장하고, 다음페이지에 쿠키값 내용을 확인하여
            @@@ 주문되었습니다로 출력하세요
       	1) 화면 출력..
       		초기요청페이지에서
       		좋아하는 음식 : <input type="text" name="food"/>     
            [주문] ==> submit로 서버에 요청key=요청값 형식으로 전달.
        2) 서버에서 전달 받는 내용.
        	String food = request.getParameter("food");
        	if(food!=null){
        3) client로 전달받은 내용 전송/ 쿠키저장.
        		// 쿠키생성.
        		Cookie c = new Cookie("food", food);
        		// client 전송.
        		response.addCookie(c);
        	}
        4) 페이지 이동
        	response.sendRedirect("특정페이지");
        5) 쿠키값 확인.
        	Cookie[] cks = request.getCookies();
        	for(Cookie c : cks){
        		c.getName(), c.getValue()
        	} 		
--%>
<body>
	<h3>주문 페이지(쿠키연습)</h3>
	<form method="post">
		<table>
			<tr><th>좋아하는 음식</th>
				<td><input type="text" name="food"/></td></tr>
			<tr><td colspan="2">
					<input type="submit" value="주문"/>
				</td></tr>
		</table>
	</form>
<%
	String food = request.getParameter("food");
	if(food != null){
		Cookie c = new Cookie("food",URLEncoder.encode(food,"utf-8"));
		response.addCookie(c);
		// 페이지 이동(쿠키값 확인)
		response.sendRedirect("a07_0203_Show.jsp");
	}

%>	
	
<%--
[중] 3. 물건명:[   ] 가격:[  ] 갯수:[    ][장바구니담기] 클릭을 통해 요청값을 전달하고, 쿠키를 만들고,
     생성된 쿠키값을 다음 페이지에서 확인해보자. 확인후 삭제 버튼 클릭시, 쿠키값을 삭제해보자.
 --%>
	<h3>물건 구매(쿠키연습2)</h3>
	<form method="post">
		<table>
			<tr><th>물건명</th><td><input type="text" name="pname"/></td></tr>
			<tr><th>가격</th><td><input type="text" name="price"/></td></tr>
			<tr><th>갯수</th><td><input type="text" name="cnt"/></td></tr>
			<tr><td colspan="2">
					<input type="submit" value="장바구니담기"/>
				</td></tr>
		</table>
	</form>
	<%
	String pname = request.getParameter("pname");
	String price = request.getParameter("price");
	String cnt = request.getParameter("cnt");
	if(pname!=null){
		Cookie c1 = new Cookie("pname",
				URLEncoder.encode(pname,"utf-8") );
		Cookie c2 = new Cookie("price",price);
		Cookie c3 = new Cookie("cnt",cnt);
		response.addCookie(c1);
		response.addCookie(c2);
		response.addCookie(c3);
		response.sendRedirect("a08_0203_showCookie.jsp");
	}
	
	
	
	%>
	
	
</body>
</html>