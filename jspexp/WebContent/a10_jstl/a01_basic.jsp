<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
# JSTL
1. jsp Standard Tag Library : 널리 사용되는 커스텀 태그를
표준으로 만든 태그 라이브러리
2. jstl의 환경 설정.
	1) WebContent\WEB-INF\lib에 jstl-1.2.jar 추가
	2) tag lib를 상단에 선언..
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
3. jstl의 핵심 tag 종류
	1) core  : <c:XXX /> 변수지원, 흐름제어 url처리
	2) fmt   : <fmt:XXX /> 지역, 메시지 형식, 숫자 및 날짜 형식..
	3) x(xml 코어), sql(데이터베이스), fn(함수)	
4. 활용
	1) 변수 설정
		el 변수 값 설정.
		<c:set var="변수명" value="값"  scope="session범위" />
		선언된 변수는 el로 호출할 수 있다. ${변수명}	
		ex) <c:set var = "name" value="홍길동" scope="request"/>
			<h2>이름 : ${name}</h2>
		ex) <%
			request.setAttribute("p", new Person("홍길동",25,"서울신림동");
			%>
		    <c:set var= "p01" value="${p}" />
		    
		    # property : 객체의 속성의 접근하는 메서드를 사용하는 것을 말한다.
		    	그런데, set/get을 제외하고 모두 소문자로 변경하여 활용한다.
		    	public void setName(String name){} 메서드가 있고,
		    	이 객체의 property name를 호출한다는 것은 위 기능 메서드를
		    	호출해서 처리한다는 것이다. setName ==> Name ==> name
		    	최종 name이 property를 의미한다.
		    	el나 jstl에서 호출할 때, 필드명과 동일하기에 필드로 오인하는 경우가
		    	많은데, 필드는 private 접근제어자가 붙어 있어 접근하지 못 한다.
		    	private String name;
		    	public String getName01(){
		    		return name;
		    	}
		    	${p01.name} ==> 에러발생, 필드를 접근하는 것이 아니고,
		    	getName01()이라는 기능 메서드의 property명인 name01로
		    	접근하여야 하기 때문이다. 그러므로, ${p01.name01}로 접근하여
		    	호출할 수 있다.
		    	
		    	
		    	
	2) 객체의 값의 변경.
		<jsp:useBean id="객체참조명" class="@@@">
		<% mvc의 컨트롤에서 선언된 코드, jsp의 scriptlet코드
		request.setAttribute("객체참조명", new 객체명(@@@));
		%>
		<c:set var="변수명" value="${참조명}/new 객체명("")"
	
	
		<c:set target="객체명(bean의 id, session scope의 변수명, 
		    c:set의 var=변수명)" 
			property="프로퍼터이름/set메서드명" value="할당할값"/>
		${객체명.프로퍼티명}
		cf) 바로 el코드로 처리하여도 된다. ${객체명.setName("홍길동")}
		
		ex) <c:set target="p01" property="name" value="마길동"/>
		${p01.name} : 변경된 데이터 확인..
	3) 조건문 처리.
		- 단일조건문
		<c:if test="${el의 변수를 비교/조건 연산식}">
			boolean이 true일 때, 수행할 내용..
		</c:if>	
		- 다중조건문
		<c:choose>
			<c:when test="조건1인경우">조건1이 true일때,</c:when>
			<c:when test="조건2인경우">조건2가 true일때,</c:when>
			// else if가 포함되어 조건1이 아니고, 조건2인 경우이다.
			<c:when test="조건3인경우">조건3이 true일때,</c:when>
			<c:otherwise>위에 조건을 제외한 나머지..</c:otherwise>
		</c:choose>	
		%주의 - when test구문은 앞에 조건을 제외한 내용이다.		 
 
--%>
//
	$(document).ready(function(){
		//$("h3").text("jstl 시작");
	});
</script>
</head>
<body>
	<c:set var = "name" value="홍길동" scope="request"/>
	<%--
	# 객체 설정하는 3가지 형식..
	1. pageContext/request/session/application
	 --%>
	<%
	pageContext.setAttribute("m01", new Member());
	%>
	<c:set target="${m01}" property="id" value="goodman"/> 
	아이디:${m01.id}
	<%--
	2. <c:set var="변수명" value="<%=new 객체명()%>"/>
	 --%> 
	<c:set var="m02" value="<%=new Member() %>"/>
	<c:set target="${m02}" property="id" value="higirl"/>
	<%--
	3. <jsp:useBean..
	 --%>
	
	<jsp:useBean id="mem" class="jspexp.z01_vo.Member"></jsp:useBean>
	<%-- property 형식으로 변경 
		Member mem = new Member();
		mem.setId("himan");
	--%>
	<c:set target="${mem}" property="id" value="himan" />
	<h3>제목</h3>
	<table>
		<tr><th>이름</th><td>${name}</td></tr>
		<tr><th>아이디</th><td>${mem.id}</td></tr>
	</table>
	<%--
	ex) 임의의 변수 num01, num02에 데이터를 할당하여, 사칙연산 결과를 출력 처리하세요.
		jstl과 el 활용
	ex) Product 객체를 속성을 useBean과 jstl로 변경하고, el태그로 속성을 확인하세요.
		~14:45
	 --%>
	<c:set var="num01" value="25"/>
	<c:set var="num02" value="5"/>
	<h3>사칙연산</h3>
	<h4>${num01} + ${num02 } = ${num01 + num02}</h4>
	<h4>${num01} - ${num02 } = ${num01 - num02}</h4>
	<h4>${num01} * ${num02 } = ${num01 * num02}</h4>
	<h4>${num01} / ${num02 } = ${num01 / num02}</h4>
	<h3>객체</h3>
	<jsp:useBean id="pro" class="jspexp.z01_vo.Product"/>
	<c:set target = "${pro}" property="name" value="사과"/>
	<%--
	Product pro = new Product();
	pro.setName("사과");
	
	 --%>
	<c:set target = "${pro}" property="price" value="3000"/>
	<c:set target = "${pro}" property="cnt" value="2"/>
	<table>
		<tr><th>물건명</th><td>${pro.name}</td></tr>
		<tr><th>가격</th><td>${pro.price}</td></tr>
		<tr><th>갯수</th><td>${pro.cnt}</td></tr>
		<tr><td colspan="2">
				<c:if test="${pro.price*pro.cnt>=6000}">
					6000이상이면 1+1행사 대상입니다.
				</c:if>
			</td></tr>
	</table>	
	<%
	request.setAttribute("ran", (int)(Math.random()*101));
	%>
	<%--
	ex) c:set으로 임의의 점수할당 : 60점 이상이면 합격 표시.
	 --%>
	<c:set var="point"  value="${ran}"/>
	<h3>점수:${point }, 결과:<c:if test="${point<60}">불</c:if>합격</h3>
	<h3>등급:
		<c:choose>
			<c:when test="${point>=90}">A</c:when>		
			<c:when test="${point>=80}">B</c:when>		
			<c:when test="${point>=70}">C</c:when>		
			<c:when test="${point>=60}">D</c:when>		
			<c:otherwise>F</c:otherwise>		
		</c:choose>!!
	</h3>
	<%--
	ex1) 물건가격과 갯수를 변수로 선언하고, 해당 데이터가 10만이상일 때, 10%할인
	그외 5만원 5%할인, 그외는 3%할인을 표시하세요.. (계산도 해볼까요??)..
	--%>
	<c:set var="price1" value="30000"/>
	<c:set var="cnt1" value="10"/>
	<h3>물건가격:${price1}</h3>
	<h3>물건갯수:${cnt1}</h3>
	<c:set var = "tot" value="${price1*cnt1}"/>
	<h3>
		<c:choose>
			<c:when test="${tot>=100000}">10%할인<c:set var="dis" value="0.1"/></c:when>
			<c:when test="${tot>=50000}">5%할인<c:set var="dis" value="0.05"/></c:when>
			<c:otherwise>3%할인<c:set var="dis" value="0.03"/></c:otherwise>
		</c:choose>
	</h3>
	<h3>총비용:${tot}, 할인된 금액:${tot-(tot*dis)}</h3>
	
	 
	<%--
	ex2) 위 내용을 form객체에 의해 요청값으로 받아서 처리하세요.
	--%>
	<h3>물건가격 처리</h3>
	<form method="post">
	<table>
		<tr><th>물건명</th><td><input type="text" name="pname"/></td></tr>
		<tr><th>가격</th><td><input type="text" name="price"/></td></tr>
		<tr><th>갯수</th><td><input type="text" name="cnt"/></td></tr>
		<tr><td colspan="2">
			<input type="submit" value="계산"/></td></tr>
	</table>
	</form>
	<c:if test="${not empty param.pname}"> <!-- 입력한 물건명이 있을 때. -->
		<c:set var="price2" value="${param.price}"/>
		<c:set var="cnt2" value="${param.cnt}"/>
		<h3>물건가격:${price2}</h3>
		<h3>물건갯수:${cnt2}</h3>
		<c:set var = "tot2" value="${price2*cnt2}"/>
		<h3>
			<c:choose>
				<c:when test="${tot2>=100000}">10%할인<c:set var="dis2" value="0.1"/></c:when>
				<c:when test="${tot2>=50000}">5%할인<c:set var="dis2" value="0.05"/></c:when>
				<c:otherwise>3%할인<c:set var="dis2" value="0.03"/></c:otherwise>
			</c:choose>
		</h3>
		<h3>${param.pname} 구매 총비용:${tot2}, 할인된 금액:${tot2-(tot2*dis2)}</h3>
	</c:if>		
</body>
</html>





