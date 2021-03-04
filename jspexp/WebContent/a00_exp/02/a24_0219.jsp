<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"  %>
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


<%--  
[하] 1. 재귀적 함수 호출 개념과 toggleClass에 대하여 간단하게 기술하세요.
		함수를 선언하고, 호출하는데, 선언된 내용에서 현재 함수를 다시 호출하는 것을 말한다.
		반복적인 동적 수행이 필요할 경우에 사용된다.
		$(선택자).toggleClass("css로 선언된 클래스");
		이벤트를 통해서 적용되었을 때는 클래스 적용하지 않게 처리하다가 클래스 적용되지 않았을 때는
		클래스 적용처리하는 기능 메서드 이다.


[하] 2. 재귀적 함수와 slideToggle를 이용하여 특정한 이미지가 보였다가 사라졌다가를 처리해보세요.

--%>

	$(document).ready(function(){
		//$("h3").text("시작");
		function imgSlide(){
			$("img").slideToggle("slow",imgSlide);
		}
		imgSlide();
	});
</script>
</head>
<%--        
[JSP]
[하] 1. el태그를 이용한 4가지 범위의 데이터를 저장하고 객체로 저장하고, 4칙연산자에의 출력 처리하세요.
--%>


<body>
	<img src="puppy03.PNG"/>
<%	pageContext.setAttribute("num01",25);
pageContext.setAttribute("num02",30);%>
	<h3>사칙 연산 처리</h3>
	<h4>${num01} + ${num02} = ${num01 + num02}</h4>
	<h4>${num01} - ${num02} = ${num01 - num02}</h4>
	<h4>${num01} * ${num02} = ${num01 * num02}</h4>
	<h4>${num01} / ${num02} = ${num01 / num02}</h4>
	<h3>객체 호출</h3>
<%request.setAttribute("p01", new Person("홍길동",25,"서울 신림동"));%>	
	<table>
		<tr><th>${p01.name}</th></tr>
		<tr><th>${p01.age}</th></tr>
		<tr><th>${p01.loc}</th></tr>
	</table>
	<h3>배열 호출</h3>
<%session.setAttribute("arry", new String[]{"사과","바나나","딸기"});%>	
	<table>
		<tr><th>${arry[0]}</th></tr>
		<tr><th>${arry[1]}</th></tr>
		<tr><th>${arry[2]}</th></tr>
	</table>
<%
ArrayList<Person> plist = new ArrayList<Person>();
plist.add(new Person("심길동",27,"경기 인천"));
plist.add(new Person("마길동",25,"전라 광주"));
plist.add(new Person("오길동",27,"경상 대구"));
application.setAttribute("arrList", plist);
%>	
	<h3>객체형 ArrayList 호출</h3>
	<table>
		<tr><th>${arrList.get(0).name}</th>
			<th>${arrList.get(0).age}</th>
			<th>${arrList.get(0).loc}</th></tr>
		<tr><th>${arrList.get(1).name}</th>
			<th>${arrList.get(1).age}</th>
			<th>${arrList.get(1).loc}</th></tr>
		<tr><th>${arrList.get(2).name}</th>
			<th>${arrList.get(2).age}</th>
			<th>${arrList.get(2).loc}</th></tr>

	</table>	
<%--		
[하] 2. el에서 사용되는 조건논리연산자를 활용하여, 임의의 값에 정답을 입력한 후, 정답 여부를 true/false로 출력하세요.
        [ @@] * [ @@  ] = [ 정답입력  ] [정답확인]
            정답여부 @@@
--%>
	<%
	pageContext.setAttribute("num01", (int)(Math.random()*8+2));
	pageContext.setAttribute("num02", (int)(Math.random()*9+1));
	%>
	<h3>연산 처리</h3>
	<form method="post">
	<table>
		<tr>
			<td>
			<input name="num01" value="${num01}" size="2"/> X
			<input name="num02" value="${num02}" size="2"/> =
			<input name="reply" value="" size="2"/>
			<input type="submit" value="정답확인"/> 
			</td>
		</tr>
		<tr><td>입력데이터 : ${param.num01} X ${param.num02} = ${param.reply }<br>
				정답여부 : ${param.num01*param.num02 == param.reply}</td></tr>
	</table>	
	</form>
<%--
[하] 3. useBean과 el을 이용하여 회원가입 정보입력과 가입된 정보를 출력 처리하세요.~
--%>
	<h3>회원가입</h3>
	<form method="post">
	<table>
		<tr><th>아이디</th><td><input type="text" name="id" /></td></tr>
		<tr><th>패스워드</th><td><input type="password" name="pass" /></td></tr>
		<tr><th>포인트</th><td><input type="text" name="point" /></td></tr>
		<tr><th>이름</th><td><input type="text" name="name" /></td></tr>
		<tr><th>권한</th><td><input type="text" name="auth" /></td></tr>
		<tr><td colspan="2"><input type="submit" value="회원가입"/></td></tr>
	</table>	
	</form>
	<jsp:useBean id="mem" class="jspexp.z01_vo.Member"></jsp:useBean>
	<jsp:setProperty property="*" name="mem"/>
	<h3>가입된 정보</h3>
	<table>
		<col width="50%">
		<tr><th>아이디</th><td>${mem.id}</td></tr>
		<tr><th>패스워드</th><td>${mem.pass}</td></tr>
		<tr><th>포인트</th><td>${mem.point}</td></tr>
		<tr><th>이름</th><td>${mem.name}</td></tr>
		<tr><th>권한</th><td>${mem.auth}</td></tr>
	</table>	
		
</body>
</html>