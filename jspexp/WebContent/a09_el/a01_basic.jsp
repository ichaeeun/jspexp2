<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
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
# 표현 언어(Expression Language)
1. jsp에서 사용 가능한 새로운 스크립트 언어
	데이터가 없을 때, nullpoint예외가 발생하지 않아서, 웹 화면에서는
	효과적인 언어라고 할 수 있다.
	jstl과 함께 사용하면 기존 script언어를 쓰지 않아도 된다.
2. 주요 기능
	1) jsp의 네 가지 기본 객체가 제공하는 영역의 속성 사용
		(page, request, session, application)에서 변수를 사용
		session.setAttribute("name","홍길동");
		${name} :session 범위 안에서 해당 변수의 데이터를 ${}형식으로
		활용할 수 있다.
	2) 객체와 집합 객체에 대한 접근 방법 제공
		- 객체
		request.setAttribute("p01", new Person("홍길동",25,"서울신림"));
		${변수명.get프로퍼터}
		${p01.name} ${p01.age} ${p01.loc}
		- 집합객체
		request.setAttribute("arr01", {"사과","바나나","딸기"});
		${arr01[0]},${arr01[1]},${arr01[2]},
		ArrayList<Product> plist = new ArrayList<Product>();
		plist.add(new Product("사과",3000,2);
		plist.add(new Product("바나나",4000,3);
		plist.add(new Product("딸기",12000,3);
		request.setAttribute("plist",plist);
		${plist.get(0).name},
		${plist.get(1).name},
		${plist.get(2).name},
	3) 수치연산, 관계연산, 논리 연산을 제공
		request.setAttribute("num01",25);	
		request.setAttribute("num02",5);	
		${num01+num02}, ${num01*num02} 사칙연산
		${num01>=num02} 관계연산
		request.setAttribute("mem",new Member("himan",7777");
		${mem.id=='himan' and mem.pass=='7777'}
		비교연산자 - ==,eq, !=, ne, 
					< 또는 lt, >, gt, >= ge
		논리연산 처리 && and, || or, ! not
	4) empty
		${변수명 !=null && 변수명 !=""}
		${not empty 변수명} null 아니고 공백이 아닐때
		${empty 변수명} null 이거나 공백일때, 
	5) 3항 연산자
		${ 변수==변수?"true일때":"false일때" }	 
 
--%>
//
	$(document).ready(function(){
		//$("h3").text("시작");
	});
</script>
</head>
<%
pageContext.setAttribute("name", "사과");
pageContext.setAttribute("price", 3000);
pageContext.setAttribute("cnt", 2);
request.setAttribute("p01", new Person("홍길동",25,"서울신림"));
request.setAttribute("arry01",new String[]{"사과","바나나","딸기"});
// ex1) 좋아하는 음료수명, 가격을 변수를 선언하고 el로 호출하세요
request.setAttribute("favor_bev", "탄산소다");
request.setAttribute("favor_price", 2000);		
// ex2) session scope 범위로 Member객체의 id pass name auth를 할당하고,
//      el로 호출 하고, 다음 페이지 이동하여 해당 내용을 확인하세요.	~12:25
//      Member(String id, String pass, int point, String name, String auth)
session.setAttribute("mem", 
		new Member("himan","7777",0,"홍길동","관리자"));
%>
<body>
	<h2>${name} - ${price} - ${cnt} - ${price*cnt} </h2>
	<h3>이름 : ${p01.name}</h3>
	<h3>나이 : ${p01.age}</h3>
	<h3>사는곳 : ${p01.loc}</h3>
	<h2>집합객체 처리</h2>
	<h3>${arry01[0]}, ${arry01[1]}, ${arry01[2]}</h3>
	<h3>좋아하는 음료수:${favor_bev }</h3>	
	<h3>좋아하는 음료수 가격:${favor_price }</h3>	
	<h3>아이디:${mem.id}</h3>
	<h3>이름:${mem.name}</h3>
	<h3>비번:${mem.pass}</h3>
	<h3>권한:${mem.auth}</h3>
	<a href="a02_show.jsp">페이지 이동</a>
</body>
</html>

