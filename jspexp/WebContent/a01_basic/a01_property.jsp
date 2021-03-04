<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- html주석 -->
<%-- jsp 주석
최상단에  jsp 페이지에 대한 설정 정보를 선언
1. @ page : 페이지에 대한 선언 Directive라고 한다..
	1) 프로그래밍 언어,
	2) 화면 출력형식:contentType
		ex) text/html : html, 파일전송, excel, pdf등을 전송할 수 있다.
	3) 문자의 encoding방식 : pageEncoding
2. html 코드를 기반으로 하고,
3. 스크립트릿(scriptlet), 표현식(expression), 선언부(Declaration)를 
	통해서 java 코드가 삽입되어 진다.
4. 이 내용을 servlet형식의 자바 클래스로 만들어서, 컴파일과 실행 후, 결과 html을
	만든 후, 	요청한 곳에 stream방식으로 파일을 전송해서 브라우저에서 볼 수 있게
	된다.	
	프로세스 : 
		1) 브라우저 주소에 ip와 페이지를 입력
		2) 서버에 해당하는 페이지를 찾아서
	    3) 아래와 같은 프로세스를 거쳐 클라이언트(브라우저에 전달)
	
	jsp페이지 ==> servlet클래스 ==> html코드 ==> 브라우저에 받아 html랜더링
	서버            서버     서버에서 만들어서 클라이언트 전달        
# 디렉티브(Directive)
1. jsp페이지에 대한 설정 정보를 지정한다.
2. 디렉티브 구문
	1) 형식 <%@ 디렉티브이름 속성=속성값  속성=속성값
3. 제공 디렉티브이름
	1) page :jsp 페이지에 대한 정보를 지정.
		- 문서의 타입, 출력 버퍼의 크기, 에러 페이지 등 정보 지정.
	2) taglib : 사용할 태그 라이브러리를 지정.
		ex) <%@ taglib uri="@@@.@@"
		jstl : 표준 태그 라이브러리 : 기본 태그로 지원되지 않는 내용을
			태그를 지정하고 java코드와 함께 기능 처리를 해준다.
		
	3) include : 다른 페이지를 포함할 때 지정 처리.
		ex) <%@ include file="##.jsp"
# 스크립트 요소
1. 동적으로 출력 결과를 생성하기 위해 사용
2. 스크립트 요소
	1) 표현식(Expression) - 변수를 통해 값을 출력 ex) <%=변수명%>
	2) 스크립트릿(Scriptlet) - 자바 코드를 실행 ex) <% 자바코드 %>를 선를
		선언하여, 자바의 변수를 선언하거나, 조건 반복문들의 로직을
		수행..
	3) 선언부(Declaration) - 자바 메서드(함수)를 정의
		ex) <%! %> 사이에 선언..
# 기본 내장 객체(implicit object)
	1) 웹 프로그래밍에 필요한 기능을 제공하는 객체
	2) jsp에서 별도 선언 없이 사용 가능..
	3) 주요 기본 객체
		- request : 요청 정보를 구할 때, 사용
		- response : 응답과 관련된 설정시 사용
		- out : 직접 응답을 출력할 때 사용
		- session : 세션 관리에 사용       ~ 12:40 설명 및 코딩
 --%>
<%!  // 1. 선언부 : 변수의 선언/메서드의 선언.
	//    cf) 자바 클래스 바로 밑에서 선언하는 부분으로..
	String name="홍길동";
	int plus(int num01, int num02){
		return num01+num02;
	}
%> 
<%
	// 2. 스클립트릿 : 반복문 조건문 등 여러가 프로그램을 처리하는 부분.
	//    cf) 자바 클래스 main() 영역으로 
	int num01= 0;
	name="신길동";  // 값의 변경.
	int result = plus(25,30); //선언할 결과값을 변수에 할당.
	for(int cnt = 1;cnt<=10;cnt++){
%> 
  <%-- 3.익스프레션 : 위 선언부나 스클립틀릿의 데이터 태그와 
  		함께 화면에 출력 --%>
		<h3><%=cnt %>번째 안녕하세요</h3> 
<%
	}
%>
<%--
ex1) 선언부에는 물건가격과 갯수을 매개변수로 받아 총계를 리턴하는 
	메서드 선언. 스클릿트부분에 위 물건명, 가격, 갯수를 할당하고,
	익스프레션 부분에 물건명, 가격, 갯수, 총계는 선언부에 선언한 메서드를
	통해서 처리하여 h3형식으로 출력하세요. 	
--%>
<%!  // 선언 
	String pname;
	int price;
	int cnt;
	int tot(int price, int cnt){
		return price*cnt;
	}
%>
<% // 스클립트릿
	pname = "사과";
	price = 2000;
	cnt = 5;
%>
	<h3>물건명:<%=pname %></h3>
	<h3>가격:<%=price %>원</h3>
	<h3>갯수:<%=cnt %>개</h3>
	<h3>총계:<%=tot(price, cnt) %></h3>
</body>
</html>