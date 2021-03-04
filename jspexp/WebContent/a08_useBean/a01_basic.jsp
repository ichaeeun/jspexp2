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
	window.onload=function(){
		
	};
</script>
</head>
<%--
# 자바빈(java beans)
1. 웹 프로그램에서 데이터의 표현을 효과적으로 처리하기 위하여 사용한다.
2. 구성
	1) 값을 저장하기 위한 필드(field)
	2) 값을 필드에 할당하기 위한 setter 메서드
	3) 저장된 값을 가져오기 위한 getter 메서드.
3. 프로퍼티(property)
	1) 자바빈에 저장/호출 되는 값을 표현하는 것을 말한다.
	2) 일반적으로 메서드 이름을 사용해서 프로퍼티 이름을 결정한다.
		setName(String n) ==> 저장하는 name 프로퍼티
		getAge() ==> 호출하는 age 프로퍼티
		메서드명에서 get/set을 제외하고 소문자로 변경된 핵심적인 이름
	cf) 프로퍼티는 field명과 동일한 경우가 있으나, 반드시 구분하여야 한다.
4. <jsp:useBean>태그
	1) jsp에서 자바빈 객체를 생성할 때, 사용된다.
	2) <jsp:useBean id="빈이름" class="자바빈클래스명" 
			scope="session범위"
		자바빈클래스명 	빈이름 = new  자바빈클래스명();
	   ex)
	   request.setAttribute("p",new Person());
	   
	   <jsp:useBean id="p" class="패키지명.Person" 
	   	scope="request"/>	
		
		
		
5. property의 활용..
	1) set 프로퍼티.
		<jsp:setProperty name="bean의 id명" 
			property="프로퍼터명" value="저장할데이터"/>   ~ 14:10
	2) get 프로퍼터ㅣ.
		<jsp:getProperty name="bean의 id명"
			property="프로퍼터명"/>	
	3) param : 요청 매개변수값을 의미하여 해당 set 프로퍼티에서 활용한다.	
--%>
<%
//1. useBean 사용하지 않게 session할 할당할 때.
Member m1 = new Member();
session.setAttribute("m1",m1);
Member m2 = (Member)session.getAttribute("m1");
m2.setId("himan");
m2.setPass("7777");
m2.setPoint(7000);
//2. useBean을 활용하여 session에 할당할 때
%>
<jsp:useBean id="m3" class="jspexp.z01_vo.Member" scope="session">
</jsp:useBean>
<jsp:setProperty property="id" name="m3" value="higirl"/>
<jsp:setProperty property="pass" name="m3" value="8888"/>
<jsp:setProperty property="point" name="m3" value="9000"/>
<%-- ex) useBean을 이용하여 Person객체에 이름,나이,사는 곳을 저장하고 호출하세요. ~14:30

--%>
<body>
	<h3>useBean 활용.</h3>
	<table>
		<tr><th>m2(일반)</th><td><%=m2.getId() %></td></tr>
		<tr><th>m3(useBean)</th>
			<td><jsp:getProperty name="m3" property="id"/></td></tr>
	</table>
<jsp:useBean id="p1" class="jspexp.z01_vo.Person" scope="request">
</jsp:useBean>
<jsp:setProperty property="name" name="p1" value="홍길동"/>
<jsp:setProperty property="age" name="p1" value="25"/>
<jsp:setProperty property="loc" name="p1" value="서울 신림동"/>
	<h3>useBean 활용.(Person)</h3>
	<table>
		<tr><th>이름</th>
			<td><jsp:getProperty property="name" name="p1"/> </td></tr>
		<tr><th>나이</th>
			<td><%=p1.getAge()%> </td></tr>
		<tr><th>사는곳</th>
			<td><jsp:getProperty property="loc" name="p1"/> </td></tr>


	</table>
	
	
</body>
</html>